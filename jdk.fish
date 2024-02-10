#!/usr/bin/env fish

set -l pwd (pwd)
set -l version 17
set -l platform linux
set -l architect $argv[1]
set -l filename jdk-${version}_${platform}-${architect}_bin.tar.gz
set -l oracle https://download.oracle.com

echo "downloading jdk"
set -l url $oracle/java/$version/latest/$filename

set -l java_root /opt/jdk
set -l java_path /opt/jdk/$version

echo "making directory"
sudo mkdir $java_root
cd $java_root

sudo wget $url
sudo tar -zxvf $filename

echo "writing environment variables"
set -l fish_config ~/.config/fish/config.fish
echo "set -gx JAVA_HOME $java_path" >> $fish_config
echo "set -gx PATH \$JAVA_HOME/bin:\$PATH" >> $fish_config

echo "please run the following command"
echo "source $fish_config"
cd $pwd
