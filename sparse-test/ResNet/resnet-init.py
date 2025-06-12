import torch
import torch.nn as nn
import torch.nn.functional as F
from torchvision import datasets, transforms

# ----------------------------
# 1. 基础残差块
# ----------------------------
class BasicBlock(nn.Module):
    def __init__(self, in_channels, out_channels, stride=1):
        super().__init__()
        self.conv1 = nn.Conv2d(in_channels, out_channels, 3, stride=stride, padding=1, bias=False)
        self.bn1   = nn.BatchNorm2d(out_channels)
        self.conv2 = nn.Conv2d(out_channels, out_channels, 3, stride=1, padding=1, bias=False)
        self.bn2   = nn.BatchNorm2d(out_channels)

        if in_channels != out_channels or stride != 1:
            self.shortcut = nn.Sequential(
                nn.Conv2d(in_channels, out_channels, kernel_size=1, stride=stride, bias=False),
                nn.BatchNorm2d(out_channels),
            )
        else:
            self.shortcut = nn.Identity()

    def forward(self, x):
        out = F.relu(self.bn1(self.conv1(x)))
        out = self.bn2(self.conv2(out))
        out += self.shortcut(x)
        return F.relu(out)

# ----------------------------
# 2. 简化 ResNet（仅一个残差块）
# ----------------------------
class OneBlockResNet(nn.Module):
    def __init__(self):
        super().__init__()
        self.block = BasicBlock(1, 16, stride=1)  # 1 channel → 16 channels
        self.avgpool = nn.AdaptiveAvgPool2d((1,1))
        self.fc = nn.Linear(16, 10)  # 输出 10 类

    def forward(self, x):
        x = self.block(x)           # [1, 1, 28, 28] → [1, 16, 28, 28]
        x = self.avgpool(x)         # → [1, 16, 1, 1]
        x = torch.flatten(x, 1)     # → [1, 16]
        x = self.fc(x)              # → [1, 10]
        return x

# ----------------------------
# 3. 准备 MNIST 示例输入
# ----------------------------
transform = transforms.Compose([
    transforms.ToTensor(),
    transforms.Normalize((0.1307,), (0.3081,))
])

dataset = datasets.MNIST('/data/dagongcheng/yktest/llvm-newest/llvm-project/sparse-test/py-test/data', train=False, download=True, transform=transform)
img, label = dataset[0]
input_tensor = img.unsqueeze(0)  # [1, 1, 28, 28]
print("Sample label:", label)

# ----------------------------
# 4. 导出为 ONNX
# ----------------------------
model = OneBlockResNet()
model.eval()

onnx_path = "model.onnx"
torch.onnx.export(
    model,
    input_tensor,
    onnx_path,
    verbose=False,
    input_names=['input'],
    output_names=['output']
)

print(f"Exported to {onnx_path}")
