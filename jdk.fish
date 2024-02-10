#!/usr/bin/env fish

set -l pwd (pwd)
set -l jdk_version 17
set -l platform linux
set -l architect $argv[1]
set -l filename jdk-"$jdk_version"_"$platform"-"$architect"_bin.tar.gz
set -l oracle https://download.oracle.com

echo "downloading jdk"
set -l url $oracle/java/$jdk_version/latest/$filename

set -l java_root /opt/jdk

echo "making directory"
sudo mkdir $java_root
cd $java_root

sudo wget $url
sudo tar -zxvf $filename
sudo rm $java_root/$filename

echo "writing environment variables"
set -l fish_config ~/.config/fish/config.fish
set -l java_path $java_root/*
echo "set -gx JAVA_HOME $java_path" >> $fish_config
echo "set -gx PATH \$JAVA_HOME/bin \$PATH" >> $fish_config

echo "please run the following command"
echo "source $fish_config"
cd $pwd
