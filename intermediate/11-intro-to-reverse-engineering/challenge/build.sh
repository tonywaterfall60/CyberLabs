#!/usr/bin/env bash
set -euo pipefail
gcc -O0 -fstack-protector-strong -fPIE -pie -o training-bin training.c
strip training-bin
echo "[+] Built stripped PIE binary: ./training-bin"