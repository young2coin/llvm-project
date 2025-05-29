#map = affine_map<(d0)[s0, s1] -> ((d0 - s0) ceildiv s1)>
#map1 = affine_map<(d0)[s0, s1] -> (d0 * s0 + s1)>
module attributes {gpu.container_module, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "onnx-mlir.symbol-postfix" = "model"} {
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
    gpu.launch_func  @main_graph_kernel::@main_graph_kernel blocks in (%1, %c1_11, %c1_11) threads in (%2, %c1_11, %c1_11)  args(%c32 : index, %c0_10 : index, %cst : f32, %alloc : memref<1x1x1x1xf32>, %arg0 : memref<1x1x28x28xf32>, %c0_6 : index, %c0_5 : index, %alloc_4 : memref<1x1x1x1xf32>, %0 : memref<1x1x2x2xf32>, %c0_9 : index, %c0_8 : index, %alloc_7 : memref<1x1x1x1xf32>, %c0_3 : index, %c0_1 : index, %c0_2 : index, %arg1 : memref<1x1x27x27xf32>)
    return
  }
  gpu.module @main_graph_kernel {
    gpu.func @main_graph_kernel(%arg0: index, %arg1: index, %arg2: f32, %arg3: memref<1x1x1x1xf32>, %arg4: memref<1x1x28x28xf32>, %arg5: index, %arg6: index, %arg7: memref<1x1x1x1xf32>, %arg8: memref<1x1x2x2xf32>, %arg9: index, %arg10: index, %arg11: memref<1x1x1x1xf32>, %arg12: index, %arg13: index, %arg14: index, %arg15: memref<1x1x27x27xf32>) kernel {
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %block_id_z = gpu.block_id  z
      %thread_id_x = gpu.thread_id  x
      %thread_id_y = gpu.thread_id  y
      %thread_id_z = gpu.thread_id  z
      %grid_dim_x = gpu.grid_dim  x
      %grid_dim_y = gpu.grid_dim  y
      %grid_dim_z = gpu.grid_dim  z
      %block_dim_x = gpu.block_dim  x
      %block_dim_y = gpu.block_dim  y
      %block_dim_z = gpu.block_dim  z
      %0 = affine.apply #map1(%block_id_x)[%arg0, %arg1]
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c32_0 = arith.constant 32 : index
      %c0_1 = arith.constant 0 : index
      %1 = affine.apply #map1(%thread_id_x)[%c32_0, %c0_1]
      %c0_2 = arith.constant 0 : index
      %c27 = arith.constant 27 : index
      %c32_3 = arith.constant 32 : index
      scf.for %arg16 = %c0_2 to %c27 step %c32_3 {
        %c0_4 = arith.constant 0 : index
        %c27_5 = arith.constant 27 : index
        %c32_6 = arith.constant 32 : index
        scf.for %arg17 = %c0_4 to %c27_5 step %c32_6 {
          %c1_7 = arith.constant 1 : index
          %2 = arith.addi %0, %c1_7 : index
          %c1_8 = arith.constant 1 : index
          scf.for %arg18 = %0 to %2 step %c1_8 {
            %c1_9 = arith.constant 1 : index
            %3 = arith.addi %1, %c1_9 : index
            %c1_10 = arith.constant 1 : index
            scf.for %arg19 = %1 to %3 step %c1_10 {
              %c27_11 = arith.constant 27 : index
              %4 = arith.addi %arg16, %c27_11 : index
              %c1_12 = arith.constant 1 : index
              scf.for %arg20 = %arg16 to %4 step %c1_12 {
                %c27_13 = arith.constant 27 : index
                %5 = arith.addi %arg17, %c27_13 : index
                %c1_14 = arith.constant 1 : index
                scf.for %arg21 = %arg17 to %5 step %c1_14 {
                  %c0_15 = arith.constant 0 : index
                  %c0_16 = arith.constant 0 : index
                  %c0_17 = arith.constant 0 : index
                  %c0_18 = arith.constant 0 : index
                  memref.store %arg2, %arg3[%c0_15, %c0_16, %c0_17, %c0_18] : memref<1x1x1x1xf32>
                  %c0_19 = arith.constant 0 : index
                  %c2 = arith.constant 2 : index
                  %c1_20 = arith.constant 1 : index
                  scf.for %arg22 = %c0_19 to %c2 step %c1_20 {
                    %c0_23 = arith.constant 0 : index
                    %c2_24 = arith.constant 2 : index
                    %c1_25 = arith.constant 1 : index
                    scf.for %arg23 = %c0_23 to %c2_24 step %c1_25 {
                      %7 = arith.addi %arg20, %arg22 : index
                      %8 = arith.addi %arg21, %arg23 : index
                      %9 = memref.load %arg4[%arg5, %arg6, %7, %8] : memref<1x1x28x28xf32>
                      %c0_26 = arith.constant 0 : index
                      %c0_27 = arith.constant 0 : index
                      %c0_28 = arith.constant 0 : index
                      %c0_29 = arith.constant 0 : index
                      memref.store %9, %arg7[%c0_26, %c0_27, %c0_28, %c0_29] : memref<1x1x1x1xf32>
                      %10 = memref.load %arg8[%arg9, %arg10, %arg22, %arg23] : memref<1x1x2x2xf32>
                      %c0_30 = arith.constant 0 : index
                      %c0_31 = arith.constant 0 : index
                      %c0_32 = arith.constant 0 : index
                      %c0_33 = arith.constant 0 : index
                      memref.store %10, %arg11[%c0_30, %c0_31, %c0_32, %c0_33] : memref<1x1x1x1xf32>
                      %11 = arith.addi %arg20, %arg22 : index
                      %12 = arith.addi %arg21, %arg23 : index
                      %c0_34 = arith.constant 0 : index
                      %c0_35 = arith.constant 0 : index
                      %13 = memref.load %arg7[%arg12, %c0_34, %c0_35, %arg13] : memref<1x1x1x1xf32>
                      %c0_36 = arith.constant 0 : index
                      %c0_37 = arith.constant 0 : index
                      %14 = memref.load %arg11[%arg14, %c0_36, %c0_37, %arg13] : memref<1x1x1x1xf32>
                      %c0_38 = arith.constant 0 : index
                      %c0_39 = arith.constant 0 : index
                      %c0_40 = arith.constant 0 : index
                      %c0_41 = arith.constant 0 : index
                      %15 = memref.load %arg3[%c0_38, %c0_39, %c0_40, %c0_41] : memref<1x1x1x1xf32>
                      %16 = arith.mulf %13, %14 : f32
                      %17 = arith.addf %15, %16 : f32
                      %c0_42 = arith.constant 0 : index
                      %c0_43 = arith.constant 0 : index
                      %c0_44 = arith.constant 0 : index
                      %c0_45 = arith.constant 0 : index
                      memref.store %17, %arg3[%c0_42, %c0_43, %c0_44, %c0_45] : memref<1x1x1x1xf32>
                    }
                  }
                  %c0_21 = arith.constant 0 : index
                  %c0_22 = arith.constant 0 : index
                  %6 = memref.load %arg3[%arg18, %c0_21, %c0_22, %arg19] : memref<1x1x1x1xf32>
                  memref.store %6, %arg15[%arg18, %arg19, %arg20, %arg21] : memref<1x1x27x27xf32>
                }
              }
            }
          }
        }
      }
      gpu.return
    }
  }
  func.func @main() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x1x28x28xf32>
    %alloc_0 = memref.alloc() : memref<1x1x27x27xf32>
    call @main_graph(%alloc, %alloc_0) : (memref<1x1x28x28xf32>, memref<1x1x27x27xf32>) -> ()
    return %c0_i32 : i32
  }
}

