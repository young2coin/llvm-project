module attributes {gpu.container_module} {
  gpu.module @sparse_lif_4D_kernels {
    gpu.func @lif_4D_kernel(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: memref<128x1x28x28xf32>, %arg5: memref<100352xindex>, %arg6: memref<100352xindex>, %arg7: memref<100352xindex>, %arg8: memref<100352xindex>, %arg9: memref<100352xf32>, %arg10: memref<100352xindex>, %arg11: memref<100352xindex>, %arg12: memref<100352xindex>, %arg13: memref<100352xindex>, %arg14: memref<100352xf32>) kernel {
      %c100352 = arith.constant 100352 : index
      %cst = arith.constant 0.000000e+00 : f32
      %cst_0 = arith.constant 1.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %block_id_x = gpu.block_id  x
      %thread_id_x = gpu.thread_id  x
      %block_dim_x = gpu.block_dim  x
      %0 = arith.muli %block_id_x, %block_dim_x : index
      %1 = arith.addi %0, %thread_id_x : index
      %2 = arith.muli %arg1, %arg2 : index
      %3 = arith.muli %2, %arg3 : index
      %4 = arith.muli %arg0, %3 : index
      %5 = arith.cmpi ult, %1, %4 : index
      scf.if %5 {
        %6 = arith.remui %1, %arg3 : index
        %7 = arith.divui %1, %arg3 : index
        %8 = arith.remui %7, %arg2 : index
        %9 = arith.divui %7, %arg2 : index
        %10 = arith.remui %9, %arg1 : index
        %11 = arith.divui %9, %arg1 : index
        %12 = scf.for %arg15 = %c0 to %c100352 step %c1 iter_args(%arg16 = %cst) -> (f32) {
          scf.yield %arg16 : f32
        }
        %13 = scf.for %arg15 = %c0 to %c100352 step %c1 iter_args(%arg16 = %cst) -> (f32) {
          scf.yield %arg16 : f32
        }
        %14 = arith.addf %12, %13 : f32
        %15 = arith.cmpf olt, %14, %cst_0 : f32
        %16 = arith.select %15, %cst, %cst_0 : f32
        memref.store %16, %arg4[%11, %10, %8, %6] : memref<128x1x28x28xf32>
      }
      gpu.return
    }
  }
  llvm.func @mgpuCreateSparseEnv()
  llvm.func @mgpuDestroySparseEnv()
  func.func @test_lif(%arg0: tensor<128x1x28x28xf32>, %arg1: tensor<128x1x28x28xf32>, %arg2: tensor<128x1x28x28xf32>) -> tensor<128x1x28x28xf32> {
    %c1024 = arith.constant 1024 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c28 = arith.constant 28 : index
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %0 = bufferization.alloc_tensor() : tensor<128x1x28x28xf32>
    %1 = bufferization.to_memref %0 : memref<128x1x28x28xf32>
    %alloc = memref.alloc() : memref<100352xindex>
    %alloc_0 = memref.alloc() : memref<100352xindex>
    %alloc_1 = memref.alloc() : memref<100352xindex>
    %alloc_2 = memref.alloc() : memref<100352xindex>
    %alloc_3 = memref.alloc() : memref<100352xf32>
    %2 = scf.for %arg3 = %c0 to %c128 step %c1 iter_args(%arg4 = %c0) -> (index) {
      %50 = scf.for %arg5 = %c0 to %c1 step %c1 iter_args(%arg6 = %arg4) -> (index) {
        %51 = scf.for %arg7 = %c0 to %c28 step %c1 iter_args(%arg8 = %arg6) -> (index) {
          %52 = scf.for %arg9 = %c0 to %c28 step %c1 iter_args(%arg10 = %arg8) -> (index) {
            %extracted = tensor.extract %arg0[%arg3, %arg5, %arg7, %arg9] : tensor<128x1x28x28xf32>
            %53 = arith.cmpf une, %extracted, %cst : f32
            %54 = scf.if %53 -> (index) {
              memref.store %arg3, %alloc[%arg10] : memref<100352xindex>
              memref.store %arg5, %alloc_0[%arg10] : memref<100352xindex>
              memref.store %arg7, %alloc_1[%arg10] : memref<100352xindex>
              memref.store %arg9, %alloc_2[%arg10] : memref<100352xindex>
              memref.store %extracted, %alloc_3[%arg10] : memref<100352xf32>
              %55 = arith.addi %arg10, %c1 : index
              scf.yield %55 : index
            } else {
              scf.yield %arg10 : index
            }
            scf.yield %54 : index
          }
          scf.yield %52 : index
        }
        scf.yield %51 : index
      }
      scf.yield %50 : index
    }
    %alloc_4 = memref.alloc() : memref<100352xindex>
    %alloc_5 = memref.alloc() : memref<100352xindex>
    %alloc_6 = memref.alloc() : memref<100352xindex>
    %alloc_7 = memref.alloc() : memref<100352xindex>
    %alloc_8 = memref.alloc() : memref<100352xf32>
    %3 = scf.for %arg3 = %c0 to %c128 step %c1 iter_args(%arg4 = %c0) -> (index) {
      %50 = scf.for %arg5 = %c0 to %c1 step %c1 iter_args(%arg6 = %arg4) -> (index) {
        %51 = scf.for %arg7 = %c0 to %c28 step %c1 iter_args(%arg8 = %arg6) -> (index) {
          %52 = scf.for %arg9 = %c0 to %c28 step %c1 iter_args(%arg10 = %arg8) -> (index) {
            %extracted = tensor.extract %arg1[%arg3, %arg5, %arg7, %arg9] : tensor<128x1x28x28xf32>
            %53 = arith.cmpf une, %extracted, %cst : f32
            %54 = scf.if %53 -> (index) {
              memref.store %arg3, %alloc_4[%arg10] : memref<100352xindex>
              memref.store %arg5, %alloc_5[%arg10] : memref<100352xindex>
              memref.store %arg7, %alloc_6[%arg10] : memref<100352xindex>
              memref.store %arg9, %alloc_7[%arg10] : memref<100352xindex>
              memref.store %extracted, %alloc_8[%arg10] : memref<100352xf32>
              %55 = arith.addi %arg10, %c1 : index
              scf.yield %55 : index
            } else {
              scf.yield %arg10 : index
            }
            scf.yield %54 : index
          }
          scf.yield %52 : index
        }
        scf.yield %51 : index
      }
      scf.yield %50 : index
    }
    %4 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%4] () : memref<128x1x28x28xf32>
    %5 = gpu.memcpy async [%asyncToken] %memref, %1 : memref<128x1x28x28xf32>, memref<128x1x28x28xf32>
    %6 = gpu.wait async
    %memref_9, %asyncToken_10 = gpu.alloc async [%6] () : memref<100352xindex>
    %7 = gpu.memcpy async [%asyncToken_10] %memref_9, %alloc : memref<100352xindex>, memref<100352xindex>
    %8 = gpu.wait async
    %memref_11, %asyncToken_12 = gpu.alloc async [%8] () : memref<100352xindex>
    %9 = gpu.memcpy async [%asyncToken_12] %memref_11, %alloc_0 : memref<100352xindex>, memref<100352xindex>
    %10 = gpu.wait async
    %memref_13, %asyncToken_14 = gpu.alloc async [%10] () : memref<100352xindex>
    %11 = gpu.memcpy async [%asyncToken_14] %memref_13, %alloc_1 : memref<100352xindex>, memref<100352xindex>
    %12 = gpu.wait async
    %memref_15, %asyncToken_16 = gpu.alloc async [%12] () : memref<100352xindex>
    %13 = gpu.memcpy async [%asyncToken_16] %memref_15, %alloc_2 : memref<100352xindex>, memref<100352xindex>
    %14 = gpu.wait async
    %memref_17, %asyncToken_18 = gpu.alloc async [%14] () : memref<100352xf32>
    %15 = gpu.memcpy async [%asyncToken_18] %memref_17, %alloc_3 : memref<100352xf32>, memref<100352xf32>
    %16 = gpu.wait async
    %memref_19, %asyncToken_20 = gpu.alloc async [%16] () : memref<100352xindex>
    %17 = gpu.memcpy async [%asyncToken_20] %memref_19, %alloc_4 : memref<100352xindex>, memref<100352xindex>
    %18 = gpu.wait async
    %memref_21, %asyncToken_22 = gpu.alloc async [%18] () : memref<100352xindex>
    %19 = gpu.memcpy async [%asyncToken_22] %memref_21, %alloc_5 : memref<100352xindex>, memref<100352xindex>
    %20 = gpu.wait async
    %memref_23, %asyncToken_24 = gpu.alloc async [%20] () : memref<100352xindex>
    %21 = gpu.memcpy async [%asyncToken_24] %memref_23, %alloc_6 : memref<100352xindex>, memref<100352xindex>
    %22 = gpu.wait async
    %memref_25, %asyncToken_26 = gpu.alloc async [%22] () : memref<100352xindex>
    %23 = gpu.memcpy async [%asyncToken_26] %memref_25, %alloc_7 : memref<100352xindex>, memref<100352xindex>
    %24 = gpu.wait async
    %memref_27, %asyncToken_28 = gpu.alloc async [%24] () : memref<100352xf32>
    %25 = gpu.memcpy async [%asyncToken_28] %memref_27, %alloc_8 : memref<100352xf32>, memref<100352xf32>
    gpu.wait [%5, %7, %9, %11, %13, %15, %17, %19, %21, %23, %25]
    %26 = gpu.launch_func async @sparse_lif_4D_kernels::@lif_4D_kernel blocks in (%c1, %c1, %c1) threads in (%c1024, %c1, %c1)  args(%c128 : index, %c1 : index, %c28 : index, %c28 : index, %memref : memref<128x1x28x28xf32>, %memref_9 : memref<100352xindex>, %memref_11 : memref<100352xindex>, %memref_13 : memref<100352xindex>, %memref_15 : memref<100352xindex>, %memref_17 : memref<100352xf32>, %memref_19 : memref<100352xindex>, %memref_21 : memref<100352xindex>, %memref_23 : memref<100352xindex>, %memref_25 : memref<100352xindex>, %memref_27 : memref<100352xf32>)
    %27 = gpu.memcpy async [%26] %1, %memref : memref<128x1x28x28xf32>, memref<128x1x28x28xf32>
    %28 = gpu.dealloc async [%27] %memref : memref<128x1x28x28xf32>
    %29 = gpu.wait async
    %30 = gpu.dealloc async [%29] %memref_9 : memref<100352xindex>
    %31 = gpu.wait async
    %32 = gpu.dealloc async [%31] %memref_11 : memref<100352xindex>
    %33 = gpu.wait async
    %34 = gpu.dealloc async [%33] %memref_13 : memref<100352xindex>
    %35 = gpu.wait async
    %36 = gpu.dealloc async [%35] %memref_15 : memref<100352xindex>
    %37 = gpu.wait async
    %38 = gpu.dealloc async [%37] %memref_17 : memref<100352xf32>
    %39 = gpu.wait async
    %40 = gpu.dealloc async [%39] %memref_19 : memref<100352xindex>
    %41 = gpu.wait async
    %42 = gpu.dealloc async [%41] %memref_21 : memref<100352xindex>
    %43 = gpu.wait async
    %44 = gpu.dealloc async [%43] %memref_23 : memref<100352xindex>
    %45 = gpu.wait async
    %46 = gpu.dealloc async [%45] %memref_25 : memref<100352xindex>
    %47 = gpu.wait async
    %48 = gpu.dealloc async [%47] %memref_27 : memref<100352xf32>
    gpu.wait [%28, %30, %32, %34, %36, %38, %40, %42, %44, %46, %48]
    %49 = bufferization.to_tensor %1 : memref<128x1x28x28xf32>
    return %49 : tensor<128x1x28x28xf32>
  }
  func.func @main() {
    %c8 = arith.constant 8 : index
    %c10 = arith.constant 10 : index
    %cst = arith.constant 0.000000e+00 : f32
    llvm.call @mgpuCreateSparseEnv() : () -> ()
    %generated = tensor.generate  {
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
      %1 = arith.addi %arg0, %arg1 : index
      %2 = arith.addi %arg2, %arg3 : index
      %3 = arith.addi %1, %2 : index
      %4 = arith.remsi %3, %c10 : index
      %5 = arith.cmpi slt, %4, %c8 : index
      %6 = scf.if %5 -> (f32) {
        scf.yield %cst : f32
      } else {
        %7 = arith.index_cast %3 : index to i64
        %8 = arith.uitofp %7 : i64 to f32
        scf.yield %8 : f32
      }
      tensor.yield %6 : f32
    } : tensor<128x1x28x28xf32>
    %generated_0 = tensor.generate  {
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
      %1 = arith.addi %arg0, %arg1 : index
      %2 = arith.addi %arg2, %arg3 : index
      %3 = arith.addi %1, %2 : index
      %4 = arith.remsi %3, %c10 : index
      %5 = arith.cmpi slt, %4, %c8 : index
      %6 = scf.if %5 -> (f32) {
        scf.yield %cst : f32
      } else {
        %7 = arith.index_cast %3 : index to i64
        %8 = arith.uitofp %7 : i64 to f32
        scf.yield %8 : f32
      }
      tensor.yield %6 : f32
    } : tensor<128x1x28x28xf32>
    %generated_1 = tensor.generate  {
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
      tensor.yield %cst : f32
    } : tensor<128x1x28x28xf32>
    %0 = call @test_lif(%generated, %generated_0, %generated_1) : (tensor<128x1x28x28xf32>, tensor<128x1x28x28xf32>, tensor<128x1x28x28xf32>) -> tensor<128x1x28x28xf32>
    llvm.call @mgpuDestroySparseEnv() : () -> ()
    return
  }
}

