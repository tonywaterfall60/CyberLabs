#!/usr/bin/env bash
set -e

BASE="$HOME/cyberclub/beginner-ctf"
rm -rf "$BASE"
mkdir -p "$BASE/linux/archive" "$BASE/logs" "$BASE/forensics"

printf "normal training notes\n" > "$BASE/linux/readme.txt"
printf "SRU{}\n" > "$BASE/linux/archive/evidence.txt"

cat > "$BASE/logs/auth.log" <<'EOF'
INFO user=alex action=LOGIN_SUCCESS source=192.168.56.10
WARNING user=sam action=FAILED_LOGIN source=192.168.56.50
WARNING user=sam action=FAILED_LOGIN source=192.168.56.50
INFO user=lee action=LOGIN_SUCCESS source=192.168.56.12
WARNING user=pat action=FAILED_LOGIN source=192.168.56.77
WARNING user=sam action=FAILED_LOGIN source=192.168.56.50
EOF

printf "Evidence integrity matters.\n" > "$BASE/forensics/original.txt"
cp "$BASE/forensics/original.txt" "$BASE/forensics/copy.txt"

echo "[+] Beginner CTF files created at $BASE"
