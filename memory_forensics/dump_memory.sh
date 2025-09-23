#!/bin/bash
set -e
OUT_DIR="/forensics"
sudo mkdir -p "$OUT_DIR"
OUT="$OUT_DIR/memdump-$(date +%F-%H%M%S).lime"
echo "[+] Dumping memory to $OUT (this may pause the system briefly)"
sudo insmod /usr/local/bin/lime.ko "path=$OUT format=lime"
echo "[+] Memory dump complete: $OUT"
