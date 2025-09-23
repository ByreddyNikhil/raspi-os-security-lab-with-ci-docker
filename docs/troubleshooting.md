# Troubleshooting

- If `make` in kernel module fails: ensure `raspberrypi-kernel-headers` and `build-essential` are installed.
- LiME build errors: install correct linux headers for your running kernel version.
- Wazuh install: check network and GPG key availability.
- USB blocking doesn't work: check the correct sysfs path in usb-monitor.sh (it can differ by device).
