module {
  func.func @test_lif(%arg0: tensor<2x2x2x2xf32>, %arg1: tensor<2x2x2x2xf32>, %arg2: tensor<2x2x2x2xf32>) -> tensor<2x2x2x2xf32> {
  %cst = arith.constant 9.900000e-01 : f32
  %cst_0 = arith.constant 0.000000e+00 : f32
  %cst_1 = arith.constant 1.000000e+00 : f32
  %0 = bufferization.alloc_tensor() : tensor<2x2x2x2xf32>
  %1 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<2x2x2x2xf32>, tensor<2x2x2x2xf32>) outs(%0 : tensor<2x2x2x2xf32>) {
  ^bb0(%in: f32, %in_2: f32, %out: f32):
    %2 = arith.mulf %in, %cst : f32
    %3 = arith.addf %in_2, %2 : f32
    %4 = arith.cmpf olt, %3, %cst_1 : f32
    %5 = arith.select %4, %cst_0, %cst_1 : f32
    linalg.yield %5 : f32
  } -> tensor<2x2x2x2xf32>
  return %1 : tensor<2x2x2x2xf32>
  
}
}