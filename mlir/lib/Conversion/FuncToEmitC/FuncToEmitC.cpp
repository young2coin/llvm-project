//===- FuncToEmitC.cpp - Func to EmitC Patterns -----------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements patterns to convert the Func dialect to the EmitC
// dialect.
//
//===----------------------------------------------------------------------===//

#include "mlir/Conversion/FuncToEmitC/FuncToEmitC.h"

#include "mlir/Dialect/EmitC/IR/EmitC.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Transforms/DialectConversion.h"

#include "mlir/Conversion/MemRefToEmitC/MemRefToEmitC.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/PatternMatch.h"
#include "llvm/Support/raw_ostream.h"
#include "mlir/IR/Types.h"
#include "mlir/IR/Block.h"
#include "mlir/IR/Value.h"
#include "llvm/Support/Casting.h"
#include "llvm/ADT/SmallVector.h"

using namespace mlir;

//===----------------------------------------------------------------------===//
// Conversion Patterns
//===----------------------------------------------------------------------===//

namespace {
class CallOpConversion final : public OpConversionPattern<func::CallOp> {
public:
  using OpConversionPattern<func::CallOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(func::CallOp callOp, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    // Multiple results func cannot be converted to `emitc.func`.
    if (callOp.getNumResults() > 1)
      return rewriter.notifyMatchFailure(
          callOp, "only functions with zero or one result can be converted");

    rewriter.replaceOpWithNewOp<emitc::CallOp>(callOp, callOp.getResultTypes(),
                                               adaptor.getOperands(),
                                               callOp->getAttrs());

    return success();
  }
};

class FuncOpConversion final : public OpConversionPattern<func::FuncOp> {
public:
  using OpConversionPattern<func::FuncOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(func::FuncOp funcOp, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {

    if (funcOp.getFunctionType().getNumResults() > 1)
      return rewriter.notifyMatchFailure(
          funcOp, "only functions with zero or one result can be converted");

  //获取输出参数以及返回参数
  auto funcType = funcOp.getFunctionType();
  auto inputTypes = funcType.getInputs();
  auto resultTypes = funcType.getResults();
      //创建TypeConverter对象
    //	TypeConverter typeConverter;
    //	//调用populateMemRefToEmitCTypeConversion,将memref转emitc array的逻辑添加到转换器中
    //	mlir::populateMemRefToEmitCTypeConversion(typeConverter);
    SmallVector<Type, 4> convertedInputTypes;//用于存储转换后的InputType
    SmallVector<Type, 4> convertedResultTypes;
    //对input进行类型转换
    //Type convertedinputType;

    bool isconvert = false;
    for (Type inputType : inputTypes){
      if(auto memrefType = inputType.dyn_cast<MemRefType>()){//判断是否是memref类型
        //convertedinputType = typeConverter.convertType(inputType);
        auto convertedinputType = getTypeConverter()->convertType(inputType);
        //llvm::outs() << "convertedinputType: " << convertedinputType << "\n";
        if(!convertedinputType)
          return funcOp.emitError("failed to convert inputType");
        convertedInputTypes.push_back(convertedinputType);
        isconvert = true;
      }
        //convertedinputType = inputType;
      else
        convertedInputTypes.push_back(inputType);
    }
    //对resultType进行转换
    //Type convertedresultType;
    for(Type resultType : resultTypes)
    {
      if(auto memrefType = resultType.dyn_cast<MemRefType>()){
        //convertedresultType = typeConverter.convertType(resultType);
        auto convertedresultType = getTypeConverter()->convertType(resultType);
        //llvm::outs() << "convertedresultType: " << convertedresultType << "\n";
        if(!convertedresultType)
          return funcOp.emitError("failed to convert resultType");
        convertedResultTypes.push_back(convertedresultType);
      }
        //convertedresultType = resultType;	
      else
        convertedResultTypes.push_back(resultType);		
    }
    //如果输入参数发生了转换，则同样的将入口块参数类型进行转换
    if(isconvert){
      //修改入口块参数类型
      //获取入口块
      Block &entryBlock = funcOp.getBody().front(); 
      // entryBlock.getArgument(0).getType() 获取入口块第一个参数类型
      auto args = entryBlock.getArguments();
      // 遍历每个参数并进行类型转换
      for (unsigned i = 0, e = args.size(); i < e; ++i) {
          // 获取当前参数
          Value arg = args[i];
          // 获取参数的类型
          Type BodyType = arg.getType();
          // 使用类型转换器进行类型转换
          auto convertedBodyType = getTypeConverter()->convertType(BodyType);
          // 如果转换成功且类型不一样，则修改参数类型
          if (convertedBodyType && convertedBodyType != BodyType) {
              // 这里可以使用 rewriter 替换参数类型
              arg.setType(convertedBodyType); //类似于指针，对args进行修改会反馈到funcOp
          }
      }

    }
    //创建新的函数类型，使用转换后的inputType和resultType
    //FunctionType newFuncType = FunctionType::get(funcOp.getContext(),specificInputType,specificResultType);
    //FunctionType newFuncType = FunctionType::get(specificResultType,convertedInputTypes,false); //源码中FunctionType *FunctionType::get(Type *ReturnType, ArrayRef<Type*> Params, bool isVarArg)
    FunctionType newFuncType = FunctionType::get(funcOp.getContext(),convertedInputTypes,convertedResultTypes);
    //llvm::outs() << "New Function Type: " << newFuncType << "\n";
    //使用转换后的参数，创建emitc.func
    emitc::FuncOp newFuncOp = rewriter.create<emitc::FuncOp>(
          funcOp.getLoc(), funcOp.getName(), newFuncType);	



    // // Create the converted `emitc.func` op.
    // emitc::FuncOp newFuncOp = rewriter.create<emitc::FuncOp>(
    //     funcOp.getLoc(), funcOp.getName(), funcOp.getFunctionType());

    // Copy over all attributes other than the function name and type.
    for (const auto &namedAttr : funcOp->getAttrs()) {
      if (namedAttr.getName() != funcOp.getFunctionTypeAttrName() &&
          namedAttr.getName() != SymbolTable::getSymbolAttrName())
        newFuncOp->setAttr(namedAttr.getName(), namedAttr.getValue());
    }

    // Add `extern` to specifiers if `func.func` is declaration only.
    if (funcOp.isDeclaration()) {
      ArrayAttr specifiers = rewriter.getStrArrayAttr({"extern"});
      newFuncOp.setSpecifiersAttr(specifiers);
    }

    // Add `static` to specifiers if `func.func` is private but not a
    // declaration.
    if (funcOp.isPrivate() && !funcOp.isDeclaration()) {
      ArrayAttr specifiers = rewriter.getStrArrayAttr({"static"});
      newFuncOp.setSpecifiersAttr(specifiers);
    }

    if (!funcOp.isDeclaration())
      rewriter.inlineRegionBefore(funcOp.getBody(), newFuncOp.getBody(),
                                  newFuncOp.end());
    rewriter.eraseOp(funcOp);

    return success();
  }
};

class ReturnOpConversion final : public OpConversionPattern<func::ReturnOp> {
public:
  using OpConversionPattern<func::ReturnOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(func::ReturnOp returnOp, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    if (returnOp.getNumOperands() > 1)
      return rewriter.notifyMatchFailure(
          returnOp, "only zero or one operand is supported");

    rewriter.replaceOpWithNewOp<emitc::ReturnOp>(
        returnOp,
        returnOp.getNumOperands() ? adaptor.getOperands()[0] : nullptr);
    return success();
  }
};
} // namespace

//===----------------------------------------------------------------------===//
// Pattern population
//===----------------------------------------------------------------------===//

void mlir::populateFuncToEmitCPatterns(RewritePatternSet &patterns, TypeConverter &converter) {
  MLIRContext *ctx = patterns.getContext();

  patterns.add<CallOpConversion, FuncOpConversion, ReturnOpConversion>(converter, ctx);
}
