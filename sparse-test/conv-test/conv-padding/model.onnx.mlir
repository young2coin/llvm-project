module attributes {llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "onnx-mlir.symbol-postfix" = "model"} {
  func.func @main_graph(%arg0: tensor<1x1x4x4xf32> {onnx.name = "input"}) -> (tensor<1x1x3x3xf32> {onnx.name = "output"}) {
    %0 = onnx.Constant dense<[[[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]]]> : tensor<1x1x2x2xf32>
    %1 = onnx.Constant dense<0.000000e+00> : tensor<1xf32>
    %2 = "onnx.Conv"(%arg0, %0, %1) {auto_pad = "NOTSET", dilations = [1, 1], group = 1 : si64, kernel_shape = [2, 2], onnx_node_name = "/conv/Conv", pads = [1, 1, 1, 1], strides = [2, 2]} : (tensor<1x1x4x4xf32>, tensor<1x1x2x2xf32>, tensor<1xf32>) -> tensor<1x1x3x3xf32>
    return %2 : tensor<1x1x3x3xf32>
  }
  "onnx.EntryPoint"() {func = @main_graph} : () -> ()
}
