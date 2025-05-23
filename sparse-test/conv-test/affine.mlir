#map = affine_map<(d0, d1) -> (d0 + d1)>
module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "onnx-mlir.symbol-postfix" = "model"} {
  memref.global "private" constant @__constant_4xi32_0 : memref<4xi32> = dense<[0, 3, 1, 2]> {alignment = 64 : i64}
  memref.global "private" constant @__constant_4xi32 : memref<4xi32> = dense<[0, 2, 3, 1]> {alignment = 64 : i64}
  memref.global "private" constant @__constant_1xf32 : memref<1xf32> = dense<0.000000e+00> {alignment = 64 : i64}
  memref.global "private" constant @__constant_1x1x2x2xf32 : memref<1x1x2x2xf32> = dense<[[[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]]]> {alignment = 64 : i64}
  func.func @main_graph(%arg0: memref<1x1x28x28xf32> {onnx.name = "input"}, %arg1: memref<1x1x27x27xf32> {onnx.name = "output"}) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_1x1x2x2xf32 : memref<1x1x2x2xf32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x28x28x1xf32>
    affine.for %arg2 = 0 to 1 {
      affine.for %arg3 = 0 to 28 {
        affine.for %arg4 = 0 to 28 {
          affine.for %arg5 = 0 to 1 {
            %1 = affine.load %arg0[%arg2, %arg5, %arg3, %arg4] : memref<1x1x28x28xf32>
            affine.store %1, %alloc[%arg2, %arg3, %arg4, %arg5] : memref<1x28x28x1xf32>
          }
        }
      }
    }
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<1x2x2x1xf32>
    affine.for %arg2 = 0 to 1 {
      affine.for %arg3 = 0 to 2 {
        affine.for %arg4 = 0 to 2 {
          affine.for %arg5 = 0 to 1 {
            %1 = affine.load %0[%arg2, %arg5, %arg3, %arg4] : memref<1x1x2x2xf32>
            affine.store %1, %alloc_0[%arg2, %arg3, %arg4, %arg5] : memref<1x2x2x1xf32>
          }
        }
      }
    }
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<1x27x27x1xf32>
    affine.for %arg2 = 0 to 1 {
      affine.for %arg3 = 0 to 27 {
        affine.for %arg4 = 0 to 27 {
          affine.for %arg5 = 0 to 1 {
            affine.store %cst, %alloc_1[%arg2, %arg3, %arg4, %arg5] : memref<1x27x27x1xf32>
          }
        }
      }
    }
    affine.for %arg2 = 0 to 1 {
      affine.for %arg3 = 0 to 27 {
        affine.for %arg4 = 0 to 27 {
          affine.for %arg5 = 0 to 1 {
            affine.for %arg6 = 0 to 2 {
              affine.for %arg7 = 0 to 2 {
                affine.for %arg8 = 0 to 1 {
                  %1 = affine.apply #map(%arg3, %arg6)
                  %2 = affine.apply #map(%arg4, %arg7)
                  %3 = affine.load %alloc[%arg2, %1, %2, %arg8] : memref<1x28x28x1xf32>
                  %4 = affine.load %alloc_0[%arg5, %arg6, %arg7, %arg8] : memref<1x2x2x1xf32>
                  %5 = affine.load %alloc_1[%arg2, %arg3, %arg4, %arg5] : memref<1x27x27x1xf32>
                  %6 = arith.mulf %3, %4 : f32
                  %7 = arith.addf %5, %6 : f32
                  affine.store %7, %alloc_1[%arg2, %arg3, %arg4, %arg5] : memref<1x27x27x1xf32>
                }
              }
            }
          }
        }
      }
    }
    affine.for %arg2 = 0 to 1 {
      affine.for %arg3 = 0 to 1 {
        affine.for %arg4 = 0 to 27 {
          affine.for %arg5 = 0 to 27 {
            %1 = affine.load %alloc_1[%arg2, %arg4, %arg5, %arg3] : memref<1x27x27x1xf32>
            affine.store %1, %arg1[%arg2, %arg3, %arg4, %arg5] : memref<1x1x27x27xf32>
          }
        }
      }
    }
    return
  }
  func.func @main() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x1x28x28xf32>
    %alloc_0 = memref.alloc() : memref<1x1x27x27xf32>
    call @main_graph(%alloc, %alloc_0) : (memref<1x1x28x28xf32>, memref<1x1x27x27xf32>) -> ()
    return %c0_i32 : i32
  }
}

