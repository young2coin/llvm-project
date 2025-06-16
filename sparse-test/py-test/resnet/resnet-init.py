import torch
import torch.nn as nn
from torchvision import datasets, transforms
from spikingjelly.activation_based import neuron
import torch.cuda.nvtx as nvtx

# ----------------------------
# 1. 定义残差块和模型结构
# ----------------------------
class SimpleResidualBlock(nn.Module):
    def __init__(self, channels):
        super().__init__()
        self.conv1 = nn.Conv2d(channels, channels, kernel_size=3, stride=1, padding=1)
        self.conv2 = nn.Conv2d(channels, channels, kernel_size=3, stride=1, padding=1)

    def forward(self, x):
        identity = x
        out = self.conv1(x)
        out = self.conv2(out)
        out += identity  # residual connection
        return out

class MinimalResNet(nn.Module):
    def __init__(self):
        super().__init__()
        self.conv = nn.Conv2d(1, 1, kernel_size=2, stride=1, padding=0)  # [1, 1, 28, 28] → [1, 1, 27, 27]
        self.resblock = SimpleResidualBlock(1)
        self.fc = nn.Linear(1 * 27 * 27, 10)
        self.lif = neuron.LIFNode(v_threshold=1.0, step_mode='s')

    def forward(self, x):
        x = self.conv(x)              # [1, 1, 27, 27]
        x = self.resblock(x)         # [1, 1, 27, 27]
        x = x.view(x.size(0), -1)    # [1, 729]
        x = self.fc(x)               # [1, 10]
        # print(x)
        x = self.lif(x)              # [1, 10]
        return x

# ----------------------------
# 2. 加载 MNIST 的一张图片
# ----------------------------
transform = transforms.Compose([
    transforms.ToTensor(),
    transforms.Normalize((0.1307,), (0.3081,))
])

dataset = datasets.MNIST(
    root='/data/dagongcheng/yktest/llvm-newest/llvm-project/sparse-test/py-test/data',
    train=False,
    download=True,
    transform=transform
)

img, label = dataset[0]
input_tensor = img.unsqueeze(0)  # [1, 1, 28, 28]
print("Sample label:", label)

# ----------------------------
# 3. 构建模型并测试推理
# ----------------------------
model = MinimalResNet()
model.eval()

with torch.no_grad():
    nvtx.mark("mark1")
    output = model(input_tensor)
    nvtx.mark("mark2")
    print("Model output:", output)
    print("Predicted class:", torch.argmax(output))

# ----------------------------
# 4. 导出为 ONNX
# ----------------------------
# torch.onnx.export(
#     model,
#     input_tensor,
#     "minimal_resnet.onnx",
#     input_names=['input'],
#     output_names=['output'],
#     opset_version=11
# )

# print("Exported model to minimal_resnet.onnx")
