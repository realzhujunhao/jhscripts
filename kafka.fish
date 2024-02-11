#!/usr/bin/env fish

set -l pwd (pwd)
set -l scala_version 2.13
set -l kafka_version 3.6.1
set -l kafka_filename kafka_{$scala_version}-{$kafka_version}.tgz
set -l kafka_domain https://downloads.apache.org/kafka
set -l kafka_url $kafka_domain/$kafka_version/$kafka_filename

set -l kafka_root /opt/kafka

echo "downloading kafka"
sudo mkdir $kafka_root
cd $kafka_root

sudo wget $kafka_url
sudo tar -zxvf $kafka_filename
sudo rm $kafka_root/$kafka_filename

echo "writing environment variables"
set -l fish_config ~/.config/fish/config.fish
set -l kafka_path $kafka_root/*
echo "set -gx KAFKA_HOME $kafka_path" >> $fish_config
echo "set -gx PATH \$KAFKA_HOME/bin \$PATH" >> $fish_config

echo "please run the following command"
echo "source $fish_config"
cd $pwd
