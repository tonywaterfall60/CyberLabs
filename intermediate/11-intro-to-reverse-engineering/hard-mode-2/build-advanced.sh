#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
command -v gcc >/dev/null || { echo "Install gcc first"; exit 1; }
if [[ -n "${ADVANCED_RE_FLAG:-}" ]]; then
  FLAG="$ADVANCED_RE_FLAG"
elif [[ -f ../challenge/runtime/dynamic-flag.txt ]]; then
  FLAG="$(head -n 1 ../challenge/runtime/dynamic-flag.txt | tr -d '\r')"
  [[ "$FLAG" == FLAG_NOT_CONFIGURED || -z "$FLAG" ]] && FLAG=""
else
  FLAG=""
fi
if [[ -z "$FLAG" ]]; then
  RANDOM_PART="$(od -An -N10 -tx1 /dev/urandom | tr -d ' \n')"
  FLAG="SRU{RE_HARD2_${RANDOM_PART}}"
  echo "[*] Generated a practice flag; this is not registered on the dashboard."
fi
if [[ ! "$FLAG" =~ ^SRU\{[A-Za-z0-9_]+\}$ ]]; then
  echo "[-] Invalid flag format: expected SRU{LETTERS_NUMBERS_UNDERSCORES}"
  exit 1
fi
mkdir -p runtime
trap 'rm -f runtime/generated_flag.h' EXIT
printf '#define HARD_MODE_FLAG "%s"\n' "$FLAG" > runtime/generated_flag.h
gcc -O2 -fPIE -pie -fstack-protector-strong -D_FORTIFY_SOURCE=2 \
  -Wl,-z,relro,-z,now -Iruntime -o hard2-bin advanced_validator.c
strip hard2-bin
echo "[+] Compiled ./hard2-bin. Recover the key to print its embedded SRU flag."
