import torch
import torch.nn as nn
import numpy as np
from spikingjelly.activation_based import neuron
import torch.cuda.nvtx as nvtx
from torchvision import datasets, transforms

assert torch.cuda.is_available(), "必须使用CUDA支持的GPU运行！"
device = torch.device("cuda")

def load_mnist_batch(device, batch_size=128):
    transform = transforms.Compose([
        transforms.ToTensor()
    ])
    mnist_train = datasets.MNIST(root='./data', train=True, download=True, transform=transform)
    
    # 获取前 batch_size 个样本
    images = []
    for i in range(batch_size):
        img, _ = mnist_train[i]  # 形状: [1, 28, 28]
        images.append(img)
    
    batch = torch.stack(images, dim=0).to(device)  # 形状: [128, 1, 28, 28]
    return batch

class LIF4DNet(nn.Module):
    def __init__(self):
        super(LIF4DNet, self).__init__()
        self.lif = neuron.LIFNode(v_threshold=1.0, step_mode='s')

    def forward(self, x):  # 输入 x: [B, 1, 28, 28]
        nvtx.mark("mark1")
        x = self.lif(x)  
        nvtx.mark("mark2")
        return x

model = LIF4DNet().to(device)
data = load_mnist_batch(device, batch_size=128)  # (128, 1, 28, 28)

# 前向传播一个时间步
output_spike = model(data)  # 输出: [128, 1, 28, 28]

print("输入图像大小:", data.shape)
print("模型输出数据大小:", output_spike.shape)
