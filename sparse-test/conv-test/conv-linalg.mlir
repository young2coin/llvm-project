#map = affine_map<(d0, d1, d2, d3) -> (0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "onnx-mlir.symbol-postfix" = "model"} {
  func.func @main_graph(%arg0: tensor<1x1x28x28xf32> {onnx.name = "input"}) -> (tensor<1x1x27x27xf32> {onnx.name = "output"}) {
    %cst = arith.constant dense<[[[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]]]> : tensor<1x1x2x2xf32>
    %cst_0 = arith.constant dense<0.000000e+00> : tensor<1xf32>
    %c2 = arith.constant 2 : index
    %c2_1 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c0_2 = arith.constant 0 : index
    %c0_3 = arith.constant 0 : index
    %c0_4 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c1_5 = arith.constant 1 : index
    %c0_6 = arith.constant 0 : index
    %c1_7 = arith.constant 1 : index
    %c28 = arith.constant 28 : index
    %c1_8 = arith.constant 1 : index
    %c1_9 = arith.constant 1 : index
    %c1_10 = arith.constant 1 : index
    %c2_11 = arith.constant 2 : index
    %c26 = arith.constant 26 : index
    %c27 = arith.constant 27 : index
    %c28_12 = arith.constant 28 : index
    %c1_13 = arith.constant 1 : index
    %c1_14 = arith.constant 1 : index
    %c1_15 = arith.constant 1 : index
    %c2_16 = arith.constant 2 : index
    %c26_17 = arith.constant 26 : index
    %c27_18 = arith.constant 27 : index
    %cst_19 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %0 = tensor.empty() : tensor<1x28x28x1xf32>
    %transposed = linalg.transpose ins(%arg0 : tensor<1x1x28x28xf32>) outs(%0 : tensor<1x28x28x1xf32>) permutation = [0, 2, 3, 1] 
    %cst_20 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %1 = tensor.empty() : tensor<1x2x2x1xf32>
    %transposed_21 = linalg.transpose ins(%cst : tensor<1x1x2x2xf32>) outs(%1 : tensor<1x2x2x1xf32>) permutation = [0, 2, 3, 1] 
    %2 = tensor.empty() : tensor<1x27x27x1xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%cst_0 : tensor<1xf32>) outs(%2 : tensor<1x27x27x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x27x27x1xf32>
    %4 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%transposed, %transposed_21 : tensor<1x28x28x1xf32>, tensor<1x2x2x1xf32>) outs(%3 : tensor<1x27x27x1xf32>) -> tensor<1x27x27x1xf32>
    %cst_22 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %5 = tensor.empty() : tensor<1x1x27x27xf32>
    %transposed_23 = linalg.transpose ins(%4 : tensor<1x27x27x1xf32>) outs(%5 : tensor<1x1x27x27xf32>) permutation = [0, 3, 1, 2] 
    return %transposed_23 : tensor<1x1x27x27xf32>
  }
  func.func @main() -> i32 {
    %0 = tensor.empty() : tensor<1x1x28x28xf32>
    %1 = call @main_graph(%0) : (tensor<1x1x28x28xf32>) -> tensor<1x1x27x27xf32>
    %c0_i32 = arith.constant 0 : i32
    return %c0_i32 : i32
  }
}

