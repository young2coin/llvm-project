#map = affine_map<(d0, d1, d2, d3) -> (d0, d3, d1, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (0)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map4 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map5 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
#map6 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>
module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "onnx-mlir.symbol-postfix" = "model"} {
  func.func @main_graph(%arg0: tensor<1x28x28x1xf32> {onnx.name = "input"}) -> (tensor<1x26x26x1xf32> {onnx.name = "output"}) {
    %cst = arith.constant dense<[[[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]]]> : tensor<1x1x2x2xf32>
    %cst_0 = arith.constant dense<0.000000e+00> : tensor<1xf32>
    %1 = tensor.empty() : tensor<1x28x28x1xf32>
    %3 = tensor.empty() : tensor<1x2x2x1xf32>
    %5 = tensor.empty() : tensor<1x27x27x1xf32>
    %26 = tensor.empty() : tensor<1x26x26x1xf32>
    %6 = linalg.generic {indexing_maps = [#map3, #map4, #map5], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction", "reduction", "reduction"]} ins(%arg0, %3 : tensor<1x28x28x1xf32>, tensor<1x2x2x1xf32>) outs(%5 : tensor<1x27x27x1xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %9 = arith.mulf %in, %in_1 : f32
      %10 = arith.addf %out, %9 : f32
      linalg.yield %10 : f32
    } -> tensor<1x27x27x1xf32>
    %7 = linalg.generic {indexing_maps = [#map3, #map4, #map5], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction", "reduction", "reduction"]} ins(%6, %3 : tensor<1x27x27x1xf32>, tensor<1x2x2x1xf32>) outs(%26 : tensor<1x26x26x1xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %9 = arith.mulf %in, %in_1 : f32
      %10 = arith.addf %out, %9 : f32
      linalg.yield %10 : f32
    } -> tensor<1x26x26x1xf32>    
    return %7 : tensor<1x26x26x1xf32>
  }
}

