# Usage Guide

This guide walks through setting up the lab on a Raspberry Pi (Bullseye/Bookworm).

## Prerequisites
- A Raspberry Pi 4 (recommended) or Pi Zero (some components limited)
- Raspberry Pi OS installed & network access
- sudo privileges

## High-level setup steps
1. Update system:
   sudo apt update && sudo apt upgrade -y

2. Kernel Module Playground
   cd kernel_module_playground
   make
   sudo ./test_module.sh

3. Sandbox environment
   cd ../sandbox_environment
   sudo bash setup_sandbox.sh
   ./run_in_sandbox.sh /bin/bash

4. Memory Forensics
   cd ../memory_forensics
   sudo bash build_lime.sh
   sudo ./dump_memory.sh

5. Host IDS (Wazuh example)
   cd ../host_ids
   sudo bash wazuh-install.sh
   # follow the script prompts

6. USB Defense
   cd ../usb_defense
   sudo cp 99-usb-monitor.rules /etc/udev/rules.d/
   sudo cp usb-monitor.sh /usr/local/bin/
   sudo chmod +x /usr/local/bin/usb-monitor.sh
   sudo udevadm control --reload-rules

## Testing
Use `scripts/full-test.sh` to run an end-to-end demo (some steps may require sudo).
