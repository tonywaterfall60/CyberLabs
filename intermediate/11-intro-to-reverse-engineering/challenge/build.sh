#!/usr/bin/env bash
set -e
gcc -O0 -fstack-protector-strong -o training-bin training.c
echo "[+] Built ./training-bin"
