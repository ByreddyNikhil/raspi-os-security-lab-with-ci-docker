#!/bin/bash
set -e
sudo apt update
sudo apt install -y git build-essential linux-headers-$(uname -r)
git clone https://github.com/504ensicsLabs/LiME.git /tmp/LiME || true
cd /tmp/LiME/src
make
sudo cp lime.ko /usr/local/bin/lime.ko || true
echo "[+] Built LiME (lime.ko) and copied to /usr/local/bin/"
