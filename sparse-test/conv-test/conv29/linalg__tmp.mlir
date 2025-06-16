#map = affine_map<(d0, d1, d2, d3) -> (0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "onnx-mlir.symbol-postfix" = "model"} {
  func.func @main_graph(%arg0: tensor<1x1x29x29xf32> {onnx.name = "input"}) -> (tensor<1x1x27x27xf32> {onnx.name = "output"}) {
    %cst = arith.constant dense<[[[[1.000000e+00, 2.000000e+00, 3.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00], [5.000000e+00, 6.000000e+00, 7.000000e+00]]]]> : tensor<1x1x3x3xf32>
    %cst_0 = arith.constant dense<0.000000e+00> : tensor<1xf32>
    %c3 = arith.constant 3 : index
    %c3_1 = arith.constant 3 : index
    %c0 = arith.constant 0 : index
    %c0_2 = arith.constant 0 : index
    %c0_3 = arith.constant 0 : index
    %c0_4 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c1_5 = arith.constant 1 : index
    %c0_6 = arith.constant 0 : index
    %c1_7 = arith.constant 1 : index
    %c29 = arith.constant 29 : index
    %c1_8 = arith.constant 1 : index
    %c1_9 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3_10 = arith.constant 3 : index
    %c26 = arith.constant 26 : index
    %c27 = arith.constant 27 : index
    %c29_11 = arith.constant 29 : index
    %c1_12 = arith.constant 1 : index
    %c1_13 = arith.constant 1 : index
    %c2_14 = arith.constant 2 : index
    %c3_15 = arith.constant 3 : index
    %c26_16 = arith.constant 26 : index
    %c27_17 = arith.constant 27 : index
    %cst_18 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %0 = tensor.empty() : tensor<1x29x29x1xf32>
    %transposed = linalg.transpose ins(%arg0 : tensor<1x1x29x29xf32>) outs(%0 : tensor<1x29x29x1xf32>) permutation = [0, 2, 3, 1] 
    %cst_19 = arith.constant dense<[0, 2, 3, 1]> : tensor<4xi32>
    %1 = tensor.empty() : tensor<1x3x3x1xf32>
    %transposed_20 = linalg.transpose ins(%cst : tensor<1x1x3x3xf32>) outs(%1 : tensor<1x3x3x1xf32>) permutation = [0, 2, 3, 1] 
    %2 = tensor.empty() : tensor<1x27x27x1xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%cst_0 : tensor<1xf32>) outs(%2 : tensor<1x27x27x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x27x27x1xf32>
    %4 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%transposed, %transposed_20 : tensor<1x29x29x1xf32>, tensor<1x3x3x1xf32>) outs(%3 : tensor<1x27x27x1xf32>) -> tensor<1x27x27x1xf32>
    %cst_21 = arith.constant dense<[0, 3, 1, 2]> : tensor<4xi32>
    %5 = tensor.empty() : tensor<1x1x27x27xf32>
    %transposed_22 = linalg.transpose ins(%4 : tensor<1x27x27x1xf32>) outs(%5 : tensor<1x1x27x27xf32>) permutation = [0, 3, 1, 2] 
    return %transposed_22 : tensor<1x1x27x27xf32>
  }
}

