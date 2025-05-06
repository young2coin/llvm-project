//===- MemRefBuilder.cpp - Helper for LLVM MemRef equivalents -------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "MemRefBuilder.h"
#include "MemRefDescriptor.h"
#include "mlir/Conversion/LLVMCommon/TypeConverter.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/Dialect/LLVMIR/LLVMTypes.h"
#include "mlir/IR/Builders.h"
#include "llvm/Support/MathExtras.h"

using namespace mlir;

//===----------------------------------------------------------------------===//
// MemRefDescriptor implementation
//===----------------------------------------------------------------------===//

/// Construct a helper for the given descriptor value.
MemRefDescriptor_func::MemRefDescriptor_func(Value descriptor)
    : StructBuilder(descriptor) {
  assert(value != nullptr && "value cannot be null");
  indexType = cast<LLVM::LLVMStructType>(value.getType())
                  .getBody()[kOffsetPosInMemRefDescriptor];
}

/// Builds IR creating an `undef` value of the descriptor type.
MemRefDescriptor_func MemRefDescriptor_func::createundef(OpBuilder &builder, Location loc,
                                         Type descriptorType) {

  Value descriptor = builder.create<LLVM::UndefOp>(loc, descriptorType);
  return MemRefDescriptor_func(descriptor);
}

/// Builds IR creating a MemRef descriptor that represents `type` and
/// populates it with static shape and stride information extracted from the
/// type.
MemRefDescriptor_func
MemRefDescriptor_func::createfromStaticShape(OpBuilder &builder, Location loc,
                                  const TypeConverter &typeConverter,
                                  MemRefType type, Value memory) {
  return createfromStaticShape(builder, loc, typeConverter, type, memory, memory);
}

MemRefDescriptor_func MemRefDescriptor_func::createfromStaticShape(
    OpBuilder &builder, Location loc, const TypeConverter &typeConverter,
    MemRefType type, Value memory, Value alignedMemory) {
  assert(type.hasStaticShape() && "unexpected dynamic shape");

  // Extract all strides and offsets and verify they are static.
  auto [strides, offset] = getStridesAndOffset(type);
  assert(!ShapedType::isDynamic(offset) && "expected static offset");
  assert(!llvm::any_of(strides, ShapedType::isDynamic) &&
         "expected static strides");

  auto convertedType = typeConverter.convertType(type);
  assert(convertedType && "unexpected failure in memref type conversion");

  auto descr = MemRefDescriptor_func::createundef(builder, loc, convertedType);
  descr.createsetAllocatedPtr(builder, loc, memory);
  descr.createsetAlignedPtr(builder, loc, alignedMemory);
  descr.createsetConstantOffset(builder, loc, offset);

  // Fill in sizes and strides
  for (unsigned i = 0, e = type.getRank(); i != e; ++i) {
    descr.createsetConstantSize(builder, loc, i, type.getDimSize(i));
    descr.createsetConstantStride(builder, loc, i, strides[i]);
  }
  return descr;
}

/// Builds IR extracting the allocated pointer from the descriptor.
Value MemRefDescriptor_func::createallocatedPtr(OpBuilder &builder, Location loc) {
  return extractPtr(builder, loc, kAllocatedPtrPosInMemRefDescriptor);
}

/// Builds IR inserting the allocated pointer into the descriptor.
void MemRefDescriptor_func::createsetAllocatedPtr(OpBuilder &builder, Location loc,
                                       Value ptr) {
  setPtr(builder, loc, kAllocatedPtrPosInMemRefDescriptor, ptr);
}

/// Builds IR extracting the aligned pointer from the descriptor.
Value MemRefDescriptor_func::createalignedPtr(OpBuilder &builder, Location loc) {
  return extractPtr(builder, loc, kAlignedPtrPosInMemRefDescriptor);
}

/// Builds IR inserting the aligned pointer into the descriptor.
void MemRefDescriptor_func::createsetAlignedPtr(OpBuilder &builder, Location loc,
                                     Value ptr) {
  setPtr(builder, loc, kAlignedPtrPosInMemRefDescriptor, ptr);
}

// Creates a constant Op producing a value of `resultType` from an index-typed
// integer attribute.
static Value createIndexAttrConstant(OpBuilder &builder, Location loc,
                                     Type resultType, int64_t value) {
  return builder.create<LLVM::ConstantOp>(loc, resultType,
                                          builder.getIndexAttr(value));
}

/// Builds IR extracting the offset from the descriptor.
Value MemRefDescriptor_func::createoffset(OpBuilder &builder, Location loc) {
  return builder.create<LLVM::ExtractValueOp>(loc, value,
                                              kOffsetPosInMemRefDescriptor);
}

/// Builds IR inserting the offset into the descriptor.
void MemRefDescriptor_func::createsetOffset(OpBuilder &builder, Location loc,
                                 Value offset) {
  value = builder.create<LLVM::InsertValueOp>(loc, value, offset,
                                              kOffsetPosInMemRefDescriptor);
}

/// Builds IR inserting the offset into the descriptor.
void MemRefDescriptor_func::createsetConstantOffset(OpBuilder &builder, Location loc,
                                         uint64_t offset) {
  createsetOffset(builder, loc,
            createIndexAttrConstant(builder, loc, indexType, offset));
}

/// Builds IR extracting the pos-th size from the descriptor.
Value MemRefDescriptor_func::createsize(OpBuilder &builder, Location loc, unsigned pos) {
  return builder.create<LLVM::ExtractValueOp>(
      loc, value, ArrayRef<int64_t>({kSizePosInMemRefDescriptor, pos}));
}

Value MemRefDescriptor_func::createsize(OpBuilder &builder, Location loc, Value pos,
                             int64_t rank) {
  auto arrayTy = LLVM::LLVMArrayType::get(indexType, rank);

  auto ptrTy = LLVM::LLVMPointerType::get(builder.getContext());

  // Copy size values to stack-allocated memory.
  auto one = createIndexAttrConstant(builder, loc, indexType, 1);
  auto sizes = builder.create<LLVM::ExtractValueOp>(
      loc, value, llvm::ArrayRef<int64_t>({kSizePosInMemRefDescriptor}));
  auto sizesPtr = builder.create<LLVM::AllocaOp>(loc, ptrTy, arrayTy, one,
                                                 /*alignment=*/0);
  builder.create<LLVM::StoreOp>(loc, sizes, sizesPtr);

  // Load an return size value of interest.
  auto resultPtr = builder.create<LLVM::GEPOp>(loc, ptrTy, arrayTy, sizesPtr,
                                               ArrayRef<LLVM::GEPArg>{0, pos});
  return builder.create<LLVM::LoadOp>(loc, indexType, resultPtr);
}

/// Builds IR inserting the pos-th size into the descriptor
void MemRefDescriptor_func::createsetSize(OpBuilder &builder, Location loc, unsigned pos,
                               Value size) {
  value = builder.create<LLVM::InsertValueOp>(
      loc, value, size, ArrayRef<int64_t>({kSizePosInMemRefDescriptor, pos}));
}

void MemRefDescriptor_func::createsetConstantSize(OpBuilder &builder, Location loc,
                                       unsigned pos, uint64_t size) {
  createsetSize(builder, loc, pos,
          createIndexAttrConstant(builder, loc, indexType, size));
}

/// Builds IR extracting the pos-th stride from the descriptor.
Value MemRefDescriptor_func::createstride(OpBuilder &builder, Location loc, unsigned pos) {
  return builder.create<LLVM::ExtractValueOp>(
      loc, value, ArrayRef<int64_t>({kStridePosInMemRefDescriptor, pos}));
}

/// Builds IR inserting the pos-th stride into the descriptor
void MemRefDescriptor_func::createsetStride(OpBuilder &builder, Location loc, unsigned pos,
                                 Value stride) {
  value = builder.create<LLVM::InsertValueOp>(
      loc, value, stride,
      ArrayRef<int64_t>({kStridePosInMemRefDescriptor, pos}));
}

void MemRefDescriptor_func::createsetConstantStride(OpBuilder &builder, Location loc,
                                         unsigned pos, uint64_t stride) {
  createsetStride(builder, loc, pos,
            createIndexAttrConstant(builder, loc, indexType, stride));
}

//LLVM::LLVMPointerType MemRefDescriptor::getElementPtrType() {
//  return cast<LLVM::LLVMPointerType>(
//      cast<LLVM::LLVMStructType>(value.getType())
//          .getBody()[kAlignedPtrPosInMemRefDescriptor]);
//}


/// Creates a MemRef descriptor structure from a list of individual values
/// composing that descriptor, in the following order:
/// - allocated pointer;
/// - aligned pointer;
/// - offset;
/// - <rank> sizes;
/// - <rank> shapes;
/// where <rank> is the MemRef rank as provided in `type`.
Value MemRefDescriptor_func::createpack(OpBuilder &builder, Location loc,
                             const TypeConverter &converter,
                             MemRefType type, ValueRange values) {
  Type llvmType = converter.convertType(type);
  auto d = MemRefDescriptor_func::createundef(builder, loc, llvmType);

  d.createsetAllocatedPtr(builder, loc, values[kAllocatedPtrPosInMemRefDescriptor]);
  d.createsetAlignedPtr(builder, loc, values[kAlignedPtrPosInMemRefDescriptor]);
  d.createsetOffset(builder, loc, values[kOffsetPosInMemRefDescriptor]);

  int64_t rank = type.getRank();
  for (unsigned i = 0; i < rank; ++i) {
    d.createsetSize(builder, loc, i, values[kSizePosInMemRefDescriptor + i]);
    d.createsetStride(builder, loc, i, values[kSizePosInMemRefDescriptor + rank + i]);
  }

  return d;
}

/// Builds IR extracting individual elements of a MemRef descriptor structure
/// and returning them as `results` list.
void MemRefDescriptor_func::createunpack(OpBuilder &builder, Location loc, Value packed,
                              MemRefType type,
                              SmallVectorImpl<Value> &results) {
  int64_t rank = type.getRank();
  results.reserve(results.size() + creategetNumUnpackedValues(type));

  MemRefDescriptor_func d(packed);
  results.push_back(d.createallocatedPtr(builder, loc));
  results.push_back(d.createalignedPtr(builder, loc));
  results.push_back(d.createoffset(builder, loc));
  for (int64_t i = 0; i < rank; ++i)
    results.push_back(d.createsize(builder, loc, i));
  for (int64_t i = 0; i < rank; ++i)
    results.push_back(d.createstride(builder, loc, i));
}

/// Returns the number of non-aggregate values that would be produced by
/// `unpack`.
unsigned MemRefDescriptor_func::creategetNumUnpackedValues(MemRefType type) {
  // Two pointers, offset, <rank> sizes, <rank> shapes.
  return 3 + 2 * type.getRank();
}

//===----------------------------------------------------------------------===//
// MemRefDescriptorView implementation.
//===----------------------------------------------------------------------===//

MemRefDescriptorView_func::MemRefDescriptorView_func(ValueRange range)
    : rank((range.size() - kSizePosInMemRefDescriptor) / 2), elements(range) {}

Value MemRefDescriptorView_func::createallocatedPtr() {
  return elements[kAllocatedPtrPosInMemRefDescriptor];
}

Value MemRefDescriptorView_func::createalignedPtr() {
  return elements[kAlignedPtrPosInMemRefDescriptor];
}

Value MemRefDescriptorView_func::createoffset() {
  return elements[kOffsetPosInMemRefDescriptor];
}

Value MemRefDescriptorView_func::createsize(unsigned pos) {
  return elements[kSizePosInMemRefDescriptor + pos];
}

Value MemRefDescriptorView_func::createstride(unsigned pos) {
  return elements[kSizePosInMemRefDescriptor + rank + pos];
}

//===----------------------------------------------------------------------===//
// UnrankedMemRefDescriptor implementation
//===----------------------------------------------------------------------===//

/// Construct a helper for the given descriptor value.
UnrankedMemRefDescriptor_func::UnrankedMemRefDescriptor_func(Value descriptor)
    : StructBuilder(descriptor) {}

/// Builds IR creating an `undef` value of the descriptor type.
UnrankedMemRefDescriptor_func UnrankedMemRefDescriptor_func::createundef(OpBuilder &builder,
                                                         Location loc,
                                                         Type descriptorType) {
  Value descriptor = builder.create<LLVM::UndefOp>(loc, descriptorType);
  return UnrankedMemRefDescriptor_func(descriptor);
}
Value UnrankedMemRefDescriptor_func::createrank(OpBuilder &builder, Location loc) const {
  return extractPtr(builder, loc, kRankInUnrankedMemRefDescriptor);
}
void UnrankedMemRefDescriptor_func::createsetRank(OpBuilder &builder, Location loc,
                                       Value v) {
  setPtr(builder, loc, kRankInUnrankedMemRefDescriptor, v);
}
Value UnrankedMemRefDescriptor_func::creatememRefDescPtr(OpBuilder &builder,
                                              Location loc) const {
  return extractPtr(builder, loc, kPtrInUnrankedMemRefDescriptor);
}
void UnrankedMemRefDescriptor_func::createsetMemRefDescPtr(OpBuilder &builder,
                                                Location loc, Value v) {
  setPtr(builder, loc, kPtrInUnrankedMemRefDescriptor, v);
}

/// Builds IR populating an unranked MemRef descriptor structure from a list
/// of individual constituent values in the following order:
/// - rank of the memref;
/// - pointer to the memref descriptor.
Value UnrankedMemRefDescriptor_func::createpack(OpBuilder &builder, Location loc,
                                     const TypeConverter &converter,
                                     UnrankedMemRefType type,
                                     ValueRange values) {
  Type llvmType = converter.convertType(type);
  auto d = UnrankedMemRefDescriptor_func::createundef(builder, loc, llvmType);

  d.createsetRank(builder, loc, values[kRankInUnrankedMemRefDescriptor]);
  d.createsetMemRefDescPtr(builder, loc, values[kPtrInUnrankedMemRefDescriptor]);
  return d;
}

/// Builds IR extracting individual elements that compose an unranked memref
/// descriptor and returns them as `results` list.
void UnrankedMemRefDescriptor_func::createunpack(OpBuilder &builder, Location loc,
                                      Value packed,
                                      SmallVectorImpl<Value> &results) {
  UnrankedMemRefDescriptor_func d(packed);
  results.reserve(results.size() + 2);
  results.push_back(d.createrank(builder, loc));
  results.push_back(d.creatememRefDescPtr(builder, loc));
}



Value UnrankedMemRefDescriptor_func::createallocatedPtr(
    OpBuilder &builder, Location loc, Value memRefDescPtr,
    LLVM::LLVMPointerType elemPtrType) {
  return builder.create<LLVM::LoadOp>(loc, elemPtrType, memRefDescPtr);
}

void UnrankedMemRefDescriptor_func::createsetAllocatedPtr(
    OpBuilder &builder, Location loc, Value memRefDescPtr,
    LLVM::LLVMPointerType elemPtrType, Value createallocatedPtr) {
  builder.create<LLVM::StoreOp>(loc, createallocatedPtr, memRefDescPtr);
}

static std::pair<Value, Type>
castToElemPtrPtr(OpBuilder &builder, Location loc, Value memRefDescPtr,
                 LLVM::LLVMPointerType elemPtrType) {
  auto elemPtrPtrType = LLVM::LLVMPointerType::get(builder.getContext());
  return {memRefDescPtr, elemPtrPtrType};
}

Value UnrankedMemRefDescriptor_func::createalignedPtr(
    OpBuilder &builder, Location loc, const TypeConverter &typeConverter,
    Value memRefDescPtr, LLVM::LLVMPointerType elemPtrType) {
  auto [elementPtrPtr, elemPtrPtrType] =
      castToElemPtrPtr(builder, loc, memRefDescPtr, elemPtrType);

  Value alignedGep =
      builder.create<LLVM::GEPOp>(loc, elemPtrPtrType, elemPtrType,
                                  elementPtrPtr, ArrayRef<LLVM::GEPArg>{1});
  return builder.create<LLVM::LoadOp>(loc, elemPtrType, alignedGep);
}

void UnrankedMemRefDescriptor_func::createsetAlignedPtr(
    OpBuilder &builder, Location loc, const TypeConverter &typeConverter,
    Value memRefDescPtr, LLVM::LLVMPointerType elemPtrType, Value alignedPtr) {
  auto [elementPtrPtr, elemPtrPtrType] =
      castToElemPtrPtr(builder, loc, memRefDescPtr, elemPtrType);

  Value alignedGep =
      builder.create<LLVM::GEPOp>(loc, elemPtrPtrType, elemPtrType,
                                  elementPtrPtr, ArrayRef<LLVM::GEPArg>{1});
  builder.create<LLVM::StoreOp>(loc, alignedPtr, alignedGep);
}

Value UnrankedMemRefDescriptor_func::createoffsetBasePtr(
    OpBuilder &builder, Location loc, const TypeConverter &typeConverter,
    Value memRefDescPtr, LLVM::LLVMPointerType elemPtrType) {
  auto [elementPtrPtr, elemPtrPtrType] =
      castToElemPtrPtr(builder, loc, memRefDescPtr, elemPtrType);

  return builder.create<LLVM::GEPOp>(loc, elemPtrPtrType, elemPtrType,
                                     elementPtrPtr, ArrayRef<LLVM::GEPArg>{2});
}



void UnrankedMemRefDescriptor_func::createsetOffset(OpBuilder &builder, Location loc,
                                         const TypeConverter &typeConverter,
                                         Value memRefDescPtr,
                                         LLVM::LLVMPointerType elemPtrType,
                                         Value offset) {
  Value offsetPtr =
      createoffsetBasePtr(builder, loc, typeConverter, memRefDescPtr, elemPtrType);
  builder.create<LLVM::StoreOp>(loc, offset, offsetPtr);
}










