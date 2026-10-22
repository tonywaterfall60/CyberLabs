#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
command -v gcc >/dev/null || { echo "Install gcc first"; exit 1; }

# Instructor can provide the dashboard flag at build time.
# Otherwise generate a local practice flag so success always prints one.
if [[ -n "${INTERMEDIATE_RE_HARD_FLAG:-}" ]]; then
  FLAG="$INTERMEDIATE_RE_HARD_FLAG"
elif [[ -f ../challenge/runtime/dynamic-flag.txt ]]; then
  FLAG="$(head -n 1 ../challenge/runtime/dynamic-flag.txt | tr -d '\r')"
  if [[ "$FLAG" == FLAG_NOT_CONFIGURED || -z "$FLAG" ]]; then
    FLAG=""
  fi
else
  FLAG=""
fi
if [[ -z "$FLAG" ]]; then
  RANDOM_PART="$(od -An -N10 -tx1 /dev/urandom | tr -d ' \n')"
  FLAG="SRU{RE_HARD_${RANDOM_PART}}"
  echo "[*] Generated a practice flag; it is not automatically registered on the dashboard."
fi
if [[ ! "$FLAG" =~ ^SRU\{[A-Za-z0-9_]+\}$ ]]; then
  echo "[-] Invalid flag format (expected SRU{LETTERS_NUMBERS_UNDERSCORES})"
  exit 1
fi

# Temporary header is removed after compilation. No runtime file required.
mkdir -p runtime
trap 'rm -f runtime/generated_flag.h' EXIT
printf '#define HARD_MODE_FLAG "%s"\n' "$FLAG" > runtime/generated_flag.h
gcc -O2 -fPIE -pie -fstack-protector-strong -D_FORTIFY_SOURCE=2 \
  -Wl,-z,relro,-z,now -Iruntime -o hard-bin hard_validator.c
strip hard-bin
echo "[+] Compiled ./hard-bin. Correct password prints the embedded SRU flag."
echo "[*] Analyze hard-bin without opening hard_validator.c first."
