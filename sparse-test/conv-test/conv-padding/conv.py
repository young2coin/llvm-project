import torch
import torch.nn as nn
import torch.onnx
import numpy as np

# 定义简单神经网络模型
class SimpleNN(nn.Module):
    def __init__(self):
        super(SimpleNN, self).__init__()
        # 设置 stride=2, padding=1 以保持输出尺寸为3x3（输入为4x4）
        self.conv = nn.Conv2d(1, 1, kernel_size=2, stride=2, padding=1)
        
        # 设置固定卷积权重
        self.conv.weight.data = torch.Tensor([[[[1.0, 2.0],
                                                [3.0, 4.0]]]])
        self.conv.bias.data = torch.Tensor([0.0])

    def forward(self, x):
        return self.conv(x)

# 创建模型实例
model = SimpleNN()

# 随机生成输入数据
data = torch.randn(1, 1, 4, 4)

# 运行模型
output = model(data)

# 保存数据
def save_data_to_file(data, filename):
    data = data.detach().numpy()
    np.savetxt(filename, data.flatten(), fmt='%f')

save_data_to_file(data, "input_data.txt")
save_data_to_file(output, "torch_output_data.txt")

# 打印结果
print("随机输入数据:")
print(data.numpy())
print("Python输出数据:")
print(output.detach().numpy())

# 导出 ONNX 模型
torch.onnx.export(model, data, "model.onnx", verbose=False, input_names=['input'], output_names=['output'])
