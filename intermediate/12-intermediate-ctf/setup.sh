#!/usr/bin/env bash
set -e
BASE="$HOME/cyberclub/intermediate-ctf"
rm -rf "$BASE"
mkdir -p "$BASE/logs" "$BASE/linux-audit" "$BASE/reversing"

cat > "$BASE/logs/auth.log" <<'EOF'
2026-09-23T20:00:01Z FAIL user=alex src=10.20.30.40
2026-09-23T20:00:03Z FAIL user=alex src=10.20.30.40
2026-09-23T20:00:08Z SUCCESS user=alex src=10.20.30.40
2026-09-23T20:00:15Z user=alex action=EXPORT_REPORT
EOF

cat > "$BASE/linux-audit/sudoers.txt" <<'EOF'
analyst ALL=(root) NOPASSWD: /usr/bin/tar
EOF

if [[ -n "${REV_FLAG_VALUE:-}" ]]; then
  printf "%s\n" "$REV_FLAG_VALUE" > "$BASE/reversing/flag.txt"
else
  printf "FLAG_NOT_CONFIGURED\n" > "$BASE/reversing/flag.txt"
fi

echo "[+] Intermediate CTF files created at $BASE"
