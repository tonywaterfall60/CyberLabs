#!/usr/bin/env bash
set -euo pipefail

if [[ ! -f runtime/static-note.txt || ! -f runtime/dynamic-flag.txt ]]; then
  echo "[-] Runtime flag artifacts are missing. Run ./prepare-flags.sh first."
  exit 1
fi

STATIC_FLAG="$(cut -d= -f2- runtime/static-note.txt)"
DYNAMIC_FLAG="$(cat runtime/dynamic-flag.txt)"

cat > runtime/generated_flags.h <<EOF
#define STATIC_ANALYSIS_FLAG "$STATIC_FLAG"
#define DYNAMIC_SUCCESS_FLAG "$DYNAMIC_FLAG"
EOF

gcc -O0 -fstack-protector-strong -fPIE -pie -Iruntime -o training-bin training.c
strip training-bin
echo "[+] Built stripped PIE binary: ./training-bin"
