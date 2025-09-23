.PHONY: all setup kernel sandbox forensics hids usb clean

all: setup kernel sandbox forensics hids usb

setup:
	@echo "[+] Updating system"
	sudo apt update && sudo apt upgrade -y

kernel:
	@echo "[+] Building and testing kernel module"
	cd kernel_module_playground && make && sudo ./test_module.sh

sandbox:
	@echo "[+] Setting up sandbox environment"
	cd sandbox_environment && sudo bash setup_sandbox.sh

forensics:
	@echo "[+] Building LiME and preparing memory forensics"
	cd memory_forensics && sudo bash build_lime.sh

hids:
	@echo "[+] Installing Wazuh Host IDS"
	cd host_ids && sudo bash wazuh-install.sh

usb:
	@echo "[+] Deploying USB defense scripts"
	sudo cp usb_defense/99-usb-monitor.rules /etc/udev/rules.d/
	sudo cp usb_defense/usb-monitor.sh /usr/local/bin/
	sudo chmod +x /usr/local/bin/usb-monitor.sh
	sudo udevadm control --reload-rules

clean:
	@echo "[+] Cleaning kernel module build files"
	cd kernel_module_playground && make clean
