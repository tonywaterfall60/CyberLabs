#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/extra-beginner-b06"
rm -rf "$BASE"
mkdir -p "$BASE"
cat > "$BASE/packet-summary.txt" <<EOF
frame=1 src=10.10.10.5 dst=10.10.10.20 protocol=DNS query=portal.training.local
frame=2 src=10.10.10.5 dst=10.10.10.30 protocol=TCP dport=80 flags=SYN
frame=3 src=10.10.10.30 dst=10.10.10.5 protocol=TCP sport=80 flags=SYN,ACK
frame=4 src=10.10.10.5 dst=10.10.10.30 protocol=HTTP method=GET path=/
frame=5 src=10.10.10.30 dst=10.10.10.5 protocol=HTTP status=200 flag=${BEGINNER_EXTRA_B06_FLAG:-FLAG_NOT_CONFIGURED}
EOF
echo "[+] B06 packet summary created at $BASE"
