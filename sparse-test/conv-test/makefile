# Define the commands using the macros
MLIR_OPT = /data/dagongcheng/yktest/llvm-newest/llvm-project/build/bin/mlir-opt



linalg2buffer:
	@ echo "下面展示的是算子从Linalg下降到bufferization ..."
	$(MLIR_OPT) -one-shot-bufferize="unknown-type-conversion=identity-layout-map function-boundary-type-conversion=identity-layout-map bufferize-function-boundaries" --buffer-results-to-out-params="hoist-static-allocs=1"  conv-linalg.mlir > buffer-conv.mlir

buffer2affine:
	@ echo "下面展示的是算子从bufferization下降到affine ..."
	$(MLIR_OPT) --split-input-file  --convert-linalg-to-affine-loops --cse buffer-conv.mlir > affine.mlir

affine-optimize:
	@ echo "下面展示的是算子在affine进行了一些循环优化 ..."
	$(MLIR_OPT) --affine-loop-fusion affine.mlir  > affine-fusion__tmp.mlir
	$(MLIR_OPT) --affine-loop-tile="tile-size=32"  affine-fusion__tmp.mlir > affine-tile__tmp.mlir

all: py2snn snn2linalg linalg2buffer buffer2affine affine-optimize affine2emitc emitc2c

assembly:
	@ echo "下面展示的是算子的汇编代码 ..."
	$(QEMU_PATH)/toolchain/llvm/bin/clang --target=riscv64-unknown-linux-gnu -march=rv64imafcvzne -g -O0 -S -static --sysroot=$(QEMU_PATH)/toolchain/xuantie-gnu-toolchain/sysroot --gcc-toolchain=$(QEMU_PATH)/toolchain/xuantie-gnu-toolchain $(PWD)/back.c -o $(PWD)/back_qemu.S

clean:
	rm -f *__tmp.mlir
	rm -f *__tmp.c
	rm -f *.out
	rm -f back_qemu.S
	rm -f *.txt
		
