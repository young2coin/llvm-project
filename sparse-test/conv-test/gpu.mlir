#map = affine_map<(d0)[s0, s1] -> ((d0 - s0) ceildiv s1)>
#map1 = affine_map<(d0)[s0, s1] -> (d0 * s0 + s1)>
module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "onnx-mlir.symbol-postfix" = "model"} {
  memref.global "private" constant @__constant_4xi32_0 : memref<4xi32> = dense<[0, 3, 1, 2]> {alignment = 64 : i64}
  memref.global "private" constant @__constant_4xi32 : memref<4xi32> = dense<[0, 2, 3, 1]> {alignment = 64 : i64}
  memref.global "private" constant @__constant_1xf32 : memref<1xf32> = dense<0.000000e+00> {alignment = 64 : i64}
  memref.global "private" constant @__constant_1x1x2x2xf32 : memref<1x1x2x2xf32> = dense<[[[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]]]> {alignment = 64 : i64}
  func.func @main_graph(%arg0: memref<1x1x28x28xf32> {onnx.name = "input"}, %arg1: memref<1x1x27x27xf32> {onnx.name = "output"}) {
    %alloc = memref.alloc() : memref<1x1x1x1xf32>
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    %c0_1 = arith.constant 0 : index
    %c0_2 = arith.constant 0 : index
    %c0_3 = arith.constant 0 : index
    %alloc_4 = memref.alloc() : memref<1x1x1x1xf32>
    %c0_5 = arith.constant 0 : index
    %c0_6 = arith.constant 0 : index
    %alloc_7 = memref.alloc() : memref<1x1x1x1xf32>
    %c0_8 = arith.constant 0 : index
    %c0_9 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_1x1x2x2xf32 : memref<1x1x2x2xf32>
    %c0_10 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c1_11 = arith.constant 1 : index
    %1 = affine.apply #map(%c1)[%c0_10, %c32]
    %c1_12 = arith.constant 1 : index
    %c0_13 = arith.constant 0 : index
    %c32_14 = arith.constant 32 : index
    %2 = affine.apply #map(%c1_12)[%c0_13, %c32_14]
    gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %1, %arg9 = %c1_11, %arg10 = %c1_11) threads(%arg5, %arg6, %arg7) in (%arg11 = %2, %arg12 = %c1_11, %arg13 = %c1_11) {
      %3 = affine.apply #map1(%arg2)[%c32, %c0_10]
      %c0_15 = arith.constant 0 : index
      %c1_16 = arith.constant 1 : index
      %c32_17 = arith.constant 32 : index
      %c32_18 = arith.constant 32 : index
      %c0_19 = arith.constant 0 : index
      %4 = affine.apply #map1(%arg5)[%c32_18, %c0_19]
      %c0_20 = arith.constant 0 : index
      %c27 = arith.constant 27 : index
      %c32_21 = arith.constant 32 : index
      scf.for %arg14 = %c0_20 to %c27 step %c32_21 {
        %c0_22 = arith.constant 0 : index
        %c27_23 = arith.constant 27 : index
        %c32_24 = arith.constant 32 : index
        scf.for %arg15 = %c0_22 to %c27_23 step %c32_24 {
          %c1_25 = arith.constant 1 : index
          %5 = arith.addi %3, %c1_25 : index
          %c1_26 = arith.constant 1 : index
          scf.for %arg16 = %3 to %5 step %c1_26 {
            %c1_27 = arith.constant 1 : index
            %6 = arith.addi %4, %c1_27 : index
            %c1_28 = arith.constant 1 : index
            scf.for %arg17 = %4 to %6 step %c1_28 {
              %c27_29 = arith.constant 27 : index
              %7 = arith.addi %arg14, %c27_29 : index
              %c1_30 = arith.constant 1 : index
              scf.for %arg18 = %arg14 to %7 step %c1_30 {
                %c27_31 = arith.constant 27 : index
                %8 = arith.addi %arg15, %c27_31 : index
                %c1_32 = arith.constant 1 : index
                scf.for %arg19 = %arg15 to %8 step %c1_32 {
                  %c0_33 = arith.constant 0 : index
                  %c0_34 = arith.constant 0 : index
                  %c0_35 = arith.constant 0 : index
                  %c0_36 = arith.constant 0 : index
                  memref.store %cst, %alloc[%c0_33, %c0_34, %c0_35, %c0_36] : memref<1x1x1x1xf32>
                  %c0_37 = arith.constant 0 : index
                  %c2 = arith.constant 2 : index
                  %c1_38 = arith.constant 1 : index
                  scf.for %arg20 = %c0_37 to %c2 step %c1_38 {
                    %c0_41 = arith.constant 0 : index
                    %c2_42 = arith.constant 2 : index
                    %c1_43 = arith.constant 1 : index
                    scf.for %arg21 = %c0_41 to %c2_42 step %c1_43 {
                      %10 = arith.addi %arg18, %arg20 : index
                      %11 = arith.addi %arg19, %arg21 : index
                      %12 = memref.load %arg0[%c0_6, %c0_5, %10, %11] : memref<1x1x28x28xf32>
                      %c0_44 = arith.constant 0 : index
                      %c0_45 = arith.constant 0 : index
                      %c0_46 = arith.constant 0 : index
                      %c0_47 = arith.constant 0 : index
                      memref.store %12, %alloc_4[%c0_44, %c0_45, %c0_46, %c0_47] : memref<1x1x1x1xf32>
                      %13 = memref.load %0[%c0_9, %c0_8, %arg20, %arg21] : memref<1x1x2x2xf32>
                      %c0_48 = arith.constant 0 : index
                      %c0_49 = arith.constant 0 : index
                      %c0_50 = arith.constant 0 : index
                      %c0_51 = arith.constant 0 : index
                      memref.store %13, %alloc_7[%c0_48, %c0_49, %c0_50, %c0_51] : memref<1x1x1x1xf32>
                      %14 = arith.addi %arg18, %arg20 : index
                      %15 = arith.addi %arg19, %arg21 : index
                      %c0_52 = arith.constant 0 : index
                      %c0_53 = arith.constant 0 : index
                      %16 = memref.load %alloc_4[%c0_3, %c0_52, %c0_53, %c0_1] : memref<1x1x1x1xf32>
                      %c0_54 = arith.constant 0 : index
                      %c0_55 = arith.constant 0 : index
                      %17 = memref.load %alloc_7[%c0_2, %c0_54, %c0_55, %c0_1] : memref<1x1x1x1xf32>
                      %c0_56 = arith.constant 0 : index
                      %c0_57 = arith.constant 0 : index
                      %c0_58 = arith.constant 0 : index
                      %c0_59 = arith.constant 0 : index
                      %18 = memref.load %alloc[%c0_56, %c0_57, %c0_58, %c0_59] : memref<1x1x1x1xf32>
                      %19 = arith.mulf %16, %17 : f32
                      %20 = arith.addf %18, %19 : f32
                      %c0_60 = arith.constant 0 : index
                      %c0_61 = arith.constant 0 : index
                      %c0_62 = arith.constant 0 : index
                      %c0_63 = arith.constant 0 : index
                      memref.store %20, %alloc[%c0_60, %c0_61, %c0_62, %c0_63] : memref<1x1x1x1xf32>
                    }
                  }
                  %c0_39 = arith.constant 0 : index
                  %c0_40 = arith.constant 0 : index
                  %9 = memref.load %alloc[%arg16, %c0_39, %c0_40, %arg17] : memref<1x1x1x1xf32>
                  memref.store %9, %arg1[%arg16, %arg17, %arg18, %arg19] : memref<1x1x27x27xf32>
                }
              }
            }
          }
        }
      }
      gpu.terminator
    } {SCFToGPU_visited}
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

