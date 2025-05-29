import torch
import torch.nn as nn
import numpy as np
from spikingjelly.activation_based import neuron
import torch.cuda.nvtx as nvtx
from torchvision import datasets, transforms

# 检查 GPU 可用性
assert torch.cuda.is_available(), "必须使用CUDA支持的GPU运行！"
device = torch.device("cuda")
print(device)

# 定义模型 - Conv + FC + LIF
class ConvFCLIFNet(nn.Module):
    def __init__(self):
        super(ConvFCLIFNet, self).__init__()
        self.conv = nn.Conv2d(in_channels=1, out_channels=1, kernel_size=2, stride=1, bias=False)
        self.fc = nn.Linear(27 * 27, 27 * 27)  # 将 conv 输出展平后传入 FC
        self.lif = neuron.LIFNode(v_threshold=1.0, step_mode='s')

        # 设置固定的卷积核权重
        with torch.no_grad():
            self.conv.weight.data = torch.tensor([[[[1.0, 2.0],
                                                    [3.0, 4.0]]]], device=device)

    def forward(self, x):  # 输入 x: [1, 1, 28, 28]
        nvtx.mark("mark1")
        x = self.conv(x)  # 输出: [1, 1, 27, 27]
        x = x.view(x.size(0), -1)  # 展平为 [1, 729]
        nvtx.mark("mark2")
        # print(f"Flattened conv output shape: {x.shape}")
        x = self.fc(x)  # 仍为 [1, 729]
        nvtx.mark("mark3")
        x = self.lif(x)
        nvtx.mark("mark4")
        return x

def load_mnist_single_image(device):
    transform = transforms.Compose([
        transforms.ToTensor()
    ])
    mnist_train = datasets.MNIST(root='./data', train=True, download=True, transform=transform)
    img, label = mnist_train[0]  # img: Tensor shape (1,28,28)
    # print(f"MNIST Image Label: {label}")
    img = img.unsqueeze(0).to(device)  # shape: [1, 1, 28, 28]
    return img  # (1, 1, 28, 28)

if __name__ == "__main__":
    model = ConvFCLIFNet().to(device)
    model.eval()

    with torch.no_grad():
        # 设置 FC 层固定权重
        fixed_weights = torch.tensor(
            [[float(i + 1) for i in range(27 * 27)] for _ in range(27 * 27)],
            dtype=torch.float32,
            device=device
        )
        model.fc.weight = torch.nn.Parameter(fixed_weights)
        model.fc.bias = torch.nn.Parameter(torch.zeros(27 * 27, device=device))

    # ========== 加载 MNIST 图像 ========== 
    data = load_mnist_single_image(device)  # (1, 1, 28, 28)

    # ========== 推理过程 ========== 
    output = model(data)
    print("输入图像大小:", data.shape)         # torch.Size([1, 1, 28, 28])
    print("模型输出数据大小:", output.shape)  # torch.Size([1, 729])
