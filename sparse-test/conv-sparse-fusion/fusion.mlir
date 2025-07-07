#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d6, d1 + d4, d2 + d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>
module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "onnx-mlir.symbol-postfix" = "model"} {
  func.func @main_graph(%arg0: tensor<1x1x28x28xf32> {onnx.name = "input"}) -> (tensor<1x1x27x27xf32> {onnx.name = "output"}) {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<[[[[1.000000e+00], [2.000000e+00]], [[3.000000e+00], [4.000000e+00]]]]> : tensor<1x2x2x1xf32>
    %0 = tensor.empty() : tensor<1x27x27x1xf32>
    %1 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} outs(%0 : tensor<1x27x27x1xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst : f32
    } -> tensor<1x27x27x1xf32>
    %2 = linalg.generic {indexing_maps = [#map1, #map2, #map3], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction", "reduction", "reduction"]} ins(%arg0, %cst_0 : tensor<1x1x28x28xf32>, tensor<1x2x2x1xf32>) outs(%1 : tensor<1x27x27x1xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %5 = arith.mulf %in, %in_1 : f32
      %6 = arith.addf %out, %5 : f32
      linalg.yield %6 : f32
    } -> tensor<1x27x27x1xf32>
    %3 = tensor.empty() : tensor<1x1x27x27xf32>
    %4 = linalg.generic {indexing_maps = [#map4, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%2 : tensor<1x27x27x1xf32>) outs(%3 : tensor<1x1x27x27xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x1x27x27xf32>
    return %4 : tensor<1x1x27x27xf32>
  }
}

