//===- FuncToEmitCPass.cpp - Func to EmitC Pass -----------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements a pass to convert the Func dialect to the EmitC dialect.
//
//===----------------------------------------------------------------------===//

#include "mlir/Conversion/FuncToEmitC/FuncToEmitCPass.h"
#include "mlir/Conversion/MemRefToEmitC/MemRefToEmitC.h"
#include "MemRefBuilder.h"
#include "MemRefDescriptor.h"
#include "mlir/Conversion/FuncToEmitC/FuncToEmitC.h"
#include "mlir/Dialect/EmitC/IR/EmitC.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Transforms/DialectConversion.h"

namespace mlir {
#define GEN_PASS_DEF_CONVERTFUNCTOEMITC
#include "mlir/Conversion/Passes.h.inc"
} // namespace mlir

using namespace mlir;

namespace {
struct ConvertFuncToEmitC
    : public impl::ConvertFuncToEmitCBase<ConvertFuncToEmitC> {
  void runOnOperation() override;
};
} // namespace

void ConvertFuncToEmitC::runOnOperation() {

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
        return UnrankedMemRefDescriptor_func::createpack(builder, loc, converter, resultType,
                                              inputs);
      });
    converter.addArgumentMaterialization([&](OpBuilder &builder, MemRefType resultType,
                                 ValueRange inputs,
                                 Location loc) -> std::optional<Value> {
    // TODO: bare ptr conversion could be handled here but we would need a way
    // to distinguish between FuncOp and other regions.
    if (inputs.size() == 1)
      return std::nullopt;
    return MemRefDescriptor_func::createpack(builder, loc, converter, resultType, inputs);
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
//  populateMemRefToEmitCConversionPatterns(patterns, converter);  // 绑定模式与转换器
//  populateFuncToEmitCPatterns(patterns);  // 添加 func 相关的转换模式
  populateFuncToEmitCPatterns(patterns, converter);
   
  ConversionTarget target(getContext());
  target.addLegalDialect<emitc::EmitCDialect>();
  target.addIllegalOp<func::CallOp, func::FuncOp, func::ReturnOp>();

//  RewritePatternSet patterns(&getContext());
//  populateFuncToEmitCPatterns(patterns);

  if (failed(
          applyPartialConversion(getOperation(), target, std::move(patterns))))
    signalPassFailure();


  // ConversionTarget target(getContext());

  // target.addLegalDialect<emitc::EmitCDialect>();
  // target.addIllegalOp<func::CallOp, func::FuncOp, func::ReturnOp>();

  // RewritePatternSet patterns(&getContext());
  // populateFuncToEmitCPatterns(patterns);

  // if (failed(
  //         applyPartialConversion(getOperation(), target, std::move(patterns))))
  //   signalPassFailure();
}
