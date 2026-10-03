#!/usr/bin/env bash
set -e

if [[ ! -f runtime/crash-note.txt || ! -f runtime/mitigation-note.txt ]]; then
  echo "[-] Runtime artifacts missing. Run ./prepare-flags.sh first."
  exit 1
fi

gcc -O0 -fno-stack-protector -no-pie -o vuln-bin vuln.c
echo "[+] Built ./vuln-bin"
echo "[+] Runtime analysis notes prepared under ignored runtime/."
