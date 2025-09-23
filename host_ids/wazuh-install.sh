#!/bin/bash
set -e
echo "[+] This script will install Wazuh agent (follow prompts)"
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | sudo apt-key add -
echo "deb https://packages.wazuh.com/4.x/apt stable main" | sudo tee /etc/apt/sources.list.d/wazuh.list
sudo apt update
sudo apt install -y wazuh-agent || true
echo "[+] Wazuh agent installed (configure manager connection manually as needed)."
