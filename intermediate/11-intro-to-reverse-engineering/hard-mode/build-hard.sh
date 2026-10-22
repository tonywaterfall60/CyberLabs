#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
command -v gcc >/dev/null || { echo "Install gcc first"; exit 1; }
gcc -O2 -fPIE -pie -fstack-protector-strong -D_FORTIFY_SOURCE=2 \
  -Wl,-z,relro,-z,now -o hard-bin hard_validator.c
strip hard-bin
echo "[+] Compiled ./hard-bin. Analyze it without opening hard_validator.c first."
echo "[*] Existing flag setup: run ../challenge/prepare-flags.sh and copy ../challenge/runtime/dynamic-flag.txt into hard-mode/runtime/ if authorized."
