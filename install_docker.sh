#!/bin/sh
set -e

sudo apt install build-essential
# sudo apt install freeglut-devel
sudo apt install freeglut3-dev

curl -sSL https://get.daocloud.io/docker | sh
echo 'DOCKER_OPTS="--registry-mirror=https://f6payy65.mirror.aliyuncs.com"' >> /etc/default/docker
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://f6payy65.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo apt install wget
wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ./Miniconda3-latest-Linux-x86_64.sh

pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip install pip -U

# conda config --set show_channel_urls yes
# channels:
#   - defaults
# show_channel_urls: true
# default_channels:
#   - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
#   - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
#   - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
# custom_channels:
#   conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
#   msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
#   bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
#   menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
#   pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
#   simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud

# docker run -it -v /root/Cao/softwares/VOCA:/Cao/VOCA cao/ubuntu:18.04

# sudo docker run -it -v ~/Cao/Code/VOCA:/Cao/VOCA -p 5555:5555 voca/ubuntu:18.04
# sudo docker run -it -v ~/Cao/Code/VOCA:/Cao/VOCA -p 5555:5555 voca/ubuntu:18.04 python ~/Cao/VOCA/voca/web_service/app.py


# sudo docker start a0810e43d55c
# sudo docker exec -it a0810e43d55c /bin/bash
# nohup python app.py >> web_service/output.log 2>&1 &
