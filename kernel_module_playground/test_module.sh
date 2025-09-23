#!/bin/bash
set -e
echo "[+] Building module..."
make
echo "[+] Loading kernel module..."
sudo insmod hello.ko
sleep 1
dmesg | tail -n 20
echo "[+] Unloading kernel module..."
sudo rmmod hello
sleep 1
dmesg | tail -n 20
