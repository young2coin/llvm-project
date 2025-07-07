module attributes {gpu.container_module, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "onnx-mlir.symbol-postfix" = "model"} {
  gpu.module @conv_kernels {
    gpu.func @conv2d_1(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: memref<1x27x27x1xf32>, %arg9: memref<1x28x28x1xf32>, %arg10: memref<1x2x2x1xf32>) kernel {
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %block_id_x = gpu.block_id  x
      %thread_id_x = gpu.thread_id  x
      %block_dim_x = gpu.block_dim  x
      %0 = arith.muli %block_id_x, %block_dim_x : index
      %1 = arith.addi %0, %thread_id_x : index
      %2 = arith.subi %arg1, %arg5 : index
      %3 = arith.addi %2, %c1 : index
      %4 = arith.subi %arg2, %arg6 : index
      %5 = arith.addi %4, %c1 : index
      %6 = arith.muli %arg0, %3 : index
      %7 = arith.muli %6, %5 : index
      %8 = arith.muli %7, %arg4 : index
      %9 = arith.cmpi ult, %1, %8 : index
      scf.if %9 {
        %10 = arith.remui %1, %arg4 : index
        %11 = arith.divui %1, %arg4 : index
        %12 = arith.remui %11, %5 : index
        %13 = arith.divui %11, %5 : index
        %14 = arith.remui %13, %3 : index
        %15 = arith.divui %13, %3 : index
        %16 = scf.for %arg11 = %c0 to %arg5 step %c1 iter_args(%arg12 = %cst) -> (f32) {
          %17 = scf.for %arg13 = %c0 to %arg6 step %c1 iter_args(%arg14 = %arg12) -> (f32) {
            %18 = scf.for %arg15 = %c0 to %arg3 step %c1 iter_args(%arg16 = %arg14) -> (f32) {
              %19 = arith.addi %14, %arg11 : index
              %20 = arith.addi %12, %arg13 : index
              %21 = memref.load %arg9[%15, %19, %20, %arg15] : memref<1x28x28x1xf32>
              %22 = memref.load %arg10[%10, %arg11, %arg13, %arg15] : memref<1x2x2x1xf32>
              %23 = arith.mulf %21, %22 : f32
              %24 = arith.addf %arg16, %23 : f32
              scf.yield %24 : f32
            }
            scf.yield %18 : f32
          }
          scf.yield %17 : f32
        }
        memref.store %16, %arg8[%15, %14, %12, %10] : memref<1x27x27x1xf32>
      }
      gpu.return
    }
    gpu.func @conv2d(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: memref<1x26x26x1xf32>, %arg9: memref<1x27x27x1xf32>, %arg10: memref<1x2x2x1xf32>) kernel {
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %block_id_x = gpu.block_id  x
      %thread_id_x = gpu.thread_id  x
      %block_dim_x = gpu.block_dim  x
      %0 = arith.muli %block_id_x, %block_dim_x : index
      %1 = arith.addi %0, %thread_id_x : index
      %2 = arith.subi %arg1, %arg5 : index
      %3 = arith.addi %2, %c1 : index
      %4 = arith.subi %arg2, %arg6 : index
      %5 = arith.addi %4, %c1 : index
      %6 = arith.muli %arg0, %3 : index
      %7 = arith.muli %6, %5 : index
      %8 = arith.muli %7, %arg4 : index
      %9 = arith.cmpi ult, %1, %8 : index
      scf.if %9 {
        %10 = arith.remui %1, %arg4 : index
        %11 = arith.divui %1, %arg4 : index
        %12 = arith.remui %11, %5 : index
        %13 = arith.divui %11, %5 : index
        %14 = arith.remui %13, %3 : index
        %15 = arith.divui %13, %3 : index
        %16 = scf.for %arg11 = %c0 to %arg5 step %c1 iter_args(%arg12 = %cst) -> (f32) {
          %17 = scf.for %arg13 = %c0 to %arg6 step %c1 iter_args(%arg14 = %arg12) -> (f32) {
            %18 = scf.for %arg15 = %c0 to %arg3 step %c1 iter_args(%arg16 = %arg14) -> (f32) {
              %19 = arith.addi %14, %arg11 : index
              %20 = arith.addi %12, %arg13 : index
              %21 = memref.load %arg9[%15, %19, %20, %arg15] : memref<1x27x27x1xf32>
              %22 = memref.load %arg10[%10, %arg11, %arg13, %arg15] : memref<1x2x2x1xf32>
              %23 = arith.mulf %21, %22 : f32
              %24 = arith.addf %arg16, %23 : f32
              scf.yield %24 : f32
            }
            scf.yield %18 : f32
          }
          scf.yield %17 : f32
        }
        memref.store %16, %arg8[%15, %14, %12, %10] : memref<1x26x26x1xf32>
      }
      gpu.return
    }
  }
  func.func @main_graph(%arg0: tensor<1x28x28x1xf32> {onnx.name = "input"}) -> (tensor<1x26x26x1xf32> {onnx.name = "output"}) {
    %c27 = arith.constant 27 : index
    %c1024 = arith.constant 1024 : index
    %c2 = arith.constant 2 : index
    %c28 = arith.constant 28 : index
    %c1 = arith.constant 1 : index
    %0 = tensor.empty() : tensor<1x2x2x1xf32>
    %1 = tensor.empty() : tensor<1x27x27x1xf32>
    %2 = tensor.empty() : tensor<1x26x26x1xf32>
    %3 = bufferization.to_memref %arg0 : memref<1x28x28x1xf32>
    %4 = bufferization.to_memref %0 : memref<1x2x2x1xf32>
    %5 = bufferization.to_memref %1 : memref<1x27x27x1xf32>
    %6 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%6] () : memref<1x27x27x1xf32>
    %7 = gpu.memcpy async [%asyncToken] %memref, %5 : memref<1x27x27x1xf32>, memref<1x27x27x1xf32>
    %8 = gpu.wait async
    %memref_0, %asyncToken_1 = gpu.alloc async [%8] () : memref<1x28x28x1xf32>
    %9 = gpu.memcpy async [%asyncToken_1] %memref_0, %3 : memref<1x28x28x1xf32>, memref<1x28x28x1xf32>
    %10 = gpu.wait async
    %memref_2, %asyncToken_3 = gpu.alloc async [%10] () : memref<1x2x2x1xf32>
    %11 = gpu.memcpy async [%asyncToken_3] %memref_2, %4 : memref<1x2x2x1xf32>, memref<1x2x2x1xf32>
    gpu.wait [%7, %9, %11]
    %12 = gpu.launch_func async @conv_kernels::@conv2d_1 blocks in (%c1, %c1, %c1) threads in (%c1024, %c1, %c1)  args(%c1 : index, %c28 : index, %c28 : index, %c1 : index, %c1 : index, %c2 : index, %c2 : index, %c1 : index, %memref : memref<1x27x27x1xf32>, %memref_0 : memref<1x28x28x1xf32>, %memref_2 : memref<1x2x2x1xf32>)
    %13 = gpu.memcpy async [%12] %5, %memref : memref<1x27x27x1xf32>, memref<1x27x27x1xf32>
    %14 = gpu.dealloc async [%13] %memref : memref<1x27x27x1xf32>
    %15 = gpu.wait async
    %16 = gpu.dealloc async [%15] %memref_0 : memref<1x28x28x1xf32>
    %17 = gpu.wait async
    %18 = gpu.dealloc async [%17] %memref_2 : memref<1x2x2x1xf32>
    gpu.wait [%14, %16, %18]
    %19 = bufferization.to_memref %0 : memref<1x2x2x1xf32>
    %20 = bufferization.to_memref %2 : memref<1x26x26x1xf32>
    %21 = gpu.wait async
    %memref_4, %asyncToken_5 = gpu.alloc async [%21] () : memref<1x26x26x1xf32>
    %22 = gpu.memcpy async [%asyncToken_5] %memref_4, %20 : memref<1x26x26x1xf32>, memref<1x26x26x1xf32>
    %23 = gpu.wait async
    %memref_6, %asyncToken_7 = gpu.alloc async [%23] () : memref<1x27x27x1xf32>
    %24 = gpu.memcpy async [%asyncToken_7] %memref_6, %5 : memref<1x27x27x1xf32>, memref<1x27x27x1xf32>
    %25 = gpu.wait async
    %memref_8, %asyncToken_9 = gpu.alloc async [%25] () : memref<1x2x2x1xf32>
    %26 = gpu.memcpy async [%asyncToken_9] %memref_8, %19 : memref<1x2x2x1xf32>, memref<1x2x2x1xf32>
    gpu.wait [%22, %24, %26]
    %27 = gpu.launch_func async @conv_kernels::@conv2d blocks in (%c1, %c1, %c1) threads in (%c1024, %c1, %c1)  args(%c1 : index, %c27 : index, %c27 : index, %c1 : index, %c1 : index, %c2 : index, %c2 : index, %c1 : index, %memref_4 : memref<1x26x26x1xf32>, %memref_6 : memref<1x27x27x1xf32>, %memref_8 : memref<1x2x2x1xf32>)
    %28 = gpu.memcpy async [%27] %20, %memref_4 : memref<1x26x26x1xf32>, memref<1x26x26x1xf32>
    %29 = gpu.dealloc async [%28] %memref_4 : memref<1x26x26x1xf32>
    %30 = gpu.wait async
    %31 = gpu.dealloc async [%30] %memref_6 : memref<1x27x27x1xf32>
    %32 = gpu.wait async
    %33 = gpu.dealloc async [%32] %memref_8 : memref<1x2x2x1xf32>
    gpu.wait [%29, %31, %33]
    %34 = bufferization.to_tensor %20 : memref<1x26x26x1xf32>
    return %34 : tensor<1x26x26x1xf32>
  }
}

