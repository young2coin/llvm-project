#map = affine_map<(d0, d1, d2, d3) -> (d0, d3, d1, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (0)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 * 2 + d4, d2 * 2 + d5, d6)>
#map4 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map5 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
#map6 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>
module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "onnx-mlir.symbol-postfix" = "model"} {
  func.func @main_graph(%arg0: tensor<1x1x4x4xf32> {onnx.name = "input"}) -> (tensor<1x1x3x3xf32> {onnx.name = "output"}) {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<[[[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]]]> : tensor<1x1x2x2xf32>
    %cst_1 = arith.constant dense<0.000000e+00> : tensor<1xf32>
    %0 = tensor.empty() : tensor<1x4x4x1xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : tensor<1x1x4x4xf32>) outs(%0 : tensor<1x4x4x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x4x4x1xf32>
    %2 = tensor.empty() : tensor<1x2x2x1xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%cst_0 : tensor<1x1x2x2xf32>) outs(%2 : tensor<1x2x2x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x2x2x1xf32>
    %padded = tensor.pad %1 low[0, 1, 1, 0] high[0, 1, 1, 0] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
      tensor.yield %cst : f32
    } : tensor<1x4x4x1xf32> to tensor<1x6x6x1xf32>
    %4 = tensor.empty() : tensor<1x3x3x1xf32>
    %5 = linalg.generic {indexing_maps = [#map2, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%cst_1 : tensor<1xf32>) outs(%4 : tensor<1x3x3x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x3x3x1xf32>
    %6 = linalg.generic {indexing_maps = [#map3, #map4, #map5], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction", "reduction", "reduction"]} ins(%padded, %3 : tensor<1x6x6x1xf32>, tensor<1x2x2x1xf32>) outs(%5 : tensor<1x3x3x1xf32>) {
    ^bb0(%in: f32, %in_2: f32, %out: f32):
      %9 = arith.mulf %in, %in_2 : f32
      %10 = arith.addf %out, %9 : f32
      linalg.yield %10 : f32
    } -> tensor<1x3x3x1xf32>
    %7 = tensor.empty() : tensor<1x1x3x3xf32>
    %8 = linalg.generic {indexing_maps = [#map6, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%6 : tensor<1x3x3x1xf32>) outs(%7 : tensor<1x1x3x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<1x1x3x3xf32>
    return %8 : tensor<1x1x3x3xf32>
  }
}

