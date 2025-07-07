module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "onnx-mlir.symbol-postfix" = "model"} {
  func.func @main_graph(%arg0: tensor<1x1x4x4xf32> {onnx.name = "input"}) -> (tensor<1x1x3x3xf32> {onnx.name = "output"}) {
    %0 = "tosa.const"() <{value = dense<[[[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]]]> : tensor<1x1x2x2xf32>}> : () -> tensor<1x1x2x2xf32>
    %1 = "tosa.const"() <{value = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %c2 = arith.constant 2 : index
    %c2_0 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %c1_1 = arith.constant 1 : index
    %c1_2 = arith.constant 1 : index
    %c1_3 = arith.constant 1 : index
    %c1_4 = arith.constant 1 : index
    %c1_5 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c1_6 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c1_7 = arith.constant 1 : index
    %c2_8 = arith.constant 2 : index
    %c1_9 = arith.constant 1 : index
    %c2_10 = arith.constant 2 : index
    %c2_11 = arith.constant 2 : index
    %c6 = arith.constant 6 : index
    %c4_12 = arith.constant 4 : index
    %c2_13 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4_14 = arith.constant 4 : index
    %c1_15 = arith.constant 1 : index
    %c2_16 = arith.constant 2 : index
    %c1_17 = arith.constant 1 : index
    %c2_18 = arith.constant 2 : index
    %c2_19 = arith.constant 2 : index
    %c6_20 = arith.constant 6 : index
    %c4_21 = arith.constant 4 : index
    %c2_22 = arith.constant 2 : index
    %c3_23 = arith.constant 3 : index
    %2 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32>
    %3 = tosa.transpose %arg0, %2 : (tensor<1x1x4x4xf32>, tensor<4xi32>) -> tensor<1x4x4x1xf32>
    %4 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32>
    %5 = tosa.transpose %0, %4 : (tensor<1x1x2x2xf32>, tensor<4xi32>) -> tensor<1x2x2x1xf32>
    %6 = tosa.conv2d %3, %5, %1 {dilation = array<i64: 1, 1>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 2, 2>} : (tensor<1x4x4x1xf32>, tensor<1x2x2x1xf32>, tensor<1xf32>) -> tensor<1x3x3x1xf32>
    %7 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32>
    %8 = tosa.transpose %6, %7 : (tensor<1x3x3x1xf32>, tensor<4xi32>) -> tensor<1x1x3x3xf32>
    return %8 : tensor<1x1x3x3xf32>
  }
}

