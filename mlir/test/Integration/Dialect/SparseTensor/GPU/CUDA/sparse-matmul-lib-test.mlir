module {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @printNewline()
  llvm.func @printClose()
  llvm.func @printComma()
  llvm.func @printF32(f32)
  llvm.func @printOpen()
  llvm.func @delSparseTensor(!llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @endLexInsert(!llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func private @lexInsertF32(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: !llvm.ptr, %arg7: !llvm.ptr, %arg8: i64) attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg1, %0[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg2, %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.insertvalue %arg3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %4 = llvm.insertvalue %arg4, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.insertvalue %arg5, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %6 = llvm.mlir.constant(1 : index) : i64
    %7 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %5, %7 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %8 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64)>
    %9 = llvm.insertvalue %arg6, %8[0] : !llvm.struct<(ptr, ptr, i64)> 
    %10 = llvm.insertvalue %arg7, %9[1] : !llvm.struct<(ptr, ptr, i64)> 
    %11 = llvm.insertvalue %arg8, %10[2] : !llvm.struct<(ptr, ptr, i64)> 
    %12 = llvm.mlir.constant(1 : index) : i64
    %13 = llvm.alloca %12 x !llvm.struct<(ptr, ptr, i64)> : (i64) -> !llvm.ptr
    llvm.store %11, %13 : !llvm.struct<(ptr, ptr, i64)>, !llvm.ptr
    llvm.call @_mlir_ciface_lexInsertF32(%arg0, %7, %13) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
  llvm.func @_mlir_ciface_lexInsertF32(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func private @newSparseTensor(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: !llvm.ptr, %arg6: !llvm.ptr, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: !llvm.ptr, %arg11: !llvm.ptr, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: !llvm.ptr, %arg16: !llvm.ptr, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: !llvm.ptr, %arg21: !llvm.ptr, %arg22: i64, %arg23: i64, %arg24: i64, %arg25: i32, %arg26: i32, %arg27: i32, %arg28: i32, %arg29: !llvm.ptr) -> !llvm.ptr attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg1, %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.insertvalue %arg2, %2[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %4 = llvm.insertvalue %arg3, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.insertvalue %arg4, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %6 = llvm.mlir.constant(1 : index) : i64
    %7 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %5, %7 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %8 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %9 = llvm.insertvalue %arg5, %8[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = llvm.insertvalue %arg6, %9[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg7, %10[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.insertvalue %arg8, %11[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %13 = llvm.insertvalue %arg9, %12[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.mlir.constant(1 : index) : i64
    %15 = llvm.alloca %14 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %13, %15 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %16 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %17 = llvm.insertvalue %arg10, %16[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.insertvalue %arg11, %17[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %19 = llvm.insertvalue %arg12, %18[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %20 = llvm.insertvalue %arg13, %19[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.insertvalue %arg14, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.mlir.constant(1 : index) : i64
    %23 = llvm.alloca %22 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %21, %23 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %24 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %25 = llvm.insertvalue %arg15, %24[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %26 = llvm.insertvalue %arg16, %25[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %27 = llvm.insertvalue %arg17, %26[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %28 = llvm.insertvalue %arg18, %27[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %29 = llvm.insertvalue %arg19, %28[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %30 = llvm.mlir.constant(1 : index) : i64
    %31 = llvm.alloca %30 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %29, %31 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %32 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %33 = llvm.insertvalue %arg20, %32[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %34 = llvm.insertvalue %arg21, %33[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %35 = llvm.insertvalue %arg22, %34[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %36 = llvm.insertvalue %arg23, %35[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %37 = llvm.insertvalue %arg24, %36[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %38 = llvm.mlir.constant(1 : index) : i64
    %39 = llvm.alloca %38 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %37, %39 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %40 = llvm.call @_mlir_ciface_newSparseTensor(%7, %15, %23, %31, %39, %arg25, %arg26, %arg27, %arg28, %arg29) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
    llvm.return %40 : !llvm.ptr
  }
  llvm.func @_mlir_ciface_newSparseTensor(!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, i32, i32, !llvm.ptr) -> !llvm.ptr attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func private @sparseCoordinates64(%arg0: !llvm.ptr, %arg1: i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.call @_mlir_ciface_sparseCoordinates64(%1, %arg0, %arg1) : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %2 = llvm.load %1 : !llvm.ptr -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    llvm.return %2 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
  }
  llvm.func @_mlir_ciface_sparseCoordinates64(!llvm.ptr, !llvm.ptr, i64) attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func private @sparsePositions64(%arg0: !llvm.ptr, %arg1: i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.call @_mlir_ciface_sparsePositions64(%1, %arg0, %arg1) : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %2 = llvm.load %1 : !llvm.ptr -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    llvm.return %2 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
  }
  llvm.func @_mlir_ciface_sparsePositions64(!llvm.ptr, !llvm.ptr, i64) attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func private @sparseCoordinates32(%arg0: !llvm.ptr, %arg1: i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.call @_mlir_ciface_sparseCoordinates32(%1, %arg0, %arg1) : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %2 = llvm.load %1 : !llvm.ptr -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    llvm.return %2 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
  }
  llvm.func @_mlir_ciface_sparseCoordinates32(!llvm.ptr, !llvm.ptr, i64) attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func private @sparsePositions32(%arg0: !llvm.ptr, %arg1: i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.call @_mlir_ciface_sparsePositions32(%1, %arg0, %arg1) : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %2 = llvm.load %1 : !llvm.ptr -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    llvm.return %2 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
  }
  llvm.func @_mlir_ciface_sparsePositions32(!llvm.ptr, !llvm.ptr, i64) attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func private @sparseCoordinates0(%arg0: !llvm.ptr, %arg1: i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.call @_mlir_ciface_sparseCoordinates0(%1, %arg0, %arg1) : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %2 = llvm.load %1 : !llvm.ptr -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    llvm.return %2 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
  }
  llvm.func @_mlir_ciface_sparseCoordinates0(!llvm.ptr, !llvm.ptr, i64) attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func private @sparseValuesF32(%arg0: !llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.call @_mlir_ciface_sparseValuesF32(%1, %arg0) : (!llvm.ptr, !llvm.ptr) -> ()
    %2 = llvm.load %1 : !llvm.ptr -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    llvm.return %2 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
  }
  llvm.func @_mlir_ciface_sparseValuesF32(!llvm.ptr, !llvm.ptr) attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func @mgpuCreateSparseEnv()
  llvm.func @mgpuDestroySparseEnv()
  llvm.func @matmulCOO(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: !llvm.ptr, %arg9: !llvm.ptr, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg8, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg9, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg10, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg11, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg13, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg12, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg14, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %9 = llvm.insertvalue %arg1, %8[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.insertvalue %arg2, %9[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %arg3, %10[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.insertvalue %arg4, %11[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.insertvalue %arg6, %12[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %arg5, %13[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg7, %14[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.constant(8 : index) : i64
    %17 = llvm.mlir.constant(1 : index) : i64
    %18 = llvm.mlir.constant(0 : index) : i64
    %19 = llvm.call @sparseValuesF32(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %20 = llvm.extractvalue %19[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.call @sparseCoordinates0(%arg0, %18) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %22 = llvm.call @sparseCoordinates0(%arg0, %17) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %23 = llvm.call @sparseValuesF32(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %24 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %25 = llvm.extractvalue %21[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %26 = llvm.mlir.constant(1 : index) : i64
    %27 = llvm.mlir.zero : !llvm.ptr
    %28 = llvm.getelementptr %27[%25] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %29 = llvm.ptrtoint %28 : !llvm.ptr to i64
    %30 = llvm.mlir.zero : !llvm.ptr
    %31 = llvm.mlir.constant(0 : i8) : i8
    %32 = llvm.call @mgpuMemAlloc(%29, %24, %31) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %33 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %34 = llvm.insertvalue %32, %33[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %35 = llvm.insertvalue %32, %34[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %36 = llvm.mlir.constant(0 : index) : i64
    %37 = llvm.insertvalue %36, %35[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %38 = llvm.insertvalue %25, %37[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %39 = llvm.insertvalue %26, %38[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %40 = llvm.extractvalue %21[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %41 = llvm.extractvalue %21[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %42 = llvm.mul %41, %40 : i64
    %43 = llvm.mlir.zero : !llvm.ptr
    %44 = llvm.getelementptr %43[%42] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %45 = llvm.ptrtoint %44 : !llvm.ptr to i64
    %46 = llvm.extractvalue %21[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %47 = llvm.extractvalue %39[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemcpy(%47, %46, %45, %24) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %48 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %49 = llvm.extractvalue %22[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %50 = llvm.mlir.constant(1 : index) : i64
    %51 = llvm.mlir.zero : !llvm.ptr
    %52 = llvm.getelementptr %51[%49] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %53 = llvm.ptrtoint %52 : !llvm.ptr to i64
    %54 = llvm.mlir.zero : !llvm.ptr
    %55 = llvm.mlir.constant(0 : i8) : i8
    %56 = llvm.call @mgpuMemAlloc(%53, %48, %55) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %57 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %58 = llvm.insertvalue %56, %57[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %59 = llvm.insertvalue %56, %58[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %60 = llvm.mlir.constant(0 : index) : i64
    %61 = llvm.insertvalue %60, %59[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %62 = llvm.insertvalue %49, %61[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %63 = llvm.insertvalue %50, %62[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %64 = llvm.extractvalue %22[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %65 = llvm.extractvalue %22[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %66 = llvm.mul %65, %64 : i64
    %67 = llvm.mlir.zero : !llvm.ptr
    %68 = llvm.getelementptr %67[%66] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %69 = llvm.ptrtoint %68 : !llvm.ptr to i64
    %70 = llvm.extractvalue %22[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %71 = llvm.extractvalue %63[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemcpy(%71, %70, %69, %48) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %72 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %73 = llvm.extractvalue %23[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %74 = llvm.mlir.constant(1 : index) : i64
    %75 = llvm.mlir.zero : !llvm.ptr
    %76 = llvm.getelementptr %75[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %77 = llvm.ptrtoint %76 : !llvm.ptr to i64
    %78 = llvm.mlir.zero : !llvm.ptr
    %79 = llvm.mlir.constant(0 : i8) : i8
    %80 = llvm.call @mgpuMemAlloc(%77, %72, %79) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %81 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %82 = llvm.insertvalue %80, %81[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %83 = llvm.insertvalue %80, %82[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %84 = llvm.mlir.constant(0 : index) : i64
    %85 = llvm.insertvalue %84, %83[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %86 = llvm.insertvalue %73, %85[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %87 = llvm.insertvalue %74, %86[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %88 = llvm.extractvalue %23[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %89 = llvm.extractvalue %23[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %90 = llvm.mul %89, %88 : i64
    %91 = llvm.mlir.zero : !llvm.ptr
    %92 = llvm.getelementptr %91[%90] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %93 = llvm.ptrtoint %92 : !llvm.ptr to i64
    %94 = llvm.extractvalue %23[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %95 = llvm.extractvalue %87[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemcpy(%95, %94, %93, %72) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %96 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %97 = llvm.mlir.constant(8 : index) : i64
    %98 = llvm.mlir.constant(8 : index) : i64
    %99 = llvm.mlir.constant(1 : index) : i64
    %100 = llvm.mlir.constant(64 : index) : i64
    %101 = llvm.mlir.zero : !llvm.ptr
    %102 = llvm.getelementptr %101[%100] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %103 = llvm.ptrtoint %102 : !llvm.ptr to i64
    %104 = llvm.mlir.zero : !llvm.ptr
    %105 = llvm.mlir.constant(0 : i8) : i8
    %106 = llvm.call @mgpuMemAlloc(%103, %96, %105) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %107 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %108 = llvm.insertvalue %106, %107[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %109 = llvm.insertvalue %106, %108[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %110 = llvm.mlir.constant(0 : index) : i64
    %111 = llvm.insertvalue %110, %109[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %112 = llvm.insertvalue %97, %111[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %113 = llvm.insertvalue %98, %112[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %114 = llvm.insertvalue %98, %113[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %115 = llvm.insertvalue %99, %114[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %116 = llvm.mlir.constant(64 : index) : i64
    %117 = llvm.mlir.zero : !llvm.ptr
    %118 = llvm.getelementptr %117[%116] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %119 = llvm.ptrtoint %118 : !llvm.ptr to i64
    %120 = llvm.extractvalue %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %121 = llvm.extractvalue %115[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @mgpuMemcpy(%121, %120, %119, %96) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %122 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %123 = llvm.mlir.constant(8 : index) : i64
    %124 = llvm.mlir.constant(8 : index) : i64
    %125 = llvm.mlir.constant(1 : index) : i64
    %126 = llvm.mlir.constant(64 : index) : i64
    %127 = llvm.mlir.zero : !llvm.ptr
    %128 = llvm.getelementptr %127[%126] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %129 = llvm.ptrtoint %128 : !llvm.ptr to i64
    %130 = llvm.mlir.zero : !llvm.ptr
    %131 = llvm.mlir.constant(0 : i8) : i8
    %132 = llvm.call @mgpuMemAlloc(%129, %122, %131) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %133 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %134 = llvm.insertvalue %132, %133[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %135 = llvm.insertvalue %132, %134[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %136 = llvm.mlir.constant(0 : index) : i64
    %137 = llvm.insertvalue %136, %135[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %138 = llvm.insertvalue %123, %137[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %139 = llvm.insertvalue %124, %138[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %140 = llvm.insertvalue %124, %139[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %141 = llvm.insertvalue %125, %140[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %142 = llvm.mlir.constant(64 : index) : i64
    %143 = llvm.mlir.zero : !llvm.ptr
    %144 = llvm.getelementptr %143[%142] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %145 = llvm.ptrtoint %144 : !llvm.ptr to i64
    %146 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %147 = llvm.extractvalue %141[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @mgpuMemcpy(%147, %146, %145, %122) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%24) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%24) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%48) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%48) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%72) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%72) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%96) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%96) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%122) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%122) : (!llvm.ptr) -> ()
    %148 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %149 = llvm.extractvalue %39[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %150 = llvm.extractvalue %63[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %151 = llvm.extractvalue %87[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %152 = llvm.mlir.constant(3 : i32) : i32
    %153 = llvm.mlir.constant(0 : i32) : i32
    %154 = llvm.call @mgpuCreateCoo(%16, %16, %20, %149, %150, %151, %152, %153, %148) : (i64, i64, i64, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, !llvm.ptr) -> !llvm.ptr
    %155 = llvm.extractvalue %115[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %156 = llvm.mlir.constant(0 : i32) : i32
    %157 = llvm.call @mgpuCreateDnMat(%16, %16, %155, %156, %148) : (i64, i64, !llvm.ptr, i32, !llvm.ptr) -> !llvm.ptr
    %158 = llvm.extractvalue %141[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %159 = llvm.mlir.constant(0 : i32) : i32
    %160 = llvm.call @mgpuCreateDnMat(%16, %16, %158, %159, %148) : (i64, i64, !llvm.ptr, i32, !llvm.ptr) -> !llvm.ptr
    %161 = llvm.mlir.constant(0 : i32) : i32
    %162 = llvm.mlir.constant(0 : i32) : i32
    %163 = llvm.mlir.constant(0 : i32) : i32
    %164 = llvm.call @mgpuSpMMBufferSize(%161, %162, %154, %157, %160, %163, %148) : (i32, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr) -> i64
    %165 = llvm.mlir.constant(1 : index) : i64
    %166 = llvm.mlir.zero : !llvm.ptr
    %167 = llvm.getelementptr %166[%164] : (!llvm.ptr, i64) -> !llvm.ptr, i8
    %168 = llvm.ptrtoint %167 : !llvm.ptr to i64
    %169 = llvm.mlir.zero : !llvm.ptr
    %170 = llvm.mlir.constant(0 : i8) : i8
    %171 = llvm.call @mgpuMemAlloc(%168, %148, %170) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %172 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %173 = llvm.insertvalue %171, %172[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %174 = llvm.insertvalue %171, %173[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %175 = llvm.mlir.constant(0 : index) : i64
    %176 = llvm.insertvalue %175, %174[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %177 = llvm.insertvalue %164, %176[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %178 = llvm.insertvalue %165, %177[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %179 = llvm.mlir.constant(0 : i32) : i32
    %180 = llvm.mlir.constant(0 : i32) : i32
    %181 = llvm.mlir.constant(0 : i32) : i32
    %182 = llvm.extractvalue %178[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuSpMM(%179, %180, %154, %157, %160, %181, %182, %148) : (i32, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @mgpuDestroySpMat(%154, %148) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.call @mgpuDestroyDnMat(%157, %148) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.call @mgpuDestroyDnMat(%160, %148) : (!llvm.ptr, !llvm.ptr) -> ()
    %183 = llvm.extractvalue %39[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemFree(%183, %148) : (!llvm.ptr, !llvm.ptr) -> ()
    %184 = llvm.extractvalue %63[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemFree(%184, %148) : (!llvm.ptr, !llvm.ptr) -> ()
    %185 = llvm.extractvalue %87[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemFree(%185, %148) : (!llvm.ptr, !llvm.ptr) -> ()
    %186 = llvm.extractvalue %178[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemFree(%186, %148) : (!llvm.ptr, !llvm.ptr) -> ()
    %187 = llvm.extractvalue %115[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @mgpuMemFree(%187, %148) : (!llvm.ptr, !llvm.ptr) -> ()
    %188 = llvm.mlir.constant(64 : index) : i64
    %189 = llvm.mlir.zero : !llvm.ptr
    %190 = llvm.getelementptr %189[%188] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %191 = llvm.ptrtoint %190 : !llvm.ptr to i64
    %192 = llvm.extractvalue %141[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %193 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @mgpuMemcpy(%193, %192, %191, %148) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %194 = llvm.extractvalue %141[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @mgpuMemFree(%194, %148) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%148) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%148) : (!llvm.ptr) -> ()
    llvm.return %7 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  }
  llvm.func @matmulCSR(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: !llvm.ptr, %arg9: !llvm.ptr, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg8, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg9, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg10, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg11, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg13, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg12, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg14, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %9 = llvm.insertvalue %arg1, %8[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.insertvalue %arg2, %9[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %arg3, %10[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.insertvalue %arg4, %11[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.insertvalue %arg6, %12[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %arg5, %13[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg7, %14[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.mlir.constant(8 : index) : i64
    %18 = llvm.call @sparseValuesF32(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %19 = llvm.extractvalue %18[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %20 = llvm.call @sparsePositions32(%arg0, %16) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %21 = llvm.call @sparseCoordinates32(%arg0, %16) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %22 = llvm.call @sparseValuesF32(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %23 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %24 = llvm.extractvalue %20[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.mlir.zero : !llvm.ptr
    %27 = llvm.getelementptr %26[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %28 = llvm.ptrtoint %27 : !llvm.ptr to i64
    %29 = llvm.mlir.zero : !llvm.ptr
    %30 = llvm.mlir.constant(0 : i8) : i8
    %31 = llvm.call @mgpuMemAlloc(%28, %23, %30) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %32 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %33 = llvm.insertvalue %31, %32[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %34 = llvm.insertvalue %31, %33[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %35 = llvm.mlir.constant(0 : index) : i64
    %36 = llvm.insertvalue %35, %34[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %37 = llvm.insertvalue %24, %36[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %38 = llvm.insertvalue %25, %37[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %39 = llvm.extractvalue %20[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %40 = llvm.extractvalue %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %41 = llvm.mul %40, %39 : i64
    %42 = llvm.mlir.zero : !llvm.ptr
    %43 = llvm.getelementptr %42[%41] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %44 = llvm.ptrtoint %43 : !llvm.ptr to i64
    %45 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %46 = llvm.extractvalue %38[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemcpy(%46, %45, %44, %23) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %47 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %48 = llvm.extractvalue %21[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %49 = llvm.mlir.constant(1 : index) : i64
    %50 = llvm.mlir.zero : !llvm.ptr
    %51 = llvm.getelementptr %50[%48] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %52 = llvm.ptrtoint %51 : !llvm.ptr to i64
    %53 = llvm.mlir.zero : !llvm.ptr
    %54 = llvm.mlir.constant(0 : i8) : i8
    %55 = llvm.call @mgpuMemAlloc(%52, %47, %54) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %56 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %57 = llvm.insertvalue %55, %56[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %58 = llvm.insertvalue %55, %57[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %59 = llvm.mlir.constant(0 : index) : i64
    %60 = llvm.insertvalue %59, %58[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %61 = llvm.insertvalue %48, %60[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %62 = llvm.insertvalue %49, %61[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %63 = llvm.extractvalue %21[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %64 = llvm.extractvalue %21[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %65 = llvm.mul %64, %63 : i64
    %66 = llvm.mlir.zero : !llvm.ptr
    %67 = llvm.getelementptr %66[%65] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %68 = llvm.ptrtoint %67 : !llvm.ptr to i64
    %69 = llvm.extractvalue %21[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %70 = llvm.extractvalue %62[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemcpy(%70, %69, %68, %47) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %71 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %72 = llvm.extractvalue %22[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %73 = llvm.mlir.constant(1 : index) : i64
    %74 = llvm.mlir.zero : !llvm.ptr
    %75 = llvm.getelementptr %74[%72] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %76 = llvm.ptrtoint %75 : !llvm.ptr to i64
    %77 = llvm.mlir.zero : !llvm.ptr
    %78 = llvm.mlir.constant(0 : i8) : i8
    %79 = llvm.call @mgpuMemAlloc(%76, %71, %78) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %80 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %81 = llvm.insertvalue %79, %80[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %82 = llvm.insertvalue %79, %81[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %83 = llvm.mlir.constant(0 : index) : i64
    %84 = llvm.insertvalue %83, %82[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %85 = llvm.insertvalue %72, %84[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %86 = llvm.insertvalue %73, %85[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %87 = llvm.extractvalue %22[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %88 = llvm.extractvalue %22[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %89 = llvm.mul %88, %87 : i64
    %90 = llvm.mlir.zero : !llvm.ptr
    %91 = llvm.getelementptr %90[%89] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %92 = llvm.ptrtoint %91 : !llvm.ptr to i64
    %93 = llvm.extractvalue %22[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %94 = llvm.extractvalue %86[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemcpy(%94, %93, %92, %71) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %95 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %96 = llvm.mlir.constant(8 : index) : i64
    %97 = llvm.mlir.constant(8 : index) : i64
    %98 = llvm.mlir.constant(1 : index) : i64
    %99 = llvm.mlir.constant(64 : index) : i64
    %100 = llvm.mlir.zero : !llvm.ptr
    %101 = llvm.getelementptr %100[%99] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %102 = llvm.ptrtoint %101 : !llvm.ptr to i64
    %103 = llvm.mlir.zero : !llvm.ptr
    %104 = llvm.mlir.constant(0 : i8) : i8
    %105 = llvm.call @mgpuMemAlloc(%102, %95, %104) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %106 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %107 = llvm.insertvalue %105, %106[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %108 = llvm.insertvalue %105, %107[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %109 = llvm.mlir.constant(0 : index) : i64
    %110 = llvm.insertvalue %109, %108[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %111 = llvm.insertvalue %96, %110[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %112 = llvm.insertvalue %97, %111[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %113 = llvm.insertvalue %97, %112[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %114 = llvm.insertvalue %98, %113[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %115 = llvm.mlir.constant(64 : index) : i64
    %116 = llvm.mlir.zero : !llvm.ptr
    %117 = llvm.getelementptr %116[%115] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %118 = llvm.ptrtoint %117 : !llvm.ptr to i64
    %119 = llvm.extractvalue %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %120 = llvm.extractvalue %114[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @mgpuMemcpy(%120, %119, %118, %95) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %121 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %122 = llvm.mlir.constant(8 : index) : i64
    %123 = llvm.mlir.constant(8 : index) : i64
    %124 = llvm.mlir.constant(1 : index) : i64
    %125 = llvm.mlir.constant(64 : index) : i64
    %126 = llvm.mlir.zero : !llvm.ptr
    %127 = llvm.getelementptr %126[%125] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %128 = llvm.ptrtoint %127 : !llvm.ptr to i64
    %129 = llvm.mlir.zero : !llvm.ptr
    %130 = llvm.mlir.constant(0 : i8) : i8
    %131 = llvm.call @mgpuMemAlloc(%128, %121, %130) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %132 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %133 = llvm.insertvalue %131, %132[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %134 = llvm.insertvalue %131, %133[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %135 = llvm.mlir.constant(0 : index) : i64
    %136 = llvm.insertvalue %135, %134[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %137 = llvm.insertvalue %122, %136[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %138 = llvm.insertvalue %123, %137[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %139 = llvm.insertvalue %123, %138[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %140 = llvm.insertvalue %124, %139[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %141 = llvm.mlir.constant(64 : index) : i64
    %142 = llvm.mlir.zero : !llvm.ptr
    %143 = llvm.getelementptr %142[%141] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %144 = llvm.ptrtoint %143 : !llvm.ptr to i64
    %145 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %146 = llvm.extractvalue %140[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @mgpuMemcpy(%146, %145, %144, %121) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%23) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%23) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%47) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%47) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%71) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%71) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%95) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%95) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%121) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%121) : (!llvm.ptr) -> ()
    %147 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %148 = llvm.extractvalue %38[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %149 = llvm.extractvalue %62[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %150 = llvm.extractvalue %86[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %151 = llvm.mlir.constant(2 : i32) : i32
    %152 = llvm.mlir.constant(2 : i32) : i32
    %153 = llvm.mlir.constant(0 : i32) : i32
    %154 = llvm.call @mgpuCreateCsr(%17, %17, %19, %148, %149, %150, %151, %152, %153, %147) : (i64, i64, i64, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
    %155 = llvm.extractvalue %114[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %156 = llvm.mlir.constant(0 : i32) : i32
    %157 = llvm.call @mgpuCreateDnMat(%17, %17, %155, %156, %147) : (i64, i64, !llvm.ptr, i32, !llvm.ptr) -> !llvm.ptr
    %158 = llvm.extractvalue %140[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %159 = llvm.mlir.constant(0 : i32) : i32
    %160 = llvm.call @mgpuCreateDnMat(%17, %17, %158, %159, %147) : (i64, i64, !llvm.ptr, i32, !llvm.ptr) -> !llvm.ptr
    %161 = llvm.mlir.constant(0 : i32) : i32
    %162 = llvm.mlir.constant(0 : i32) : i32
    %163 = llvm.mlir.constant(0 : i32) : i32
    %164 = llvm.call @mgpuSpMMBufferSize(%161, %162, %154, %157, %160, %163, %147) : (i32, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr) -> i64
    %165 = llvm.mlir.constant(1 : index) : i64
    %166 = llvm.mlir.zero : !llvm.ptr
    %167 = llvm.getelementptr %166[%164] : (!llvm.ptr, i64) -> !llvm.ptr, i8
    %168 = llvm.ptrtoint %167 : !llvm.ptr to i64
    %169 = llvm.mlir.zero : !llvm.ptr
    %170 = llvm.mlir.constant(0 : i8) : i8
    %171 = llvm.call @mgpuMemAlloc(%168, %147, %170) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %172 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %173 = llvm.insertvalue %171, %172[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %174 = llvm.insertvalue %171, %173[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %175 = llvm.mlir.constant(0 : index) : i64
    %176 = llvm.insertvalue %175, %174[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %177 = llvm.insertvalue %164, %176[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %178 = llvm.insertvalue %165, %177[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %179 = llvm.mlir.constant(0 : i32) : i32
    %180 = llvm.mlir.constant(0 : i32) : i32
    %181 = llvm.mlir.constant(0 : i32) : i32
    %182 = llvm.extractvalue %178[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuSpMM(%179, %180, %154, %157, %160, %181, %182, %147) : (i32, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @mgpuDestroySpMat(%154, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.call @mgpuDestroyDnMat(%157, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.call @mgpuDestroyDnMat(%160, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    %183 = llvm.extractvalue %38[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemFree(%183, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    %184 = llvm.extractvalue %62[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemFree(%184, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    %185 = llvm.extractvalue %86[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemFree(%185, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    %186 = llvm.extractvalue %178[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemFree(%186, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    %187 = llvm.extractvalue %114[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @mgpuMemFree(%187, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    %188 = llvm.mlir.constant(64 : index) : i64
    %189 = llvm.mlir.zero : !llvm.ptr
    %190 = llvm.getelementptr %189[%188] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %191 = llvm.ptrtoint %190 : !llvm.ptr to i64
    %192 = llvm.extractvalue %140[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %193 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @mgpuMemcpy(%193, %192, %191, %147) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %194 = llvm.extractvalue %140[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @mgpuMemFree(%194, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%147) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%147) : (!llvm.ptr) -> ()
    llvm.return %7 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  }
  llvm.func @matmulCSC(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: !llvm.ptr, %arg9: !llvm.ptr, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg8, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg9, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg10, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg11, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg13, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg12, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg14, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %9 = llvm.insertvalue %arg1, %8[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.insertvalue %arg2, %9[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %arg3, %10[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.insertvalue %arg4, %11[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.insertvalue %arg6, %12[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %arg5, %13[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg7, %14[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.mlir.constant(8 : index) : i64
    %18 = llvm.call @sparseValuesF32(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %19 = llvm.extractvalue %18[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %20 = llvm.call @sparsePositions64(%arg0, %16) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %21 = llvm.call @sparseCoordinates64(%arg0, %16) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %22 = llvm.call @sparseValuesF32(%arg0) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %23 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %24 = llvm.extractvalue %20[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.mlir.zero : !llvm.ptr
    %27 = llvm.getelementptr %26[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %28 = llvm.ptrtoint %27 : !llvm.ptr to i64
    %29 = llvm.mlir.zero : !llvm.ptr
    %30 = llvm.mlir.constant(0 : i8) : i8
    %31 = llvm.call @mgpuMemAlloc(%28, %23, %30) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %32 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %33 = llvm.insertvalue %31, %32[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %34 = llvm.insertvalue %31, %33[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %35 = llvm.mlir.constant(0 : index) : i64
    %36 = llvm.insertvalue %35, %34[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %37 = llvm.insertvalue %24, %36[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %38 = llvm.insertvalue %25, %37[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %39 = llvm.extractvalue %20[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %40 = llvm.extractvalue %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %41 = llvm.mul %40, %39 : i64
    %42 = llvm.mlir.zero : !llvm.ptr
    %43 = llvm.getelementptr %42[%41] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %44 = llvm.ptrtoint %43 : !llvm.ptr to i64
    %45 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %46 = llvm.extractvalue %38[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemcpy(%46, %45, %44, %23) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %47 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %48 = llvm.extractvalue %21[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %49 = llvm.mlir.constant(1 : index) : i64
    %50 = llvm.mlir.zero : !llvm.ptr
    %51 = llvm.getelementptr %50[%48] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %52 = llvm.ptrtoint %51 : !llvm.ptr to i64
    %53 = llvm.mlir.zero : !llvm.ptr
    %54 = llvm.mlir.constant(0 : i8) : i8
    %55 = llvm.call @mgpuMemAlloc(%52, %47, %54) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %56 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %57 = llvm.insertvalue %55, %56[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %58 = llvm.insertvalue %55, %57[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %59 = llvm.mlir.constant(0 : index) : i64
    %60 = llvm.insertvalue %59, %58[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %61 = llvm.insertvalue %48, %60[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %62 = llvm.insertvalue %49, %61[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %63 = llvm.extractvalue %21[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %64 = llvm.extractvalue %21[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %65 = llvm.mul %64, %63 : i64
    %66 = llvm.mlir.zero : !llvm.ptr
    %67 = llvm.getelementptr %66[%65] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %68 = llvm.ptrtoint %67 : !llvm.ptr to i64
    %69 = llvm.extractvalue %21[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %70 = llvm.extractvalue %62[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemcpy(%70, %69, %68, %47) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %71 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %72 = llvm.extractvalue %22[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %73 = llvm.mlir.constant(1 : index) : i64
    %74 = llvm.mlir.zero : !llvm.ptr
    %75 = llvm.getelementptr %74[%72] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %76 = llvm.ptrtoint %75 : !llvm.ptr to i64
    %77 = llvm.mlir.zero : !llvm.ptr
    %78 = llvm.mlir.constant(0 : i8) : i8
    %79 = llvm.call @mgpuMemAlloc(%76, %71, %78) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %80 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %81 = llvm.insertvalue %79, %80[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %82 = llvm.insertvalue %79, %81[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %83 = llvm.mlir.constant(0 : index) : i64
    %84 = llvm.insertvalue %83, %82[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %85 = llvm.insertvalue %72, %84[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %86 = llvm.insertvalue %73, %85[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %87 = llvm.extractvalue %22[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %88 = llvm.extractvalue %22[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %89 = llvm.mul %88, %87 : i64
    %90 = llvm.mlir.zero : !llvm.ptr
    %91 = llvm.getelementptr %90[%89] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %92 = llvm.ptrtoint %91 : !llvm.ptr to i64
    %93 = llvm.extractvalue %22[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %94 = llvm.extractvalue %86[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemcpy(%94, %93, %92, %71) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %95 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %96 = llvm.mlir.constant(8 : index) : i64
    %97 = llvm.mlir.constant(8 : index) : i64
    %98 = llvm.mlir.constant(1 : index) : i64
    %99 = llvm.mlir.constant(64 : index) : i64
    %100 = llvm.mlir.zero : !llvm.ptr
    %101 = llvm.getelementptr %100[%99] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %102 = llvm.ptrtoint %101 : !llvm.ptr to i64
    %103 = llvm.mlir.zero : !llvm.ptr
    %104 = llvm.mlir.constant(0 : i8) : i8
    %105 = llvm.call @mgpuMemAlloc(%102, %95, %104) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %106 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %107 = llvm.insertvalue %105, %106[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %108 = llvm.insertvalue %105, %107[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %109 = llvm.mlir.constant(0 : index) : i64
    %110 = llvm.insertvalue %109, %108[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %111 = llvm.insertvalue %96, %110[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %112 = llvm.insertvalue %97, %111[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %113 = llvm.insertvalue %97, %112[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %114 = llvm.insertvalue %98, %113[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %115 = llvm.mlir.constant(64 : index) : i64
    %116 = llvm.mlir.zero : !llvm.ptr
    %117 = llvm.getelementptr %116[%115] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %118 = llvm.ptrtoint %117 : !llvm.ptr to i64
    %119 = llvm.extractvalue %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %120 = llvm.extractvalue %114[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @mgpuMemcpy(%120, %119, %118, %95) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %121 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %122 = llvm.mlir.constant(8 : index) : i64
    %123 = llvm.mlir.constant(8 : index) : i64
    %124 = llvm.mlir.constant(1 : index) : i64
    %125 = llvm.mlir.constant(64 : index) : i64
    %126 = llvm.mlir.zero : !llvm.ptr
    %127 = llvm.getelementptr %126[%125] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %128 = llvm.ptrtoint %127 : !llvm.ptr to i64
    %129 = llvm.mlir.zero : !llvm.ptr
    %130 = llvm.mlir.constant(0 : i8) : i8
    %131 = llvm.call @mgpuMemAlloc(%128, %121, %130) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %132 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %133 = llvm.insertvalue %131, %132[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %134 = llvm.insertvalue %131, %133[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %135 = llvm.mlir.constant(0 : index) : i64
    %136 = llvm.insertvalue %135, %134[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %137 = llvm.insertvalue %122, %136[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %138 = llvm.insertvalue %123, %137[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %139 = llvm.insertvalue %123, %138[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %140 = llvm.insertvalue %124, %139[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %141 = llvm.mlir.constant(64 : index) : i64
    %142 = llvm.mlir.zero : !llvm.ptr
    %143 = llvm.getelementptr %142[%141] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %144 = llvm.ptrtoint %143 : !llvm.ptr to i64
    %145 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %146 = llvm.extractvalue %140[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @mgpuMemcpy(%146, %145, %144, %121) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%23) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%23) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%47) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%47) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%71) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%71) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%95) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%95) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%121) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%121) : (!llvm.ptr) -> ()
    %147 = llvm.call @mgpuStreamCreate() : () -> !llvm.ptr
    %148 = llvm.extractvalue %38[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %149 = llvm.extractvalue %62[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %150 = llvm.extractvalue %86[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %151 = llvm.mlir.constant(3 : i32) : i32
    %152 = llvm.mlir.constant(3 : i32) : i32
    %153 = llvm.mlir.constant(0 : i32) : i32
    %154 = llvm.call @mgpuCreateCsc(%17, %17, %19, %148, %149, %150, %151, %152, %153, %147) : (i64, i64, i64, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
    %155 = llvm.extractvalue %114[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %156 = llvm.mlir.constant(0 : i32) : i32
    %157 = llvm.call @mgpuCreateDnMat(%17, %17, %155, %156, %147) : (i64, i64, !llvm.ptr, i32, !llvm.ptr) -> !llvm.ptr
    %158 = llvm.extractvalue %140[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %159 = llvm.mlir.constant(0 : i32) : i32
    %160 = llvm.call @mgpuCreateDnMat(%17, %17, %158, %159, %147) : (i64, i64, !llvm.ptr, i32, !llvm.ptr) -> !llvm.ptr
    %161 = llvm.mlir.constant(0 : i32) : i32
    %162 = llvm.mlir.constant(0 : i32) : i32
    %163 = llvm.mlir.constant(0 : i32) : i32
    %164 = llvm.call @mgpuSpMMBufferSize(%161, %162, %154, %157, %160, %163, %147) : (i32, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr) -> i64
    %165 = llvm.mlir.constant(1 : index) : i64
    %166 = llvm.mlir.zero : !llvm.ptr
    %167 = llvm.getelementptr %166[%164] : (!llvm.ptr, i64) -> !llvm.ptr, i8
    %168 = llvm.ptrtoint %167 : !llvm.ptr to i64
    %169 = llvm.mlir.zero : !llvm.ptr
    %170 = llvm.mlir.constant(0 : i8) : i8
    %171 = llvm.call @mgpuMemAlloc(%168, %147, %170) : (i64, !llvm.ptr, i8) -> !llvm.ptr
    %172 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %173 = llvm.insertvalue %171, %172[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %174 = llvm.insertvalue %171, %173[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %175 = llvm.mlir.constant(0 : index) : i64
    %176 = llvm.insertvalue %175, %174[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %177 = llvm.insertvalue %164, %176[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %178 = llvm.insertvalue %165, %177[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %179 = llvm.mlir.constant(0 : i32) : i32
    %180 = llvm.mlir.constant(0 : i32) : i32
    %181 = llvm.mlir.constant(0 : i32) : i32
    %182 = llvm.extractvalue %178[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuSpMM(%179, %180, %154, %157, %160, %181, %182, %147) : (i32, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr, !llvm.ptr) -> ()
    llvm.call @mgpuDestroySpMat(%154, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.call @mgpuDestroyDnMat(%157, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.call @mgpuDestroyDnMat(%160, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    %183 = llvm.extractvalue %38[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemFree(%183, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    %184 = llvm.extractvalue %62[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemFree(%184, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    %185 = llvm.extractvalue %86[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemFree(%185, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    %186 = llvm.extractvalue %178[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.call @mgpuMemFree(%186, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    %187 = llvm.extractvalue %114[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @mgpuMemFree(%187, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    %188 = llvm.mlir.constant(64 : index) : i64
    %189 = llvm.mlir.zero : !llvm.ptr
    %190 = llvm.getelementptr %189[%188] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %191 = llvm.ptrtoint %190 : !llvm.ptr to i64
    %192 = llvm.extractvalue %140[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %193 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @mgpuMemcpy(%193, %192, %191, %147) : (!llvm.ptr, !llvm.ptr, i64, !llvm.ptr) -> ()
    %194 = llvm.extractvalue %140[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @mgpuMemFree(%194, %147) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.call @mgpuStreamSynchronize(%147) : (!llvm.ptr) -> ()
    llvm.call @mgpuStreamDestroy(%147) : (!llvm.ptr) -> ()
    llvm.return %7 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
  }
  llvm.func @dump(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64) {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg1, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg2, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg3, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg5, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg4, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg6, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.mlir.constant(8 : index) : i64
    %9 = llvm.mlir.constant(8 : index) : i64
    %10 = llvm.mlir.constant(1 : index) : i64
    %11 = llvm.mlir.constant(0 : index) : i64
    %12 = llvm.mlir.constant(7 : index) : i64
    llvm.br ^bb1(%11 : i64)
  ^bb1(%13: i64):  // 2 preds: ^bb0, ^bb7
    %14 = llvm.icmp "slt" %13, %9 : i64
    llvm.cond_br %14, ^bb2, ^bb8
  ^bb2:  // pred: ^bb1
    %15 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mul %13, %8 : i64
    %17 = llvm.add %16, %11 : i64
    %18 = llvm.getelementptr %15[%17] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %19 = llvm.load %18 {alignment = 4 : i64} : !llvm.ptr -> vector<8xf32>
    llvm.call @printOpen() : () -> ()
    llvm.br ^bb3(%11 : i64)
  ^bb3(%20: i64):  // 2 preds: ^bb2, ^bb6
    %21 = llvm.icmp "slt" %20, %9 : i64
    llvm.cond_br %21, ^bb4, ^bb7
  ^bb4:  // pred: ^bb3
    %22 = llvm.extractelement %19[%20 : i64] : vector<8xf32>
    llvm.call @printF32(%22) : (f32) -> ()
    %23 = llvm.icmp "ult" %20, %12 : i64
    llvm.cond_br %23, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    llvm.call @printComma() : () -> ()
    llvm.br ^bb6
  ^bb6:  // 2 preds: ^bb4, ^bb5
    %24 = llvm.add %20, %10 : i64
    llvm.br ^bb3(%24 : i64)
  ^bb7:  // pred: ^bb3
    llvm.call @printClose() : () -> ()
    llvm.call @printNewline() : () -> ()
    %25 = llvm.add %13, %10 : i64
    llvm.br ^bb1(%25 : i64)
  ^bb8:  // pred: ^bb1
    llvm.return
  }
  llvm.func @main() {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64)>
    %1 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %2 = llvm.mlir.constant(2 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %5 = llvm.mlir.constant(64 : index) : i64
    %6 = llvm.mlir.constant(1 : index) : i64
    %7 = llvm.mlir.constant(8 : index) : i64
    %8 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %9 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    %10 = llvm.mlir.constant(8 : index) : i64
    %11 = llvm.mlir.constant(0 : index) : i64
    %12 = llvm.mlir.constant(3 : i32) : i32
    %13 = llvm.mlir.constant(1 : i32) : i32
    %14 = llvm.mlir.constant(524290 : i64) : i64
    %15 = llvm.mlir.constant(262147 : i64) : i64
    %16 = llvm.mlir.constant(262144 : i64) : i64
    %17 = llvm.mlir.constant(65536 : i64) : i64
    %18 = llvm.mlir.zero : !llvm.ptr
    %19 = llvm.mlir.constant(2 : i32) : i32
    %20 = llvm.mlir.constant(0 : i32) : i32
    %21 = llvm.mlir.constant(524288 : i64) : i64
    %22 = llvm.mlir.constant(262145 : i64) : i64
    %23 = llvm.mlir.constant(false) : i1
    %24 = llvm.mlir.constant(1 : index) : i64
    llvm.call @mgpuCreateSparseEnv() : () -> ()
    %25 = llvm.getelementptr %18[64] : (!llvm.ptr) -> !llvm.ptr, f32
    %26 = llvm.ptrtoint %25 : !llvm.ptr to i64
    %27 = llvm.add %26, %5 : i64
    %28 = llvm.call @malloc(%27) : (i64) -> !llvm.ptr
    %29 = llvm.ptrtoint %28 : !llvm.ptr to i64
    %30 = llvm.sub %5, %6 : i64
    %31 = llvm.add %29, %30 : i64
    %32 = llvm.urem %31, %5  : i64
    %33 = llvm.sub %31, %32 : i64
    %34 = llvm.inttoptr %33 : i64 to !llvm.ptr
    %35 = llvm.insertvalue %28, %4[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.insertvalue %34, %35[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.insertvalue %3, %36[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %38 = llvm.insertvalue %7, %37[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.insertvalue %7, %38[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %40 = llvm.insertvalue %7, %39[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %41 = llvm.insertvalue %6, %40[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb1(%11 : i64)
  ^bb1(%42: i64):  // 2 preds: ^bb0, ^bb5
    %43 = llvm.icmp "slt" %42, %10 : i64
    llvm.cond_br %43, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%11 : i64)
  ^bb3(%44: i64):  // 2 preds: ^bb2, ^bb4
    %45 = llvm.icmp "slt" %44, %10 : i64
    llvm.cond_br %45, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %46 = llvm.add %42, %44 : i64
    %47 = llvm.uitofp %46 : i64 to f32
    %48 = llvm.mul %42, %7 : i64
    %49 = llvm.add %48, %44 : i64
    %50 = llvm.getelementptr %34[%49] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %47, %50 : f32, !llvm.ptr
    %51 = llvm.add %44, %24 : i64
    llvm.br ^bb3(%51 : i64)
  ^bb5:  // pred: ^bb3
    %52 = llvm.add %42, %24 : i64
    llvm.br ^bb1(%52 : i64)
  ^bb6:  // pred: ^bb1
    %53 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %54 = llvm.insertvalue %53, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %55 = llvm.insertvalue %53, %54[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %56 = llvm.insertvalue %3, %55[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %57 = llvm.insertvalue %2, %56[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %58 = llvm.insertvalue %6, %57[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %59 = llvm.getelementptr %53[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %22, %59 : i64, !llvm.ptr
    %60 = llvm.getelementptr %53[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %21, %60 : i64, !llvm.ptr
    %61 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %62 = llvm.insertvalue %61, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %63 = llvm.insertvalue %61, %62[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %64 = llvm.insertvalue %3, %63[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %65 = llvm.insertvalue %2, %64[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %66 = llvm.insertvalue %6, %65[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %67 = llvm.getelementptr %61[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %10, %67 : i64, !llvm.ptr
    %68 = llvm.getelementptr %61[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %10, %68 : i64, !llvm.ptr
    %69 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %70 = llvm.insertvalue %69, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %71 = llvm.insertvalue %69, %70[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %72 = llvm.insertvalue %3, %71[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %73 = llvm.insertvalue %2, %72[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %74 = llvm.insertvalue %6, %73[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %75 = llvm.getelementptr %69[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %11, %75 : i64, !llvm.ptr
    %76 = llvm.getelementptr %69[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %24, %76 : i64, !llvm.ptr
    %77 = llvm.extractvalue %66[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %78 = llvm.extractvalue %66[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %79 = llvm.extractvalue %66[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %80 = llvm.extractvalue %66[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %81 = llvm.extractvalue %66[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %82 = llvm.extractvalue %66[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %83 = llvm.extractvalue %66[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %84 = llvm.extractvalue %66[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %85 = llvm.extractvalue %66[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %86 = llvm.extractvalue %66[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %87 = llvm.extractvalue %58[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %88 = llvm.extractvalue %58[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %89 = llvm.extractvalue %58[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %90 = llvm.extractvalue %58[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %91 = llvm.extractvalue %58[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %92 = llvm.extractvalue %74[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %93 = llvm.extractvalue %74[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %94 = llvm.extractvalue %74[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %95 = llvm.extractvalue %74[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %96 = llvm.extractvalue %74[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %97 = llvm.extractvalue %74[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %98 = llvm.extractvalue %74[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %99 = llvm.extractvalue %74[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %100 = llvm.extractvalue %74[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %101 = llvm.extractvalue %74[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %102 = llvm.call @newSparseTensor(%77, %78, %79, %80, %81, %82, %83, %84, %85, %86, %87, %88, %89, %90, %91, %92, %93, %94, %95, %96, %97, %98, %99, %100, %101, %20, %20, %19, %20, %18) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
    %103 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %104 = llvm.insertvalue %103, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %105 = llvm.insertvalue %103, %104[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %106 = llvm.insertvalue %3, %105[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %107 = llvm.insertvalue %2, %106[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %108 = llvm.insertvalue %6, %107[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %109 = llvm.alloca %6 x f32 : (i64) -> !llvm.ptr
    %110 = llvm.insertvalue %109, %0[0] : !llvm.struct<(ptr, ptr, i64)> 
    %111 = llvm.insertvalue %109, %110[1] : !llvm.struct<(ptr, ptr, i64)> 
    %112 = llvm.insertvalue %3, %111[2] : !llvm.struct<(ptr, ptr, i64)> 
    llvm.br ^bb7(%11 : i64)
  ^bb7(%113: i64):  // 2 preds: ^bb6, ^bb13
    %114 = llvm.icmp "slt" %113, %10 : i64
    llvm.cond_br %114, ^bb8, ^bb14
  ^bb8:  // pred: ^bb7
    llvm.br ^bb9(%11 : i64)
  ^bb9(%115: i64):  // 2 preds: ^bb8, ^bb12
    %116 = llvm.icmp "slt" %115, %10 : i64
    llvm.cond_br %116, ^bb10, ^bb13
  ^bb10:  // pred: ^bb9
    %117 = llvm.mul %113, %7 : i64
    %118 = llvm.add %117, %115 : i64
    %119 = llvm.getelementptr %34[%118] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %120 = llvm.load %119 : !llvm.ptr -> f32
    %121 = llvm.fcmp "une" %120, %8 : f32
    llvm.cond_br %121, ^bb11, ^bb12
  ^bb11:  // pred: ^bb10
    %122 = llvm.getelementptr %103[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %113, %122 : i64, !llvm.ptr
    %123 = llvm.getelementptr %103[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %115, %123 : i64, !llvm.ptr
    llvm.store %120, %109 : f32, !llvm.ptr
    %124 = llvm.extractvalue %108[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %125 = llvm.extractvalue %108[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %126 = llvm.extractvalue %108[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %127 = llvm.extractvalue %108[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %128 = llvm.extractvalue %108[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %129 = llvm.extractvalue %112[0] : !llvm.struct<(ptr, ptr, i64)> 
    %130 = llvm.extractvalue %112[1] : !llvm.struct<(ptr, ptr, i64)> 
    %131 = llvm.extractvalue %112[2] : !llvm.struct<(ptr, ptr, i64)> 
    llvm.call @lexInsertF32(%102, %124, %125, %126, %127, %128, %129, %130, %131) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64) -> ()
    llvm.br ^bb12
  ^bb12:  // 2 preds: ^bb10, ^bb11
    %132 = llvm.add %115, %24 : i64
    llvm.br ^bb9(%132 : i64)
  ^bb13:  // pred: ^bb9
    %133 = llvm.add %113, %24 : i64
    llvm.br ^bb7(%133 : i64)
  ^bb14:  // pred: ^bb7
    llvm.call @endLexInsert(%102) : (!llvm.ptr) -> ()
    %134 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %135 = llvm.insertvalue %134, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %136 = llvm.insertvalue %134, %135[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %137 = llvm.insertvalue %3, %136[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %138 = llvm.insertvalue %2, %137[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %139 = llvm.insertvalue %6, %138[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %140 = llvm.getelementptr %134[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %17, %140 : i64, !llvm.ptr
    %141 = llvm.getelementptr %134[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %16, %141 : i64, !llvm.ptr
    %142 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %143 = llvm.insertvalue %142, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %144 = llvm.insertvalue %142, %143[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %145 = llvm.insertvalue %3, %144[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %146 = llvm.insertvalue %2, %145[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %147 = llvm.insertvalue %6, %146[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %148 = llvm.getelementptr %142[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %10, %148 : i64, !llvm.ptr
    %149 = llvm.getelementptr %142[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %10, %149 : i64, !llvm.ptr
    %150 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %151 = llvm.insertvalue %150, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %152 = llvm.insertvalue %150, %151[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %153 = llvm.insertvalue %3, %152[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %154 = llvm.insertvalue %2, %153[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %155 = llvm.insertvalue %6, %154[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %156 = llvm.getelementptr %150[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %11, %156 : i64, !llvm.ptr
    %157 = llvm.getelementptr %150[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %24, %157 : i64, !llvm.ptr
    %158 = llvm.extractvalue %147[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %159 = llvm.extractvalue %147[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %160 = llvm.extractvalue %147[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %161 = llvm.extractvalue %147[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %162 = llvm.extractvalue %147[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %163 = llvm.extractvalue %147[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %164 = llvm.extractvalue %147[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %165 = llvm.extractvalue %147[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %166 = llvm.extractvalue %147[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %167 = llvm.extractvalue %147[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %168 = llvm.extractvalue %139[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %169 = llvm.extractvalue %139[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %170 = llvm.extractvalue %139[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %171 = llvm.extractvalue %139[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %172 = llvm.extractvalue %139[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %173 = llvm.extractvalue %155[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %174 = llvm.extractvalue %155[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %175 = llvm.extractvalue %155[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %176 = llvm.extractvalue %155[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %177 = llvm.extractvalue %155[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %178 = llvm.extractvalue %155[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %179 = llvm.extractvalue %155[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %180 = llvm.extractvalue %155[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %181 = llvm.extractvalue %155[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %182 = llvm.extractvalue %155[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %183 = llvm.call @newSparseTensor(%158, %159, %160, %161, %162, %163, %164, %165, %166, %167, %168, %169, %170, %171, %172, %173, %174, %175, %176, %177, %178, %179, %180, %181, %182, %19, %19, %19, %20, %18) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
    %184 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %185 = llvm.insertvalue %184, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %186 = llvm.insertvalue %184, %185[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %187 = llvm.insertvalue %3, %186[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %188 = llvm.insertvalue %2, %187[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %189 = llvm.insertvalue %6, %188[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %190 = llvm.alloca %6 x f32 : (i64) -> !llvm.ptr
    %191 = llvm.insertvalue %190, %0[0] : !llvm.struct<(ptr, ptr, i64)> 
    %192 = llvm.insertvalue %190, %191[1] : !llvm.struct<(ptr, ptr, i64)> 
    %193 = llvm.insertvalue %3, %192[2] : !llvm.struct<(ptr, ptr, i64)> 
    llvm.br ^bb15(%11 : i64)
  ^bb15(%194: i64):  // 2 preds: ^bb14, ^bb21
    %195 = llvm.icmp "slt" %194, %10 : i64
    llvm.cond_br %195, ^bb16, ^bb22
  ^bb16:  // pred: ^bb15
    llvm.br ^bb17(%11 : i64)
  ^bb17(%196: i64):  // 2 preds: ^bb16, ^bb20
    %197 = llvm.icmp "slt" %196, %10 : i64
    llvm.cond_br %197, ^bb18, ^bb21
  ^bb18:  // pred: ^bb17
    %198 = llvm.mul %194, %7 : i64
    %199 = llvm.add %198, %196 : i64
    %200 = llvm.getelementptr %34[%199] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %201 = llvm.load %200 : !llvm.ptr -> f32
    %202 = llvm.fcmp "une" %201, %8 : f32
    llvm.cond_br %202, ^bb19, ^bb20
  ^bb19:  // pred: ^bb18
    %203 = llvm.getelementptr %184[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %194, %203 : i64, !llvm.ptr
    %204 = llvm.getelementptr %184[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %196, %204 : i64, !llvm.ptr
    llvm.store %201, %190 : f32, !llvm.ptr
    %205 = llvm.extractvalue %189[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %206 = llvm.extractvalue %189[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %207 = llvm.extractvalue %189[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %208 = llvm.extractvalue %189[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %209 = llvm.extractvalue %189[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %210 = llvm.extractvalue %193[0] : !llvm.struct<(ptr, ptr, i64)> 
    %211 = llvm.extractvalue %193[1] : !llvm.struct<(ptr, ptr, i64)> 
    %212 = llvm.extractvalue %193[2] : !llvm.struct<(ptr, ptr, i64)> 
    llvm.call @lexInsertF32(%183, %205, %206, %207, %208, %209, %210, %211, %212) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64) -> ()
    llvm.br ^bb20
  ^bb20:  // 2 preds: ^bb18, ^bb19
    %213 = llvm.add %196, %24 : i64
    llvm.br ^bb17(%213 : i64)
  ^bb21:  // pred: ^bb17
    %214 = llvm.add %194, %24 : i64
    llvm.br ^bb15(%214 : i64)
  ^bb22:  // pred: ^bb15
    llvm.call @endLexInsert(%183) : (!llvm.ptr) -> ()
    %215 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %216 = llvm.insertvalue %215, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %217 = llvm.insertvalue %215, %216[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %218 = llvm.insertvalue %3, %217[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %219 = llvm.insertvalue %2, %218[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %220 = llvm.insertvalue %6, %219[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %221 = llvm.getelementptr %215[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %15, %221 : i64, !llvm.ptr
    %222 = llvm.getelementptr %215[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %14, %222 : i64, !llvm.ptr
    %223 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %224 = llvm.insertvalue %223, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %225 = llvm.insertvalue %223, %224[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %226 = llvm.insertvalue %3, %225[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %227 = llvm.insertvalue %2, %226[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %228 = llvm.insertvalue %6, %227[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %229 = llvm.getelementptr %223[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %10, %229 : i64, !llvm.ptr
    %230 = llvm.getelementptr %223[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %10, %230 : i64, !llvm.ptr
    %231 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %232 = llvm.insertvalue %231, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %233 = llvm.insertvalue %231, %232[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %234 = llvm.insertvalue %3, %233[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %235 = llvm.insertvalue %2, %234[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %236 = llvm.insertvalue %6, %235[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %237 = llvm.getelementptr %231[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %11, %237 : i64, !llvm.ptr
    %238 = llvm.getelementptr %231[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %24, %238 : i64, !llvm.ptr
    %239 = llvm.extractvalue %228[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %240 = llvm.extractvalue %228[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %241 = llvm.extractvalue %228[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %242 = llvm.extractvalue %228[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %243 = llvm.extractvalue %228[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %244 = llvm.extractvalue %228[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %245 = llvm.extractvalue %228[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %246 = llvm.extractvalue %228[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %247 = llvm.extractvalue %228[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %248 = llvm.extractvalue %228[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %249 = llvm.extractvalue %220[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %250 = llvm.extractvalue %220[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %251 = llvm.extractvalue %220[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %252 = llvm.extractvalue %220[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %253 = llvm.extractvalue %220[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %254 = llvm.extractvalue %236[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %255 = llvm.extractvalue %236[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %256 = llvm.extractvalue %236[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %257 = llvm.extractvalue %236[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %258 = llvm.extractvalue %236[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %259 = llvm.extractvalue %236[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %260 = llvm.extractvalue %236[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %261 = llvm.extractvalue %236[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %262 = llvm.extractvalue %236[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %263 = llvm.extractvalue %236[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %264 = llvm.call @newSparseTensor(%239, %240, %241, %242, %243, %244, %245, %246, %247, %248, %249, %250, %251, %252, %253, %254, %255, %256, %257, %258, %259, %260, %261, %262, %263, %13, %13, %19, %20, %18) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
    %265 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %266 = llvm.insertvalue %265, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %267 = llvm.insertvalue %265, %266[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %268 = llvm.insertvalue %3, %267[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %269 = llvm.insertvalue %2, %268[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %270 = llvm.insertvalue %6, %269[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %271 = llvm.alloca %6 x f32 : (i64) -> !llvm.ptr
    %272 = llvm.insertvalue %271, %0[0] : !llvm.struct<(ptr, ptr, i64)> 
    %273 = llvm.insertvalue %271, %272[1] : !llvm.struct<(ptr, ptr, i64)> 
    %274 = llvm.insertvalue %3, %273[2] : !llvm.struct<(ptr, ptr, i64)> 
    llvm.br ^bb23(%11 : i64)
  ^bb23(%275: i64):  // 2 preds: ^bb22, ^bb29
    %276 = llvm.icmp "slt" %275, %10 : i64
    llvm.cond_br %276, ^bb24, ^bb30
  ^bb24:  // pred: ^bb23
    llvm.br ^bb25(%11 : i64)
  ^bb25(%277: i64):  // 2 preds: ^bb24, ^bb28
    %278 = llvm.icmp "slt" %277, %10 : i64
    llvm.cond_br %278, ^bb26, ^bb29
  ^bb26:  // pred: ^bb25
    %279 = llvm.mul %275, %7 : i64
    %280 = llvm.add %279, %277 : i64
    %281 = llvm.getelementptr %34[%280] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %282 = llvm.load %281 : !llvm.ptr -> f32
    %283 = llvm.fcmp "une" %282, %8 : f32
    llvm.cond_br %283, ^bb27, ^bb28
  ^bb27:  // pred: ^bb26
    %284 = llvm.getelementptr %265[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %277, %284 : i64, !llvm.ptr
    %285 = llvm.getelementptr %265[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %275, %285 : i64, !llvm.ptr
    llvm.store %282, %271 : f32, !llvm.ptr
    %286 = llvm.extractvalue %270[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %287 = llvm.extractvalue %270[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %288 = llvm.extractvalue %270[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %289 = llvm.extractvalue %270[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %290 = llvm.extractvalue %270[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %291 = llvm.extractvalue %274[0] : !llvm.struct<(ptr, ptr, i64)> 
    %292 = llvm.extractvalue %274[1] : !llvm.struct<(ptr, ptr, i64)> 
    %293 = llvm.extractvalue %274[2] : !llvm.struct<(ptr, ptr, i64)> 
    llvm.call @lexInsertF32(%264, %286, %287, %288, %289, %290, %291, %292, %293) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64) -> ()
    llvm.br ^bb28
  ^bb28:  // 2 preds: ^bb26, ^bb27
    %294 = llvm.add %277, %24 : i64
    llvm.br ^bb25(%294 : i64)
  ^bb29:  // pred: ^bb25
    %295 = llvm.add %275, %24 : i64
    llvm.br ^bb23(%295 : i64)
  ^bb30:  // pred: ^bb23
    llvm.call @endLexInsert(%264) : (!llvm.ptr) -> ()
    %296 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %297 = llvm.insertvalue %296, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %298 = llvm.insertvalue %296, %297[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %299 = llvm.insertvalue %3, %298[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %300 = llvm.insertvalue %2, %299[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %301 = llvm.insertvalue %6, %300[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %302 = llvm.getelementptr %296[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %22, %302 : i64, !llvm.ptr
    %303 = llvm.getelementptr %296[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %21, %303 : i64, !llvm.ptr
    %304 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %305 = llvm.insertvalue %304, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %306 = llvm.insertvalue %304, %305[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %307 = llvm.insertvalue %3, %306[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %308 = llvm.insertvalue %2, %307[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %309 = llvm.insertvalue %6, %308[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %310 = llvm.getelementptr %304[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %10, %310 : i64, !llvm.ptr
    %311 = llvm.getelementptr %304[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %10, %311 : i64, !llvm.ptr
    %312 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %313 = llvm.insertvalue %312, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %314 = llvm.insertvalue %312, %313[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %315 = llvm.insertvalue %3, %314[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %316 = llvm.insertvalue %2, %315[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %317 = llvm.insertvalue %6, %316[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %318 = llvm.getelementptr %312[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %24, %318 : i64, !llvm.ptr
    %319 = llvm.getelementptr %312[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %11, %319 : i64, !llvm.ptr
    %320 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %321 = llvm.insertvalue %320, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %322 = llvm.insertvalue %320, %321[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %323 = llvm.insertvalue %3, %322[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %324 = llvm.insertvalue %2, %323[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %325 = llvm.insertvalue %6, %324[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %326 = llvm.getelementptr %320[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %24, %326 : i64, !llvm.ptr
    %327 = llvm.getelementptr %320[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %11, %327 : i64, !llvm.ptr
    %328 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %329 = llvm.insertvalue %328, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %330 = llvm.insertvalue %328, %329[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %331 = llvm.insertvalue %3, %330[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %332 = llvm.insertvalue %2, %331[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %333 = llvm.insertvalue %6, %332[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %334 = llvm.getelementptr %328[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %10, %334 : i64, !llvm.ptr
    %335 = llvm.getelementptr %328[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %10, %335 : i64, !llvm.ptr
    %336 = llvm.extractvalue %309[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %337 = llvm.extractvalue %309[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %338 = llvm.extractvalue %309[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %339 = llvm.extractvalue %309[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %340 = llvm.extractvalue %309[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %341 = llvm.extractvalue %333[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %342 = llvm.extractvalue %333[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %343 = llvm.extractvalue %333[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %344 = llvm.extractvalue %333[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %345 = llvm.extractvalue %333[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %346 = llvm.extractvalue %301[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %347 = llvm.extractvalue %301[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %348 = llvm.extractvalue %301[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %349 = llvm.extractvalue %301[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %350 = llvm.extractvalue %301[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %351 = llvm.extractvalue %317[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %352 = llvm.extractvalue %317[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %353 = llvm.extractvalue %317[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %354 = llvm.extractvalue %317[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %355 = llvm.extractvalue %317[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %356 = llvm.extractvalue %325[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %357 = llvm.extractvalue %325[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %358 = llvm.extractvalue %325[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %359 = llvm.extractvalue %325[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %360 = llvm.extractvalue %325[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %361 = llvm.call @newSparseTensor(%336, %337, %338, %339, %340, %341, %342, %343, %344, %345, %346, %347, %348, %349, %350, %351, %352, %353, %354, %355, %356, %357, %358, %359, %360, %13, %13, %19, %12, %264) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
    %362 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %363 = llvm.insertvalue %362, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %364 = llvm.insertvalue %362, %363[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %365 = llvm.insertvalue %3, %364[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %366 = llvm.insertvalue %2, %365[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %367 = llvm.insertvalue %6, %366[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %368 = llvm.getelementptr %362[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %17, %368 : i64, !llvm.ptr
    %369 = llvm.getelementptr %362[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %16, %369 : i64, !llvm.ptr
    %370 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %371 = llvm.insertvalue %370, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %372 = llvm.insertvalue %370, %371[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %373 = llvm.insertvalue %3, %372[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %374 = llvm.insertvalue %2, %373[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %375 = llvm.insertvalue %6, %374[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %376 = llvm.getelementptr %370[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %10, %376 : i64, !llvm.ptr
    %377 = llvm.getelementptr %370[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %10, %377 : i64, !llvm.ptr
    %378 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %379 = llvm.insertvalue %378, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %380 = llvm.insertvalue %378, %379[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %381 = llvm.insertvalue %3, %380[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %382 = llvm.insertvalue %2, %381[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %383 = llvm.insertvalue %6, %382[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %384 = llvm.getelementptr %378[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %11, %384 : i64, !llvm.ptr
    %385 = llvm.getelementptr %378[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %24, %385 : i64, !llvm.ptr
    %386 = llvm.extractvalue %375[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %387 = llvm.extractvalue %375[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %388 = llvm.extractvalue %375[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %389 = llvm.extractvalue %375[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %390 = llvm.extractvalue %375[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %391 = llvm.extractvalue %375[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %392 = llvm.extractvalue %375[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %393 = llvm.extractvalue %375[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %394 = llvm.extractvalue %375[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %395 = llvm.extractvalue %375[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %396 = llvm.extractvalue %367[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %397 = llvm.extractvalue %367[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %398 = llvm.extractvalue %367[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %399 = llvm.extractvalue %367[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %400 = llvm.extractvalue %367[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %401 = llvm.extractvalue %383[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %402 = llvm.extractvalue %383[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %403 = llvm.extractvalue %383[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %404 = llvm.extractvalue %383[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %405 = llvm.extractvalue %383[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %406 = llvm.extractvalue %383[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %407 = llvm.extractvalue %383[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %408 = llvm.extractvalue %383[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %409 = llvm.extractvalue %383[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %410 = llvm.extractvalue %383[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %411 = llvm.call @newSparseTensor(%386, %387, %388, %389, %390, %391, %392, %393, %394, %395, %396, %397, %398, %399, %400, %401, %402, %403, %404, %405, %406, %407, %408, %409, %410, %13, %13, %19, %20, %18) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i32, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
    %412 = llvm.call @sparseValuesF32(%361) : (!llvm.ptr) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %413 = llvm.call @sparsePositions64(%361, %11) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %414 = llvm.call @sparseCoordinates64(%361, %11) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %415 = llvm.call @sparseCoordinates64(%361, %24) : (!llvm.ptr, i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %416 = llvm.extractvalue %413[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %417 = llvm.getelementptr %416[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %418 = llvm.load %417 : !llvm.ptr -> i64
    %419 = llvm.extractvalue %413[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %420 = llvm.getelementptr %419[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %421 = llvm.load %420 : !llvm.ptr -> i64
    llvm.br ^bb31(%418 : i64)
  ^bb31(%422: i64):  // 2 preds: ^bb30, ^bb36
    %423 = llvm.icmp "ult" %422, %421 : i64
    llvm.cond_br %423, ^bb32, ^bb33
  ^bb32:  // pred: ^bb31
    %424 = llvm.extractvalue %414[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %425 = llvm.getelementptr %424[%418] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %426 = llvm.load %425 : !llvm.ptr -> i64
    %427 = llvm.extractvalue %414[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %428 = llvm.getelementptr %427[%422] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %429 = llvm.load %428 : !llvm.ptr -> i64
    %430 = llvm.icmp "eq" %426, %429 : i64
    llvm.br ^bb34(%430 : i1)
  ^bb33:  // pred: ^bb31
    llvm.br ^bb34(%23 : i1)
  ^bb34(%431: i1):  // 2 preds: ^bb32, ^bb33
    llvm.br ^bb35
  ^bb35:  // pred: ^bb34
    llvm.cond_br %431, ^bb36, ^bb37
  ^bb36:  // pred: ^bb35
    %432 = llvm.add %422, %24 : i64
    llvm.br ^bb31(%432 : i64)
  ^bb37:  // pred: ^bb35
    %433 = llvm.alloca %2 x i64 : (i64) -> !llvm.ptr
    %434 = llvm.insertvalue %433, %1[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %435 = llvm.insertvalue %433, %434[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %436 = llvm.insertvalue %3, %435[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %437 = llvm.insertvalue %2, %436[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %438 = llvm.insertvalue %6, %437[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %439 = llvm.alloca %6 x f32 : (i64) -> !llvm.ptr
    %440 = llvm.insertvalue %439, %0[0] : !llvm.struct<(ptr, ptr, i64)> 
    %441 = llvm.insertvalue %439, %440[1] : !llvm.struct<(ptr, ptr, i64)> 
    %442 = llvm.insertvalue %3, %441[2] : !llvm.struct<(ptr, ptr, i64)> 
    llvm.br ^bb38(%418, %422 : i64, i64)
  ^bb38(%443: i64, %444: i64):  // 2 preds: ^bb37, ^bb49
    %445 = llvm.icmp "ult" %443, %421 : i64
    llvm.cond_br %445, ^bb39, ^bb50
  ^bb39:  // pred: ^bb38
    %446 = llvm.extractvalue %414[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %447 = llvm.getelementptr %446[%443] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %448 = llvm.load %447 : !llvm.ptr -> i64
    llvm.br ^bb40(%443 : i64)
  ^bb40(%449: i64):  // 2 preds: ^bb39, ^bb41
    %450 = llvm.icmp "slt" %449, %444 : i64
    llvm.cond_br %450, ^bb41, ^bb42
  ^bb41:  // pred: ^bb40
    %451 = llvm.extractvalue %415[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %452 = llvm.getelementptr %451[%449] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %453 = llvm.load %452 : !llvm.ptr -> i64
    %454 = llvm.extractvalue %412[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %455 = llvm.getelementptr %454[%449] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %456 = llvm.load %455 : !llvm.ptr -> f32
    %457 = llvm.getelementptr %433[%11] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %448, %457 : i64, !llvm.ptr
    %458 = llvm.getelementptr %433[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %453, %458 : i64, !llvm.ptr
    llvm.store %456, %439 : f32, !llvm.ptr
    %459 = llvm.extractvalue %438[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %460 = llvm.extractvalue %438[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %461 = llvm.extractvalue %438[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %462 = llvm.extractvalue %438[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %463 = llvm.extractvalue %438[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %464 = llvm.extractvalue %442[0] : !llvm.struct<(ptr, ptr, i64)> 
    %465 = llvm.extractvalue %442[1] : !llvm.struct<(ptr, ptr, i64)> 
    %466 = llvm.extractvalue %442[2] : !llvm.struct<(ptr, ptr, i64)> 
    llvm.call @lexInsertF32(%411, %459, %460, %461, %462, %463, %464, %465, %466) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64) -> ()
    %467 = llvm.add %449, %24 : i64
    llvm.br ^bb40(%467 : i64)
  ^bb42:  // pred: ^bb40
    llvm.br ^bb43(%444 : i64)
  ^bb43(%468: i64):  // 2 preds: ^bb42, ^bb48
    %469 = llvm.icmp "ult" %468, %421 : i64
    llvm.cond_br %469, ^bb44, ^bb45
  ^bb44:  // pred: ^bb43
    %470 = llvm.extractvalue %414[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %471 = llvm.getelementptr %470[%444] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %472 = llvm.load %471 : !llvm.ptr -> i64
    %473 = llvm.extractvalue %414[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %474 = llvm.getelementptr %473[%468] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %475 = llvm.load %474 : !llvm.ptr -> i64
    %476 = llvm.icmp "eq" %472, %475 : i64
    llvm.br ^bb46(%476 : i1)
  ^bb45:  // pred: ^bb43
    llvm.br ^bb46(%23 : i1)
  ^bb46(%477: i1):  // 2 preds: ^bb44, ^bb45
    llvm.br ^bb47
  ^bb47:  // pred: ^bb46
    llvm.cond_br %477, ^bb48, ^bb49
  ^bb48:  // pred: ^bb47
    %478 = llvm.add %468, %24 : i64
    llvm.br ^bb43(%478 : i64)
  ^bb49:  // pred: ^bb47
    llvm.br ^bb38(%444, %468 : i64, i64)
  ^bb50:  // pred: ^bb38
    llvm.call @endLexInsert(%411) : (!llvm.ptr) -> ()
    llvm.call @delSparseTensor(%361) : (!llvm.ptr) -> ()
    %479 = llvm.getelementptr %18[64] : (!llvm.ptr) -> !llvm.ptr, f32
    %480 = llvm.ptrtoint %479 : !llvm.ptr to i64
    %481 = llvm.add %480, %5 : i64
    %482 = llvm.call @malloc(%481) : (i64) -> !llvm.ptr
    %483 = llvm.ptrtoint %482 : !llvm.ptr to i64
    %484 = llvm.sub %5, %6 : i64
    %485 = llvm.add %483, %484 : i64
    %486 = llvm.urem %485, %5  : i64
    %487 = llvm.sub %485, %486 : i64
    %488 = llvm.inttoptr %487 : i64 to !llvm.ptr
    %489 = llvm.insertvalue %482, %4[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %490 = llvm.insertvalue %488, %489[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %491 = llvm.insertvalue %3, %490[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %492 = llvm.insertvalue %7, %491[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %493 = llvm.insertvalue %7, %492[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %494 = llvm.insertvalue %7, %493[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %495 = llvm.insertvalue %6, %494[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb51(%11 : i64)
  ^bb51(%496: i64):  // 2 preds: ^bb50, ^bb55
    %497 = llvm.icmp "slt" %496, %10 : i64
    llvm.cond_br %497, ^bb52, ^bb56
  ^bb52:  // pred: ^bb51
    llvm.br ^bb53(%11 : i64)
  ^bb53(%498: i64):  // 2 preds: ^bb52, ^bb54
    %499 = llvm.icmp "slt" %498, %10 : i64
    llvm.cond_br %499, ^bb54, ^bb55
  ^bb54:  // pred: ^bb53
    %500 = llvm.mul %496, %7 : i64
    %501 = llvm.add %500, %498 : i64
    %502 = llvm.getelementptr %488[%501] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %8, %502 : f32, !llvm.ptr
    %503 = llvm.add %498, %24 : i64
    llvm.br ^bb53(%503 : i64)
  ^bb55:  // pred: ^bb53
    %504 = llvm.add %496, %24 : i64
    llvm.br ^bb51(%504 : i64)
  ^bb56:  // pred: ^bb51
    %505 = llvm.getelementptr %18[64] : (!llvm.ptr) -> !llvm.ptr, f32
    %506 = llvm.ptrtoint %505 : !llvm.ptr to i64
    %507 = llvm.add %506, %5 : i64
    %508 = llvm.call @malloc(%507) : (i64) -> !llvm.ptr
    %509 = llvm.ptrtoint %508 : !llvm.ptr to i64
    %510 = llvm.sub %5, %6 : i64
    %511 = llvm.add %509, %510 : i64
    %512 = llvm.urem %511, %5  : i64
    %513 = llvm.sub %511, %512 : i64
    %514 = llvm.inttoptr %513 : i64 to !llvm.ptr
    %515 = llvm.insertvalue %508, %4[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %516 = llvm.insertvalue %514, %515[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %517 = llvm.insertvalue %3, %516[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %518 = llvm.insertvalue %7, %517[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %519 = llvm.insertvalue %7, %518[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %520 = llvm.insertvalue %7, %519[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %521 = llvm.insertvalue %6, %520[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb57(%11 : i64)
  ^bb57(%522: i64):  // 2 preds: ^bb56, ^bb61
    %523 = llvm.icmp "slt" %522, %10 : i64
    llvm.cond_br %523, ^bb58, ^bb62
  ^bb58:  // pred: ^bb57
    llvm.br ^bb59(%11 : i64)
  ^bb59(%524: i64):  // 2 preds: ^bb58, ^bb60
    %525 = llvm.icmp "slt" %524, %10 : i64
    llvm.cond_br %525, ^bb60, ^bb61
  ^bb60:  // pred: ^bb59
    %526 = llvm.mul %522, %7 : i64
    %527 = llvm.add %526, %524 : i64
    %528 = llvm.getelementptr %514[%527] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %9, %528 : f32, !llvm.ptr
    %529 = llvm.add %524, %24 : i64
    llvm.br ^bb59(%529 : i64)
  ^bb61:  // pred: ^bb59
    %530 = llvm.add %522, %24 : i64
    llvm.br ^bb57(%530 : i64)
  ^bb62:  // pred: ^bb57
    %531 = llvm.getelementptr %18[64] : (!llvm.ptr) -> !llvm.ptr, f32
    %532 = llvm.ptrtoint %531 : !llvm.ptr to i64
    %533 = llvm.add %532, %5 : i64
    %534 = llvm.call @malloc(%533) : (i64) -> !llvm.ptr
    %535 = llvm.ptrtoint %534 : !llvm.ptr to i64
    %536 = llvm.sub %5, %6 : i64
    %537 = llvm.add %535, %536 : i64
    %538 = llvm.urem %537, %5  : i64
    %539 = llvm.sub %537, %538 : i64
    %540 = llvm.inttoptr %539 : i64 to !llvm.ptr
    %541 = llvm.insertvalue %534, %4[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %542 = llvm.insertvalue %540, %541[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %543 = llvm.insertvalue %3, %542[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %544 = llvm.insertvalue %7, %543[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %545 = llvm.insertvalue %7, %544[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %546 = llvm.insertvalue %7, %545[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %547 = llvm.insertvalue %6, %546[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %548 = llvm.mul %7, %6 : i64
    %549 = llvm.mul %548, %7 : i64
    %550 = llvm.getelementptr %18[1] : (!llvm.ptr) -> !llvm.ptr, f32
    %551 = llvm.ptrtoint %550 : !llvm.ptr to i64
    %552 = llvm.mul %549, %551 : i64
    "llvm.intr.memcpy"(%540, %488, %552) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %553 = llvm.extractvalue %41[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %554 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %555 = llvm.extractvalue %41[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %556 = llvm.extractvalue %41[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %557 = llvm.extractvalue %41[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %558 = llvm.extractvalue %41[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %559 = llvm.extractvalue %41[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %560 = llvm.extractvalue %547[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %561 = llvm.extractvalue %547[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %562 = llvm.extractvalue %547[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %563 = llvm.extractvalue %547[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %564 = llvm.extractvalue %547[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %565 = llvm.extractvalue %547[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %566 = llvm.extractvalue %547[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %567 = llvm.call @matmulCOO(%102, %553, %554, %555, %556, %557, %558, %559, %560, %561, %562, %563, %564, %565, %566) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %568 = llvm.getelementptr %18[64] : (!llvm.ptr) -> !llvm.ptr, f32
    %569 = llvm.ptrtoint %568 : !llvm.ptr to i64
    %570 = llvm.add %569, %5 : i64
    %571 = llvm.call @malloc(%570) : (i64) -> !llvm.ptr
    %572 = llvm.ptrtoint %571 : !llvm.ptr to i64
    %573 = llvm.sub %5, %6 : i64
    %574 = llvm.add %572, %573 : i64
    %575 = llvm.urem %574, %5  : i64
    %576 = llvm.sub %574, %575 : i64
    %577 = llvm.inttoptr %576 : i64 to !llvm.ptr
    %578 = llvm.insertvalue %571, %4[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %579 = llvm.insertvalue %577, %578[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %580 = llvm.insertvalue %3, %579[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %581 = llvm.insertvalue %7, %580[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %582 = llvm.insertvalue %7, %581[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %583 = llvm.insertvalue %7, %582[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %584 = llvm.insertvalue %6, %583[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %585 = llvm.mul %7, %6 : i64
    %586 = llvm.mul %585, %7 : i64
    %587 = llvm.getelementptr %18[1] : (!llvm.ptr) -> !llvm.ptr, f32
    %588 = llvm.ptrtoint %587 : !llvm.ptr to i64
    %589 = llvm.mul %586, %588 : i64
    "llvm.intr.memcpy"(%577, %488, %589) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %590 = llvm.extractvalue %41[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %591 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %592 = llvm.extractvalue %41[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %593 = llvm.extractvalue %41[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %594 = llvm.extractvalue %41[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %595 = llvm.extractvalue %41[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %596 = llvm.extractvalue %41[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %597 = llvm.extractvalue %584[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %598 = llvm.extractvalue %584[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %599 = llvm.extractvalue %584[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %600 = llvm.extractvalue %584[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %601 = llvm.extractvalue %584[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %602 = llvm.extractvalue %584[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %603 = llvm.extractvalue %584[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %604 = llvm.call @matmulCSR(%183, %590, %591, %592, %593, %594, %595, %596, %597, %598, %599, %600, %601, %602, %603) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %605 = llvm.extractvalue %41[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %606 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %607 = llvm.extractvalue %41[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %608 = llvm.extractvalue %41[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %609 = llvm.extractvalue %41[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %610 = llvm.extractvalue %41[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %611 = llvm.extractvalue %41[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %612 = llvm.extractvalue %495[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %613 = llvm.extractvalue %495[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %614 = llvm.extractvalue %495[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %615 = llvm.extractvalue %495[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %616 = llvm.extractvalue %495[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %617 = llvm.extractvalue %495[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %618 = llvm.extractvalue %495[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %619 = llvm.call @matmulCSC(%411, %605, %606, %607, %608, %609, %610, %611, %612, %613, %614, %615, %616, %617, %618) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %620 = llvm.getelementptr %18[64] : (!llvm.ptr) -> !llvm.ptr, f32
    %621 = llvm.ptrtoint %620 : !llvm.ptr to i64
    %622 = llvm.add %621, %5 : i64
    %623 = llvm.call @malloc(%622) : (i64) -> !llvm.ptr
    %624 = llvm.ptrtoint %623 : !llvm.ptr to i64
    %625 = llvm.sub %5, %6 : i64
    %626 = llvm.add %624, %625 : i64
    %627 = llvm.urem %626, %5  : i64
    %628 = llvm.sub %626, %627 : i64
    %629 = llvm.inttoptr %628 : i64 to !llvm.ptr
    %630 = llvm.insertvalue %623, %4[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %631 = llvm.insertvalue %629, %630[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %632 = llvm.insertvalue %3, %631[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %633 = llvm.insertvalue %7, %632[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %634 = llvm.insertvalue %7, %633[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %635 = llvm.insertvalue %7, %634[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %636 = llvm.insertvalue %6, %635[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %637 = llvm.mul %7, %6 : i64
    %638 = llvm.mul %637, %7 : i64
    %639 = llvm.getelementptr %18[1] : (!llvm.ptr) -> !llvm.ptr, f32
    %640 = llvm.ptrtoint %639 : !llvm.ptr to i64
    %641 = llvm.mul %638, %640 : i64
    "llvm.intr.memcpy"(%629, %514, %641) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %642 = llvm.extractvalue %41[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %643 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %644 = llvm.extractvalue %41[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %645 = llvm.extractvalue %41[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %646 = llvm.extractvalue %41[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %647 = llvm.extractvalue %41[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %648 = llvm.extractvalue %41[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %649 = llvm.extractvalue %636[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %650 = llvm.extractvalue %636[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %651 = llvm.extractvalue %636[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %652 = llvm.extractvalue %636[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %653 = llvm.extractvalue %636[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %654 = llvm.extractvalue %636[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %655 = llvm.extractvalue %636[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %656 = llvm.call @matmulCOO(%102, %642, %643, %644, %645, %646, %647, %648, %649, %650, %651, %652, %653, %654, %655) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %657 = llvm.getelementptr %18[64] : (!llvm.ptr) -> !llvm.ptr, f32
    %658 = llvm.ptrtoint %657 : !llvm.ptr to i64
    %659 = llvm.add %658, %5 : i64
    %660 = llvm.call @malloc(%659) : (i64) -> !llvm.ptr
    %661 = llvm.ptrtoint %660 : !llvm.ptr to i64
    %662 = llvm.sub %5, %6 : i64
    %663 = llvm.add %661, %662 : i64
    %664 = llvm.urem %663, %5  : i64
    %665 = llvm.sub %663, %664 : i64
    %666 = llvm.inttoptr %665 : i64 to !llvm.ptr
    %667 = llvm.insertvalue %660, %4[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %668 = llvm.insertvalue %666, %667[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %669 = llvm.insertvalue %3, %668[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %670 = llvm.insertvalue %7, %669[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %671 = llvm.insertvalue %7, %670[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %672 = llvm.insertvalue %7, %671[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %673 = llvm.insertvalue %6, %672[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %674 = llvm.mul %7, %6 : i64
    %675 = llvm.mul %674, %7 : i64
    %676 = llvm.getelementptr %18[1] : (!llvm.ptr) -> !llvm.ptr, f32
    %677 = llvm.ptrtoint %676 : !llvm.ptr to i64
    %678 = llvm.mul %675, %677 : i64
    "llvm.intr.memcpy"(%666, %514, %678) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i64) -> ()
    %679 = llvm.extractvalue %41[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %680 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %681 = llvm.extractvalue %41[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %682 = llvm.extractvalue %41[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %683 = llvm.extractvalue %41[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %684 = llvm.extractvalue %41[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %685 = llvm.extractvalue %41[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %686 = llvm.extractvalue %673[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %687 = llvm.extractvalue %673[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %688 = llvm.extractvalue %673[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %689 = llvm.extractvalue %673[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %690 = llvm.extractvalue %673[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %691 = llvm.extractvalue %673[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %692 = llvm.extractvalue %673[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %693 = llvm.call @matmulCSR(%183, %679, %680, %681, %682, %683, %684, %685, %686, %687, %688, %689, %690, %691, %692) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %694 = llvm.extractvalue %41[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %695 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %696 = llvm.extractvalue %41[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %697 = llvm.extractvalue %41[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %698 = llvm.extractvalue %41[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %699 = llvm.extractvalue %41[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %700 = llvm.extractvalue %41[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %701 = llvm.extractvalue %521[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %702 = llvm.extractvalue %521[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %703 = llvm.extractvalue %521[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %704 = llvm.extractvalue %521[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %705 = llvm.extractvalue %521[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %706 = llvm.extractvalue %521[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %707 = llvm.extractvalue %521[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %708 = llvm.call @matmulCSC(%411, %694, %695, %696, %697, %698, %699, %700, %701, %702, %703, %704, %705, %706, %707) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %709 = llvm.extractvalue %567[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %710 = llvm.extractvalue %567[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %711 = llvm.extractvalue %567[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %712 = llvm.extractvalue %567[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %713 = llvm.extractvalue %567[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %714 = llvm.extractvalue %567[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %715 = llvm.extractvalue %567[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @dump(%709, %710, %711, %712, %713, %714, %715) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    %716 = llvm.extractvalue %604[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %717 = llvm.extractvalue %604[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %718 = llvm.extractvalue %604[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %719 = llvm.extractvalue %604[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %720 = llvm.extractvalue %604[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %721 = llvm.extractvalue %604[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %722 = llvm.extractvalue %604[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @dump(%716, %717, %718, %719, %720, %721, %722) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    %723 = llvm.extractvalue %619[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %724 = llvm.extractvalue %619[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %725 = llvm.extractvalue %619[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %726 = llvm.extractvalue %619[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %727 = llvm.extractvalue %619[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %728 = llvm.extractvalue %619[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %729 = llvm.extractvalue %619[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @dump(%723, %724, %725, %726, %727, %728, %729) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    %730 = llvm.extractvalue %656[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %731 = llvm.extractvalue %656[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %732 = llvm.extractvalue %656[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %733 = llvm.extractvalue %656[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %734 = llvm.extractvalue %656[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %735 = llvm.extractvalue %656[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %736 = llvm.extractvalue %656[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @dump(%730, %731, %732, %733, %734, %735, %736) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    %737 = llvm.extractvalue %693[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %738 = llvm.extractvalue %693[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %739 = llvm.extractvalue %693[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %740 = llvm.extractvalue %693[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %741 = llvm.extractvalue %693[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %742 = llvm.extractvalue %693[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %743 = llvm.extractvalue %693[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @dump(%737, %738, %739, %740, %741, %742, %743) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    %744 = llvm.extractvalue %708[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %745 = llvm.extractvalue %708[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %746 = llvm.extractvalue %708[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %747 = llvm.extractvalue %708[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %748 = llvm.extractvalue %708[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %749 = llvm.extractvalue %708[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %750 = llvm.extractvalue %708[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @dump(%744, %745, %746, %747, %748, %749, %750) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    llvm.call @delSparseTensor(%102) : (!llvm.ptr) -> ()
    llvm.call @delSparseTensor(%183) : (!llvm.ptr) -> ()
    llvm.call @delSparseTensor(%411) : (!llvm.ptr) -> ()
    llvm.call @mgpuDestroySparseEnv() : () -> ()
    llvm.return
  }
  llvm.func @mgpuStreamCreate() -> !llvm.ptr
  llvm.func @mgpuMemAlloc(i64, !llvm.ptr, i8) -> !llvm.ptr
  llvm.func @mgpuMemcpy(!llvm.ptr, !llvm.ptr, i64, !llvm.ptr)
  llvm.func @mgpuStreamSynchronize(!llvm.ptr)
  llvm.func @mgpuStreamDestroy(!llvm.ptr)
  llvm.func @mgpuCreateCoo(i64, i64, i64, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, !llvm.ptr) -> !llvm.ptr
  llvm.func @mgpuCreateDnMat(i64, i64, !llvm.ptr, i32, !llvm.ptr) -> !llvm.ptr
  llvm.func @mgpuSpMMBufferSize(i32, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr) -> i64
  llvm.func @mgpuSpMM(i32, i32, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr, !llvm.ptr)
  llvm.func @mgpuDestroySpMat(!llvm.ptr, !llvm.ptr)
  llvm.func @mgpuDestroyDnMat(!llvm.ptr, !llvm.ptr)
  llvm.func @mgpuMemFree(!llvm.ptr, !llvm.ptr)
  llvm.func @mgpuCreateCsr(i64, i64, i64, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
  llvm.func @mgpuCreateCsc(i64, i64, i64, !llvm.ptr, !llvm.ptr, !llvm.ptr, i32, i32, i32, !llvm.ptr) -> !llvm.ptr
}

