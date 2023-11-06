#!/usr/bin/zsh

GRADLE_ROOT=/opt/gradle
VERSION=8.4
GRADLE_PATH=${GRADLE_ROOT}/${VERSION}
ZIPNAME=gradle-${VERSION}-bin.zip

sudo mkdir ${GRADLE_ROOT}
cd ${GRADLE_ROOT}
sudo wget "https://gradle.org/next-steps/?version=${VERSION}&format=bin" -O ${ZIPNAME}
sudo unzip ${ZIPNAME}
DIRNAME=$(ls -d */)
sudo mv ${DIRNAME} ${VERSION}
sudo rm ${ZIPNAME}

cd ~
echo "# Gradle" >> ~/.zshrc
echo "GRADLE_HOME=${GRADLE_PATH}" >> ~/.zshrc
echo "PATH=\$GRADLE_HOME/bin:\$PATH" >> ~/.zshrc
source ~/.zshrc
