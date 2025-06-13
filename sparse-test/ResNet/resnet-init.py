import torch
import torch.nn as nn
import torch.nn.functional as F
from torchvision import datasets, transforms

class SimpleResidualBlock(nn.Module):
    def __init__(self, channels):
        super().__init__()
        self.conv1 = nn.Conv2d(channels, channels, kernel_size=3, stride=1, padding=1)
        self.conv2 = nn.Conv2d(channels, channels, kernel_size=3, stride=1, padding=1)

    def forward(self, x):
        identity = x
        out = F.relu(self.conv1(x))
        out = self.conv2(out)
        out += identity  # residual connection
        return F.relu(out)

class MinimalResNet(nn.Module):
    def __init__(self):
        super().__init__()
        self.conv = nn.Conv2d(1, 1, kernel_size=2, stride=1, padding=0)  # → [1, 1, 27, 27]
        self.resblock = SimpleResidualBlock(1)
        self.fc = nn.Linear(1 * 27 * 27, 10)

    def forward(self, x):
        x = self.conv(x)              # [1, 1, 27, 27]
        x = self.resblock(x)         # [1, 1, 27, 27]
        x = x.view(x.size(0), -1)    # Flatten: [1, 729]
        x = self.fc(x)               # [1, 10]
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
model = MinimalResNet()
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
