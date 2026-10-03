#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-re2"
rm -rf "$BASE"
mkdir -p "$BASE"
cp "$HERE/disassembly.txt" "$BASE/disassembly.txt"
cp "$HERE/strings.txt" "$BASE/strings.txt"
LOGIC_FLAG="${ADV_RE2_LOGIC_FLAG:-FLAG_NOT_CONFIGURED}"
CONSTRAINT_FLAG="${ADV_RE2_CONSTRAINT_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/logic-note.txt" <<EOF
length=8
transform=byte_xor_0x23_then_accumulate
compare=0x2f8
logic_flag=$LOGIC_FLAG
EOF
cat > "$BASE/.constraint-review" <<EOF
constraint=sum((byte xor 0x23) for 8 bytes)==0x2f8
constraint_flag=$CONSTRAINT_FLAG
EOF
echo "[+] Advanced RE II workspace created at $BASE"
