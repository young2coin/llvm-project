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
    scf.parallel (%arg2) = (%c0_10) to (%c1) step (%c32) {
      %c0_11 = arith.constant 0 : index
      %c1_12 = arith.constant 1 : index
      %c32_13 = arith.constant 32 : index
      scf.parallel (%arg3) = (%c0_11) to (%c1_12) step (%c32_13) {
        %c0_14 = arith.constant 0 : index
        %c27 = arith.constant 27 : index
        %c32_15 = arith.constant 32 : index
        scf.parallel (%arg4) = (%c0_14) to (%c27) step (%c32_15) {
          %c0_16 = arith.constant 0 : index
          %c27_17 = arith.constant 27 : index
          %c32_18 = arith.constant 32 : index
          scf.parallel (%arg5) = (%c0_16) to (%c27_17) step (%c32_18) {
            %c1_19 = arith.constant 1 : index
            %1 = arith.addi %arg2, %c1_19 : index
            %c1_20 = arith.constant 1 : index
            scf.parallel (%arg6) = (%arg2) to (%1) step (%c1_20) {
              %c1_21 = arith.constant 1 : index
              %2 = arith.addi %arg3, %c1_21 : index
              %c1_22 = arith.constant 1 : index
              scf.parallel (%arg7) = (%arg3) to (%2) step (%c1_22) {
                %c27_23 = arith.constant 27 : index
                %3 = arith.addi %arg4, %c27_23 : index
                %c1_24 = arith.constant 1 : index
                scf.for %arg8 = %arg4 to %3 step %c1_24 {
                  %c27_25 = arith.constant 27 : index
                  %4 = arith.addi %arg5, %c27_25 : index
                  %c1_26 = arith.constant 1 : index
                  scf.for %arg9 = %arg5 to %4 step %c1_26 {
                    %c0_27 = arith.constant 0 : index
                    %c0_28 = arith.constant 0 : index
                    %c0_29 = arith.constant 0 : index
                    %c0_30 = arith.constant 0 : index
                    memref.store %cst, %alloc[%c0_27, %c0_28, %c0_29, %c0_30] : memref<1x1x1x1xf32>
                    %c0_31 = arith.constant 0 : index
                    %c2 = arith.constant 2 : index
                    %c1_32 = arith.constant 1 : index
                    scf.for %arg10 = %c0_31 to %c2 step %c1_32 {
                      %c0_35 = arith.constant 0 : index
                      %c2_36 = arith.constant 2 : index
                      %c1_37 = arith.constant 1 : index
                      scf.for %arg11 = %c0_35 to %c2_36 step %c1_37 {
                        %6 = arith.addi %arg8, %arg10 : index
                        %7 = arith.addi %arg9, %arg11 : index
                        %8 = memref.load %arg0[%c0_6, %c0_5, %6, %7] : memref<1x1x28x28xf32>
                        %c0_38 = arith.constant 0 : index
                        %c0_39 = arith.constant 0 : index
                        %c0_40 = arith.constant 0 : index
                        %c0_41 = arith.constant 0 : index
                        memref.store %8, %alloc_4[%c0_38, %c0_39, %c0_40, %c0_41] : memref<1x1x1x1xf32>
                        %9 = memref.load %0[%c0_9, %c0_8, %arg10, %arg11] : memref<1x1x2x2xf32>
                        %c0_42 = arith.constant 0 : index
                        %c0_43 = arith.constant 0 : index
                        %c0_44 = arith.constant 0 : index
                        %c0_45 = arith.constant 0 : index
                        memref.store %9, %alloc_7[%c0_42, %c0_43, %c0_44, %c0_45] : memref<1x1x1x1xf32>
                        %10 = arith.addi %arg8, %arg10 : index
                        %11 = arith.addi %arg9, %arg11 : index
                        %c0_46 = arith.constant 0 : index
                        %c0_47 = arith.constant 0 : index
                        %12 = memref.load %alloc_4[%c0_3, %c0_46, %c0_47, %c0_1] : memref<1x1x1x1xf32>
                        %c0_48 = arith.constant 0 : index
                        %c0_49 = arith.constant 0 : index
                        %13 = memref.load %alloc_7[%c0_2, %c0_48, %c0_49, %c0_1] : memref<1x1x1x1xf32>
                        %c0_50 = arith.constant 0 : index
                        %c0_51 = arith.constant 0 : index
                        %c0_52 = arith.constant 0 : index
                        %c0_53 = arith.constant 0 : index
                        %14 = memref.load %alloc[%c0_50, %c0_51, %c0_52, %c0_53] : memref<1x1x1x1xf32>
                        %15 = arith.mulf %12, %13 : f32
                        %16 = arith.addf %14, %15 : f32
                        %c0_54 = arith.constant 0 : index
                        %c0_55 = arith.constant 0 : index
                        %c0_56 = arith.constant 0 : index
                        %c0_57 = arith.constant 0 : index
                        memref.store %16, %alloc[%c0_54, %c0_55, %c0_56, %c0_57] : memref<1x1x1x1xf32>
                      }
                    }
                    %c0_33 = arith.constant 0 : index
                    %c0_34 = arith.constant 0 : index
                    %5 = memref.load %alloc[%arg6, %c0_33, %c0_34, %arg7] : memref<1x1x1x1xf32>
                    memref.store %5, %arg1[%arg6, %arg7, %arg8, %arg9] : memref<1x1x27x27xf32>
                  }
                }
                scf.reduce 
              } {mapping = [#gpu.loop_dim_map<processor = sequential, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
              scf.reduce 
            } {mapping = [#gpu.loop_dim_map<processor = sequential, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
            scf.reduce 
          } {mapping = [#gpu.loop_dim_map<processor = sequential, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
          scf.reduce 
        } {mapping = [#gpu.loop_dim_map<processor = sequential, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
        scf.reduce 
      } {mapping = [#gpu.loop_dim_map<processor = thread_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
      scf.reduce 
    } {mapping = [#gpu.loop_dim_map<processor = block_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
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

