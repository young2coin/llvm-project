//===- MemRefToEmitC.cpp - MemRef to EmitC conversion ---------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements a pass to convert memref ops into emitc ops.
//
//===----------------------------------------------------------------------===//

#include "mlir/Conversion/MemRefToEmitC/MemRefToEmitCPass.h"

#include "mlir/Conversion/MemRefToEmitC/MemRefToEmitC.h"
#include "mlir/Dialect/EmitC/IR/EmitC.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Transforms/DialectConversion.h"

#include "MemRefBuilder.h"
#include "MemRefDescriptor.h"


namespace mlir {
#define GEN_PASS_DEF_CONVERTMEMREFTOEMITC
#include "mlir/Conversion/Passes.h.inc"
} // namespace mlir

using namespace mlir;

namespace {
struct ConvertMemRefToEmitCPass
    : public impl::ConvertMemRefToEmitCBase<ConvertMemRefToEmitCPass> {
  void runOnOperation() override {
    TypeConverter converter;

    // Fallback for other types.
    converter.addConversion([](Type type) -> std::optional<Type> {
      if (isa<MemRefType>(type))
        return {};
      return type;
    });

    //Materialization Callback
    converter.addArgumentMaterialization(
      [&](OpBuilder &builder, UnrankedMemRefType resultType, ValueRange inputs,
          Location loc) -> std::optional<Value> {
        if (inputs.size() == 1)
          return std::nullopt;
        return UnrankedMemRefDescriptortest::createpack(builder, loc, converter, resultType,
                                              inputs);
      });
    converter.addArgumentMaterialization([&](OpBuilder &builder, MemRefType resultType,
                                 ValueRange inputs,
                                 Location loc) -> std::optional<Value> {
    // TODO: bare ptr conversion could be handled here but we would need a way
    // to distinguish between FuncOp and other regions.
    if (inputs.size() == 1)
      return std::nullopt;
    return MemRefDescriptortest::createpack(builder, loc, converter, resultType, inputs);
  });
    converter.addSourceMaterialization([&](OpBuilder &builder, Type resultType,
                               ValueRange inputs,
                               Location loc) -> std::optional<Value> {
    if (inputs.size() != 1)
      return std::nullopt;

    return builder.create<UnrealizedConversionCastOp>(loc, resultType, inputs)
        .getResult(0);
  });
    converter.addTargetMaterialization([&](OpBuilder &builder, Type resultType,
                               ValueRange inputs,
                               Location loc) -> std::optional<Value> {
    if (inputs.size() != 1)
      return std::nullopt;

    return builder.create<UnrealizedConversionCastOp>(loc, resultType, inputs)
        .getResult(0);
  });



    populateMemRefToEmitCTypeConversion(converter);

    RewritePatternSet patterns(&getContext());
    populateMemRefToEmitCConversionPatterns(patterns, converter);

    ConversionTarget target(getContext());
    target.addIllegalDialect<memref::MemRefDialect>();
    target.addLegalDialect<emitc::EmitCDialect>();

    if (failed(applyPartialConversion(getOperation(), target,
                                      std::move(patterns))))
      return signalPassFailure();
  }
};
} // namespace
