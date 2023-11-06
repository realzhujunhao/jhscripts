#!/usr/bin/zsh

cd ~/
git clone https://github.com/LuaJIT/LuaJIT.git
cd ~/LuaJIT
sudo make
sudo make install

NODE_VERSION=v21.1.0
NODE_ROOT=/opt/nodejs
NODE_PATH=${NODE_ROOT}/${NODE_VERSION}
PLATFORM=linux-x64

sudo mkdir ${NODE_ROOT}
cd ${NODE_ROOT}


sudo wget https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-${PLATFORM}.tar.xz
sudo tar -xvf node-${NODE_VERSION}-${PLATFORM}.tar.xz
sudo rm node-${NODE_VERSION}-${PLATFORM}.tar.xz
sudo mv node-${NODE_VERSION}-${PLATFORM}/ ${NODE_VERSION}/

cd ~/

echo "export NODE_HOME=${NODE_PATH}" >> ~/.zshrc
echo "export PATH=\$NODE_HOME/bin:\$PATH" >> ~/.zshrc
source ~/.zshrc


