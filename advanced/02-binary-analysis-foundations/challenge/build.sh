#!/usr/bin/env bash
set -e
gcc -O0 -fno-stack-protector -no-pie -o vuln-bin vuln.c
echo "[+] Built ./vuln-bin"
