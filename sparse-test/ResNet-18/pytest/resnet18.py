import torch
import torch.nn as nn
import torchvision.models as models

# 修改后的 ResNet-18（适配 MNIST 输入）
def resnet18_mnist(num_classes=10):
    model = models.resnet18(pretrained=False)
    
    # 修改第一层：接收1通道，而非3通道
    model.conv1 = nn.Conv2d(1, 64, kernel_size=3, stride=1, padding=1, bias=False)
    
    # 去除最大池化层以保留更多空间信息
    model.maxpool = nn.Identity()

    # 修改最终的全连接层
    model.fc = nn.Linear(512, num_classes)

    return model

# 创建模型并切换到 eval 模式
model = resnet18_mnist()
model.eval()

# 输入：1张图，1通道，28x28
dummy_input = torch.randn(1, 1, 28, 28)


# 导出为ONNX格式

torch.onnx.export(
    model,
    dummy_input,
    "resnet18.onnx",
    verbose=False,
    input_names=['input'],
    output_names=['output']
)

print("成功导出为 resnet18.onnx")
