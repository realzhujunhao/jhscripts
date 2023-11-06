#!/usr/bin/zsh

VERSION=17
PLATFORM=linux-x64
FILENAME=jdk-${VERSION}_${PLATFORM}_bin.tar.gz
ORACLE=https://download.oracle.com

JAVA_ROOT=/opt/jdk
JAVA_PATH=/opt/jdk/${VERSION}

sudo mkdir ${JAVA_ROOT}
cd ${JAVA_ROOT}
sudo wget ${ORACLE}/java/${VERSION}/latest/${FILENAME}
sudo tar -zxvf ${FILENAME}
DIRNAME=$(ls -d */)
sudo mv ${DIRNAME} ${VERSION}
sudo rm ${FILENAME}

cd ~
echo "export JAVA_HOME=${JAVA_PATH}" >> ~/.zshrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.zshrc

source ~/.zshrc
