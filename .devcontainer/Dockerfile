# 使用基于 GCC 的镜像作为基础镜像
FROM gcc:latest

# 更新系统并安装常用开发工具
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
        build-essential \
        g++ \
        gdb \
        cmake \
        git \
        vim \
        wget \
        curl \
        unzip \
        zsh && \
    apt-get clean

# 安装 Oh My Zsh
RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" --unattended && \
    chsh -s /bin/zsh && \
    echo "export TERM=xterm-256color" >> ~/.zshrc

# 安装 Zsh 插件：zsh-autosuggestions 和 zsh-syntax-highlighting
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

# 设置默认工作目录
WORKDIR /workspace

# 设置环境变量，使用 C++20 编译
ENV CXXFLAGS="-std=c++20 -D_GLIBCXX_DEBUG"

# 安装 C++ 工具：Clang Tidy、Clang Format（可选）
RUN apt-get install -y clang-tidy clang-format

# 设置默认终端为 Zsh
CMD ["/bin/zsh"]
