#!/bin/bash
set -e
BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
echo "=== Raspberry Pi OS Security Lab ==="
echo "[1] Testing Kernel Module"
pushd "$BASE_DIR/kernel_module_playground" > /dev/null
bash test_module.sh || true
popd > /dev/null

echo "[2] Entering Sandbox"
pushd "$BASE_DIR/sandbox_environment" > /dev/null
sudo bash setup_sandbox.sh || true
./run_in_sandbox.sh echo "Hello from Sandbox" || true
popd > /dev/null

echo "[3] Dumping Memory (requires lime.ko built and root)"
pushd "$BASE_DIR/memory_forensics" > /dev/null
sudo bash build_lime.sh || true
sudo ./dump_memory.sh || true
popd > /dev/null

echo "[4] Checking HIDS Logs (Wazuh alerts)"
sudo tail -n 20 /var/ossec/logs/alerts/alerts.json || true

echo "[5] Simulating USB Insert Event"
bash "$BASE_DIR/usb_defense/usb-monitor.sh" || true

echo "=== End of test ==="
