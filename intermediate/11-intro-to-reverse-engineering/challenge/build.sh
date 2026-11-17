#!/usr/bin/env bash
set -euo pipefail

if [[ ! -f runtime/static-note.txt || ! -f runtime/dynamic-flag.txt ]]; then
  echo "[-] Runtime flag artifacts are missing. Load the private instructor flags, then run ./prepare-flags.sh first." >&2
  exit 1
fi

STATIC_FLAG="$(sed -n 's/^static_flag=//p' runtime/static-note.txt)"
DYNAMIC_FLAG="$(cat runtime/dynamic-flag.txt)"

# Do not release a binary that contains the old FLAG_NOT_CONFIGURED placeholder.
for flag_value in "$STATIC_FLAG" "$DYNAMIC_FLAG"; do
  if [[ ! "$flag_value" =~ ^SRU\{[A-Za-z0-9_-]+\}$ ]]; then
    echo "[-] Missing or invalid SRU flag. Re-run ./prepare-flags.sh with the private registry loaded." >&2
    exit 1
  fi
done

# The generated header compiles the real flags into the ELF; it is not a player file.
umask 077
trap 'rm -f runtime/generated_flags.h' EXIT
cat > runtime/generated_flags.h <<EOF
#define STATIC_ANALYSIS_FLAG "$STATIC_FLAG"
#define DYNAMIC_SUCCESS_FLAG "$DYNAMIC_FLAG"
EOF

gcc -O0 -fstack-protector-strong -fPIE -pie -Iruntime -o training-bin training.c
strip training-bin
echo "[+] Built stripped PIE binary with embedded event flags: ./training-bin"
