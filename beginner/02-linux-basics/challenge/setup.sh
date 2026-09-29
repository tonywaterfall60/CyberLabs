#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/cyberclub/linux-challenge"
rm -rf "$BASE"
mkdir -p "$BASE/logs" "$BASE/archive/2026-09" "$BASE/docs" "$BASE/tmp"

cat > "$BASE/logs/auth.log" <<'EOF'
2026-09-24T09:10:00Z INFO service=sshd startup=complete
2026-09-24T09:11:04Z FAILED_LOGIN user=sam source=192.168.56.50
2026-09-24T09:11:10Z INFO user=alex login=success source=192.168.56.10
2026-09-24T09:11:18Z FAILED_LOGIN user=sam source=192.168.56.50
2026-09-24T09:11:25Z FAILED_LOGIN user=sam source=192.168.56.50
2026-09-24T09:12:00Z INFO user=alex logout=success source=192.168.56.10
EOF

cat > "$BASE/logs/app.log" <<'EOF'
2026-09-24T09:10:30Z INFO app=portal status=online
2026-09-24T09:12:30Z INFO app=portal action=health_check
EOF

cat > "$BASE/docs/notes.txt" <<'EOF'
Training notes:
- review authentication activity
- archive evidence after analysis
EOF

cat > "$BASE/tmp/readme.txt" <<'EOF'
This directory contains temporary training files.
EOF

EVIDENCE_FLAG="${BEGINNER_LINUX_EVIDENCE_FLAG:-${FLAG_VALUE:-}}"

if [[ -n "$EVIDENCE_FLAG" ]]; then
  printf "%s\n" "$EVIDENCE_FLAG" > "$BASE/archive/2026-09/evidence.txt"
else
  printf "FLAG_NOT_CONFIGURED\n" > "$BASE/archive/2026-09/evidence.txt"
fi

HIDDEN_FLAG="${BEGINNER_LINUX_COMPLETE_FLAG:-FLAG_NOT_CONFIGURED}"
printf "Remember: hidden files begin with a dot. Search carefully.\nsecondary_flag=%s\n" "$HIDDEN_FLAG" > "$BASE/.analyst-note"

chmod 600 "$BASE/archive/2026-09/evidence.txt"
touch -t 202609240915 "$BASE/archive/2026-09/evidence.txt"

echo "[+] Challenge created at $BASE"
echo "[+] Start with: cd $BASE && pwd && ls -la"