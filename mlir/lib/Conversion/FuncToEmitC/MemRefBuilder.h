//===- MemRefBuilder.h - Helper for LLVM MemRef equivalents -----*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Provides a convenience API for emitting IR that inspects or constructs values
// of LLVM dialect structure type that correspond to ranked or unranked memref.
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_CONVERSION_LLVMCOMMON_MEMREFBUILDER_H
#define MLIR_CONVERSION_LLVMCOMMON_MEMREFBUILDER_H

#include "mlir/Conversion/LLVMCommon/StructBuilder.h"
#include "mlir/IR/OperationSupport.h"

namespace mlir {

//class LLVMTypeConverter;
class TypeConverter;
class MemRefType;
class UnrankedMemRefType;

namespace LLVM {
class LLVMPointerType;
} // namespace LLVM

/// Helper class to produce LLVM dialect operations extracting or inserting
/// elements of a MemRef descriptor. Wraps a Value pointing to the descriptor.
/// The Value may be null, in which case none of the operations are valid.
class MemRefDescriptor_func : public StructBuilder {
public:
  /// Construct a helper for the given descriptor value.
  explicit MemRefDescriptor_func(Value descriptor);
  /// Builds IR creating an `undef` value of the descriptor type.
  static MemRefDescriptor_func createundef(OpBuilder &builder, Location loc,
                                Type descriptorType);
  /// Builds IR creating a MemRef descriptor that represents `type` and
  /// populates it with static shape and stride information extracted from the
  /// type.
  static MemRefDescriptor_func
  createfromStaticShape(OpBuilder &builder, Location loc,
                  const TypeConverter &typeConverter, MemRefType type,
                  Value memory);
  static MemRefDescriptor_func
  createfromStaticShape(OpBuilder &builder, Location loc,
                  const TypeConverter &typeConverter, MemRefType type,
                  Value memory, Value alignedMemory);

  /// Builds IR extracting the allocated pointer from the descriptor.
  Value createallocatedPtr(OpBuilder &builder, Location loc);
  /// Builds IR inserting the allocated pointer into the descriptor.
  void createsetAllocatedPtr(OpBuilder &builder, Location loc, Value ptr);

  /// Builds IR extracting the aligned pointer from the descriptor.
  Value createalignedPtr(OpBuilder &builder, Location loc);

  /// Builds IR inserting the aligned pointer into the descriptor.
  void createsetAlignedPtr(OpBuilder &builder, Location loc, Value ptr);

  /// Builds IR extracting the offset from the descriptor.
  Value createoffset(OpBuilder &builder, Location loc);

  /// Builds IR inserting the offset into the descriptor.
  void createsetOffset(OpBuilder &builder, Location loc, Value offset);
  void createsetConstantOffset(OpBuilder &builder, Location loc, uint64_t offset);

  /// Builds IR extracting the pos-th size from the descriptor.
  Value createsize(OpBuilder &builder, Location loc, unsigned pos);
  Value createsize(OpBuilder &builder, Location loc, Value pos, int64_t rank);

  /// Builds IR inserting the pos-th size into the descriptor
  void createsetSize(OpBuilder &builder, Location loc, unsigned pos, Value size);
  void createsetConstantSize(OpBuilder &builder, Location loc, unsigned pos,
                       uint64_t size);

  /// Builds IR extracting the pos-th size from the descriptor.
  Value createstride(OpBuilder &builder, Location loc, unsigned pos);

  /// Builds IR inserting the pos-th stride into the descriptor
  void createsetStride(OpBuilder &builder, Location loc, unsigned pos, Value stride);
  void createsetConstantStride(OpBuilder &builder, Location loc, unsigned pos,
                         uint64_t stride);

  /// Returns the type of array element in this descriptor.
  Type getIndexType() { return indexType; };

  /// Returns the (LLVM) pointer type this descriptor contains.
  LLVM::LLVMPointerType getElementPtrType();

  /// Builds IR for getting the start address of the buffer represented
  /// by this memref:
  /// `memref.alignedPtr + memref.offset * sizeof(type.getElementType())`.
  /// \note there is no setter for this one since it is derived from alignedPtr
  /// and offset.
  Value createbufferPtr(OpBuilder &builder, Location loc,
                  const TypeConverter &converter, MemRefType type);

  /// Builds IR populating a MemRef descriptor structure from a list of
  /// individual values composing that descriptor, in the following order:
  /// - allocated pointer;
  /// - aligned pointer;
  /// - offset;
  /// - <rank> sizes;
  /// - <rank> shapes;
  /// where <rank> is the MemRef rank as provided in `type`.
  static Value createpack(OpBuilder &builder, Location loc,
                    const TypeConverter &converter, MemRefType type,
                    ValueRange values);

  /// Builds IR extracting individual elements of a MemRef descriptor structure
  /// and returning them as `results` list.
  static void createunpack(OpBuilder &builder, Location loc, Value packed,
                     MemRefType type, SmallVectorImpl<Value> &results);

  /// Returns the number of non-aggregate values that would be produced by
  /// `unpack`.
  static unsigned creategetNumUnpackedValues(MemRefType type);

private:
  // Cached index type.
  Type indexType;
};

/// Helper class allowing the user to access a range of Values that correspond
/// to an unpacked memref descriptor using named accessors. This does not own
/// the values.
class MemRefDescriptorView_func {
public:
  /// Constructs the view from a range of values. Infers the rank from the size
  /// of the range.
  explicit MemRefDescriptorView_func(ValueRange range);

  /// Returns the allocated pointer Value.
  Value createallocatedPtr();

  /// Returns the aligned pointer Value.
  Value createalignedPtr();

  /// Returns the offset Value.
  Value createoffset();

  /// Returns the pos-th size Value.
  Value createsize(unsigned pos);

  /// Returns the pos-th stride Value.
  Value createstride(unsigned pos);

private:
  /// Rank of the memref the descriptor is pointing to.
  int rank;
  /// Underlying range of Values.
  ValueRange elements;
};

class UnrankedMemRefDescriptor_func : public StructBuilder {
public:
  /// Construct a helper for the given descriptor value.
  explicit UnrankedMemRefDescriptor_func(Value descriptor);
  /// Builds IR creating an `undef` value of the descriptor type.
  static UnrankedMemRefDescriptor_func createundef(OpBuilder &builder, Location loc,
                                        Type descriptorType);

  /// Builds IR extracting the rank from the descriptor
  Value createrank(OpBuilder &builder, Location loc) const;
  /// Builds IR setting the rank in the descriptor
  void createsetRank(OpBuilder &builder, Location loc, Value value);
  /// Builds IR extracting ranked memref descriptor ptr
  Value creatememRefDescPtr(OpBuilder &builder, Location loc) const;
  /// Builds IR setting ranked memref descriptor ptr
  void createsetMemRefDescPtr(OpBuilder &builder, Location loc, Value value);

  /// Builds IR populating an unranked MemRef descriptor structure from a list
  /// of individual constituent values in the following order:
  /// - rank of the memref;
  /// - pointer to the memref descriptor.
  static Value createpack(OpBuilder &builder, Location loc,
                    const TypeConverter &converter, UnrankedMemRefType type,
                    ValueRange values);

  /// Builds IR extracting individual elements that compose an unranked memref
  /// descriptor and returns them as `results` list.
  static void createunpack(OpBuilder &builder, Location loc, Value packed,
                     SmallVectorImpl<Value> &results);

  /// Returns the number of non-aggregate values that would be produced by
  /// `unpack`.
  static unsigned creategetNumUnpackedValues() { return 2; }

  /// Builds IR computing the sizes in bytes (suitable for opaque allocation)
  /// and appends the corresponding values into `sizes`. `addressSpaces`
  /// which must have the same length as `values`, is needed to handle layouts
  /// where sizeof(ptr addrspace(N)) != sizeof(ptr addrspace(0)).
  static void computeSizes(OpBuilder &builder, Location loc,
                           const TypeConverter &typeConverter,
                           ArrayRef<UnrankedMemRefDescriptor_func> values,
                           ArrayRef<unsigned> addressSpaces,
                           SmallVectorImpl<Value> &sizes);

  /// TODO: The following accessors don't take alignment rules between elements
  /// of the descriptor struct into account. For some architectures, it might be
  /// necessary to extend them and to use `llvm::DataLayout` contained in
  /// `LLVMTypeConverter`.

  /// Builds IR extracting the allocated pointer from the descriptor.
  static Value createallocatedPtr(OpBuilder &builder, Location loc,
                            Value memRefDescPtr,
                            LLVM::LLVMPointerType elemPtrType);
  /// Builds IR inserting the allocated pointer into the descriptor.
  static void createsetAllocatedPtr(OpBuilder &builder, Location loc,
                              Value memRefDescPtr,
                              LLVM::LLVMPointerType elemPtrType,
                              Value allocatedPtr);

  /// Builds IR extracting the aligned pointer from the descriptor.
  static Value createalignedPtr(OpBuilder &builder, Location loc,
                          const TypeConverter &typeConverter,
                          Value memRefDescPtr,
                          LLVM::LLVMPointerType elemPtrType);
  /// Builds IR inserting the aligned pointer into the descriptor.
  static void createsetAlignedPtr(OpBuilder &builder, Location loc,
                            const TypeConverter &typeConverter,
                            Value memRefDescPtr,
                            LLVM::LLVMPointerType elemPtrType,
                            Value alignedPtr);

  /// Builds IR for getting the pointer to the offset's location.
  /// Returns a pointer to a convertType(index), which points to the beggining
  /// of a struct {index, index[rank], index[rank]}.
  static Value createoffsetBasePtr(OpBuilder &builder, Location loc,
                             const TypeConverter &typeConverter,
                             Value memRefDescPtr,
                             LLVM::LLVMPointerType elemPtrType);
  /// Builds IR extracting the offset from the descriptor.
  static Value createoffset(OpBuilder &builder, Location loc,
                      const TypeConverter &typeConverter,
                      Value memRefDescPtr, LLVM::LLVMPointerType elemPtrType);
  /// Builds IR inserting the offset into the descriptor.
  static void createsetOffset(OpBuilder &builder, Location loc,
                        const TypeConverter &typeConverter,
                        Value memRefDescPtr, LLVM::LLVMPointerType elemPtrType,
                        Value offset);

  /// Builds IR extracting the pointer to the first element of the size array.
  static Value createsizeBasePtr(OpBuilder &builder, Location loc,
                           const TypeConverter &typeConverter,
                           Value memRefDescPtr,
                           LLVM::LLVMPointerType elemPtrType);
  /// Builds IR extracting the size[index] from the descriptor.
  static Value createsize(OpBuilder &builder, Location loc,
                    const TypeConverter &typeConverter, Value sizeBasePtr,
                    Value index);
  /// Builds IR inserting the size[index] into the descriptor.
  static void createsetSize(OpBuilder &builder, Location loc,
                      const TypeConverter &typeConverter, Value sizeBasePtr,
                      Value index, Value size);

  /// Builds IR extracting the pointer to the first element of the stride array.
  static Value createstrideBasePtr(OpBuilder &builder, Location loc,
                             const TypeConverter &typeConverter,
                             Value sizeBasePtr, Value rank);
  /// Builds IR extracting the stride[index] from the descriptor.
  static Value createstride(OpBuilder &builder, Location loc,
                      const TypeConverter &typeConverter,
                      Value strideBasePtr, Value index, Value stride);
  /// Builds IR inserting the stride[index] into the descriptor.
  static void createsetStride(OpBuilder &builder, Location loc,
                        const TypeConverter &typeConverter,
                        Value strideBasePtr, Value index, Value stride);
};

} // namespace mlir

#endif // MLIR_CONVERSION_LLVMCOMMON_MEMREFBUILDER_H
