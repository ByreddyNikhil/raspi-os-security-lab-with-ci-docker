#!/bin/bash
LOGFILE="/var/log/usb-defense.log"
mkdir -p "$(dirname "$LOGFILE")"
DEVICE_INFO=$(lsusb | tail -n 1)
echo "$(date --iso-8601=seconds) [!] USB Device Detected: $DEVICE_INFO" | tee -a "$LOGFILE"

# Example whitelist name fragment - change to your actual trusted device id/string
WHITELIST="MyTrustedKeyboard"

if [[ "$DEVICE_INFO" != *"$WHITELIST"* ]]; then
    echo "$(date --iso-8601=seconds) [!] Unauthorized device - attempting to block" | tee -a "$LOGFILE"
    # WARNING: sysfs path varies per device. User must determine correct path for their device.
    # This is a safe no-op default; uncomment and set the correct path to actively deauthorize.
    # echo 0 | sudo tee /sys/bus/usb/devices/1-1/authorized
    echo "$(date --iso-8601=seconds) [!] Block is NOT enabled by default. Edit usb-monitor.sh to set correct sysfs path." | tee -a "$LOGFILE"
else
    echo "$(date --iso-8601=seconds) [+] Device whitelisted." | tee -a "$LOGFILE"
fi
