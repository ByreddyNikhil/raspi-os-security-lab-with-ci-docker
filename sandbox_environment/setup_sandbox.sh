#!/bin/bash
set -e
sudo apt update && sudo apt install -y debootstrap systemd-container
sudo mkdir -p /sandbox
sudo debootstrap --arch=armhf bullseye /sandbox http://deb.debian.org/debian/
echo "[+] Sandbox environment created at /sandbox"
