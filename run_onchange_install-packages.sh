#!/bin/sh
wget https://github.com/prietus/mopytui/releases/download/v0.2.2/mopytui-linux-x86_64.tar.gz
gunzip mopytui-linux-x86_64.tar.gz
tar -xvf mopytui-linux-x86_64.tar
mkdir -p /home/nestor/.local/bin
mv mopytui-linux-x86_64/mopytui /home/nestor/.local/bin
