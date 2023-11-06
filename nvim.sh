#!/usr/bin/zsh

NVIM_ROOT=/opt/nvim
VERSION=0.10.0
NVIM_PATH=${NVIM_ROOT}/${VERSION}

sudo mkdir ${NVIM_ROOT}
cd ${NVIM_ROOT}

sudo wget https://github.com/neovim/neovim-releases/releases/download/nightly/nvim-linux64.tar.gz -O nvim.tar.gz
sudo tar -zxvf nvim.tar.gz
DIRNAME=$(ls -d */)
sudo mv ${DIRNAME} ${VERSION}

cd ~
echo "# Nvim" >> ~/.zshrc
echo "export NVIM_HOME=${NVIM_PATH}" >> ~/.zshrc
echo "export PATH=\NVIM_HOME/bin:\$PATH" >> ~/.zshrc
source ~/.zshrc
