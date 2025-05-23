#map = affine_map<(d0, d1, d2, d3) -> (0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "onnx-mlir.symbol-postfix" = "model"} {
  memref.global "private" constant @__constant_4xi32_0 : memref<4xi32> = dense<[0, 3, 1, 2]> {alignment = 64 : i64}
  memref.global "private" constant @__constant_4xi32 : memref<4xi32> = dense<[0, 2, 3, 1]> {alignment = 64 : i64}
  memref.global "private" constant @__constant_1xf32 : memref<1xf32> = dense<0.000000e+00> {alignment = 64 : i64}
  memref.global "private" constant @__constant_1x1x2x2xf32 : memref<1x1x2x2xf32> = dense<[[[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]]]> {alignment = 64 : i64}
  func.func @main_graph(%arg0: memref<1x1x28x28xf32> {onnx.name = "input"}, %arg1: memref<1x1x27x27xf32> {onnx.name = "output"}) {
    %0 = memref.get_global @__constant_1x1x2x2xf32 : memref<1x1x2x2xf32>
    %1 = memref.get_global @__constant_1xf32 : memref<1xf32>
    %c2 = arith.constant 2 : index
    %c2_0 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c0_1 = arith.constant 0 : index
    %c0_2 = arith.constant 0 : index
    %c0_3 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c1_4 = arith.constant 1 : index
    %c0_5 = arith.constant 0 : index
    %c1_6 = arith.constant 1 : index
    %c28 = arith.constant 28 : index
    %c1_7 = arith.constant 1 : index
    %c1_8 = arith.constant 1 : index
    %c1_9 = arith.constant 1 : index
    %c2_10 = arith.constant 2 : index
    %c26 = arith.constant 26 : index
    %c27 = arith.constant 27 : index
    %c28_11 = arith.constant 28 : index
    %c1_12 = arith.constant 1 : index
    %c1_13 = arith.constant 1 : index
    %c1_14 = arith.constant 1 : index
    %c2_15 = arith.constant 2 : index
    %c26_16 = arith.constant 26 : index
    %c27_17 = arith.constant 27 : index
    %2 = memref.get_global @__constant_4xi32 : memref<4xi32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x28x28x1xf32>
    linalg.transpose ins(%arg0 : memref<1x1x28x28xf32>) outs(%alloc : memref<1x28x28x1xf32>) permutation = [0, 2, 3, 1] 
    %3 = memref.get_global @__constant_4xi32 : memref<4xi32>
    %alloc_18 = memref.alloc() {alignment = 64 : i64} : memref<1x2x2x1xf32>
    linalg.transpose ins(%0 : memref<1x1x2x2xf32>) outs(%alloc_18 : memref<1x2x2x1xf32>) permutation = [0, 2, 3, 1] 
    %alloc_19 = memref.alloc() {alignment = 64 : i64} : memref<1x27x27x1xf32>
    linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%1 : memref<1xf32>) outs(%alloc_19 : memref<1x27x27x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    }
    linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%alloc, %alloc_18 : memref<1x28x28x1xf32>, memref<1x2x2x1xf32>) outs(%alloc_19 : memref<1x27x27x1xf32>)
    %4 = memref.get_global @__constant_4xi32_0 : memref<4xi32>
    linalg.transpose ins(%alloc_19 : memref<1x27x27x1xf32>) outs(%arg1 : memref<1x1x27x27xf32>) permutation = [0, 3, 1, 2] 
    return
  }
  func.func @main() -> i32 {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x1x28x28xf32>
    %alloc_0 = memref.alloc() : memref<1x1x27x27xf32>
    call @main_graph(%alloc, %alloc_0) : (memref<1x1x28x28xf32>, memref<1x1x27x27xf32>) -> ()
    %c0_i32 = arith.constant 0 : i32
    return %c0_i32 : i32
  }
}

