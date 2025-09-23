#!/bin/bash
if [ $# -lt 1 ]; then
    echo "Usage: $0 <memdump.lime>"
    exit 1
fi
MEMFILE="$1"
echo "[+] Analyze with volatility on another machine (volatility may need specific plugins)"
echo "Example commands:"
echo "volatility -f $MEMFILE linux_pslist"
echo "volatility -f $MEMFILE linux_netstat"
