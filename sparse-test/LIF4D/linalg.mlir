#map = affine_map<(d0, d1, d2, d3) -> (0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (0, 0, d2, d3)>
#map3 = affine_map<(d0, d1) -> (d1)>
#map4 = affine_map<(d0, d1) -> (d0, d1)>
#CSR = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed)
}>
module {
  llvm.func @mgpuCreateSparseEnv()
  llvm.func @mgpuDestroySparseEnv()
  func.func @test_lif(%arg0: tensor<128x1x28x28xf32>, %arg1: tensor<128x1x28x28xf32>, %arg2: tensor<128x1x28x28xf32>) -> tensor<128x1x28x28xf32> {
  %cst = arith.constant 9.900000e-01 : f32
  %cst_0 = arith.constant 0.000000e+00 : f32
  %cst_1 = arith.constant 1.000000e+00 : f32
  %0 = bufferization.alloc_tensor() : tensor<128x1x28x28xf32>
  %1 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<128x1x28x28xf32>, tensor<128x1x28x28xf32>) outs(%0 : tensor<128x1x28x28xf32>) {
  ^bb0(%in: f32, %in_2: f32, %out: f32):
    %2 = arith.mulf %in, %cst : f32
    %3 = arith.addf %in_2, %2 : f32
    %4 = arith.cmpf olt, %3, %cst_1 : f32
    %5 = arith.select %4, %cst_0, %cst_1 : f32
    linalg.yield %5 : f32
  } -> tensor<128x1x28x28xf32>
  return %1 : tensor<128x1x28x28xf32>
  
}  

  func.func @main() {
    llvm.call @mgpuCreateSparseEnv(): () -> ()
    %f0 = arith.constant 0.0 : f32
    %f1 = arith.constant 1.0 : f32
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index

  %convin = tensor.generate {
  ^bb0(%i: index, %j: index, %k: index, %l: index):
    %sum1 = arith.addi %i, %j : index
    %sum2 = arith.addi %k, %l : index
    %sum = arith.addi %sum1, %sum2 : index

    %c10 = arith.constant 10 : index
    %c8 = arith.constant 8 : index
    %mod = arith.remsi %sum, %c10 : index
    %is_even = arith.cmpi slt, %mod, %c8 : index

    %value = scf.if %is_even -> (f32) {
      // %f0 = arith.constant 0.0 : f32
      scf.yield %f0 : f32
    } else {
      %l64 = arith.index_cast %sum : index to i64
      %f = arith.uitofp %l64 : i64 to f32
      scf.yield %f : f32
    }

    tensor.yield %value : f32
} : tensor<128x1x28x28xf32>


  %convin2 = tensor.generate {
  ^bb0(%i: index, %j: index, %k: index, %l: index):
    %sum1 = arith.addi %i, %j : index
    %sum2 = arith.addi %k, %l : index
    %sum = arith.addi %sum1, %sum2 : index

    %c10 = arith.constant 10 : index
    %c8 = arith.constant 8 : index
    %mod = arith.remsi %sum, %c10 : index
    %is_even = arith.cmpi slt, %mod, %c8 : index

    %value = scf.if %is_even -> (f32) {
      // %f0 = arith.constant 0.0 : f32
      scf.yield %f0 : f32
    } else {
      %l64 = arith.index_cast %sum : index to i64
      %f = arith.uitofp %l64 : i64 to f32
      scf.yield %f : f32
    }

    tensor.yield %value : f32
} : tensor<128x1x28x28xf32>

  %out = tensor.generate {
  ^bb0(%i: index, %j: index, %k: index, %l: index):
    tensor.yield %f0 : f32
} : tensor<128x1x28x28xf32>

  %res = call @test_lif(%convin, %convin2, %out) : (tensor<128x1x28x28xf32>,
                                          tensor<128x1x28x28xf32>,
                                          tensor<128x1x28x28xf32>) -> tensor<128x1x28x28xf32>


  llvm.call @mgpuDestroySparseEnv(): () -> ()

    return
  }

}

