#!/bin/bash

# 确保脚本以 root 用户权限运行
if [ "$(id -u)" -ne "0" ]; then
  echo "该脚本需要以 root 用户权限运行" 1>&2
  exit 1
fi

# 更新系统并安装必要的工具
echo "更新系统..."
apt-get update -y && apt-get upgrade -y

echo "安装常用开发工具..."
apt-get install -y \
    build-essential \
    gcc \
    g++ \
    gdb \
    cmake \
    git \
    vim \
    wget \
    curl \
    unzip \
    zsh \
    boost-all-dev



# 安装 Oh My Zsh
echo "安装 Oh My Zsh..."
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" --unattended
chsh -s /bin/zsh

# 配置 Zsh 插件：zsh-autosuggestions 和 zsh-syntax-highlighting
echo "安装 Zsh 插件..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# 启用插件
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

# 安装 C++ 编译器工具
echo "安装 C++ 编译器工具..."
apt-get install -y clang-tidy clang-format

# 清理安装缓存
echo "清理缓存..."
apt-get clean

echo "设置完成!"
