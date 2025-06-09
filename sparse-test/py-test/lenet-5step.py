import torch
import torch.nn as nn
import numpy as np
from spikingjelly.activation_based import neuron
import torch.cuda.nvtx as nvtx
from torchvision import datasets, transforms

assert torch.cuda.is_available(), "必须使用CUDA支持的GPU运行！"
device = torch.device("cuda")
print(device)

class ConvFCLIFNet(nn.Module):
    def __init__(self):
        super(ConvFCLIFNet, self).__init__()
        self.conv = nn.Conv2d(in_channels=1, out_channels=1, kernel_size=2, stride=1, bias=False)
        self.fc = nn.Linear(27 * 27, 27 * 27)
        self.lif = neuron.LIFNode(v_threshold=1.0, step_mode='s')

        with torch.no_grad():
            self.conv.weight.data = torch.tensor([[[[1.0, 2.0],
                                                    [3.0, 4.0]]]], device=device)

    def forward(self, x_seq):  # 输入 x_seq: [T, B, 1, 28, 28]
        nvtx.mark("mark1")
        T, B, C, H, W = x_seq.shape
        out_seq = []

        for t in range(T):
            # nvtx.mark(f"mark1_t{t}")
            x = self.conv(x_seq[t])          # [B, 1, 27, 27]
            x = x.view(B, -1)                # [B, 729]
            # nvtx.mark(f"mark2_t{t}")
            x = self.fc(x)                   # [B, 729]
            # nvtx.mark(f"mark3_t{t}")
            x = self.lif(x)                  # [B, 729]
            # nvtx.mark(f"mark4_t{t}")
            out_seq.append(x)

        nvtx.mark("mark2")
        return torch.stack(out_seq, dim=0)   # [T, B, 729]

def load_mnist_single_image(device):
    transform = transforms.Compose([
        transforms.ToTensor()
    ])
    mnist_train = datasets.MNIST(root='./data', train=True, download=True, transform=transform)
    img, label = mnist_train[0]  # [1, 28, 28]
    img = img.unsqueeze(0).to(device)  # [1, 1, 28, 28]
    return img  # [1, 1, 28, 28]

if __name__ == "__main__":
    model = ConvFCLIFNet().to(device)
    model.eval()

    with torch.no_grad():
        fixed_weights = torch.tensor(
            [[float(i + 1) for i in range(27 * 27)] for _ in range(27 * 27)],
            dtype=torch.float32,
            device=device
        )
        model.fc.weight = torch.nn.Parameter(fixed_weights)
        model.fc.bias = torch.nn.Parameter(torch.zeros(27 * 27, device=device))

    # 加载数据并扩展为 5 个时间步
    single_img = load_mnist_single_image(device)  # [1, 1, 28, 28]
    T = 5
    data_seq = single_img.repeat(T, 1, 1, 1, 1)   # [T=5, B=1, C=1, H=28, W=28]

    # 推理
    output_seq = model(data_seq)  # [T, 1, 729]
    # print("输入图像序列大小:", data_seq.shape)         # torch.Size([5, 1, 1, 28, 28])
    # print("模型输出序列大小:", output_seq.shape)       # torch.Size([5, 1, 729])
