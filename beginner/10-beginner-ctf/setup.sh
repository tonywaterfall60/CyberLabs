#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/cyberclub/beginner-ctf"
rm -rf "$BASE"
mkdir -p "$BASE/linux/archive" "$BASE/logs" "$BASE/crypto" "$BASE/forensics"

printf 'normal training notes\n' > "$BASE/linux/readme.txt"

LINUX_FLAG="${BEGINNER_CTF_LINUX_FLAG:-${LINUX_FLAG_VALUE:-FLAG_NOT_CONFIGURED}}"
printf '%s\n' "$LINUX_FLAG" > "$BASE/linux/archive/evidence.txt"
chmod 600 "$BASE/linux/archive/evidence.txt"

cat > "$BASE/logs/auth.log" <<'EOF'
2026-09-24T14:00:01Z INFO user=alex action=LOGIN_SUCCESS source=192.168.56.10
2026-09-24T14:00:04Z WARNING user=sam action=FAILED_LOGIN source=192.168.56.50
2026-09-24T14:00:08Z WARNING user=sam action=FAILED_LOGIN source=192.168.56.50
2026-09-24T14:00:12Z INFO user=lee action=LOGIN_SUCCESS source=192.168.56.12
2026-09-24T14:00:18Z WARNING user=pat action=FAILED_LOGIN source=192.168.56.77
2026-09-24T14:00:22Z WARNING user=sam action=FAILED_LOGIN source=192.168.56.50
2026-09-24T14:00:35Z WARNING user=sam action=FAILED_LOGIN source=192.168.56.50
2026-09-24T14:00:41Z INFO user=sam action=LOGIN_SUCCESS source=192.168.56.50
EOF

LOG_FLAG="${BEGINNER_CTF_LOG_FLAG:-FLAG_NOT_CONFIGURED}"
EVIDENCE_FLAG="${BEGINNER_CTF_EVIDENCE_FLAG:-FLAG_NOT_CONFIGURED}"
REASONING_FLAG="${BEGINNER_CTF_REASONING_FLAG:-FLAG_NOT_CONFIGURED}"

printf 'analysis_scope=auth.log\nlog_flag=%s\n' "$LOG_FLAG" > "$BASE/logs/analyst-note.txt"

printf 'QmVnaW5uZXIgQ1RGOiBlbmNvZGluZyBpcyBub3QgZW5jcnlwdGlvbi4K' > "$BASE/crypto/message.b64"
printf 'CyberLabs beginner CTF evidence\n' > "$BASE/crypto/evidence.txt"
(cd "$BASE/crypto" && sha256sum evidence.txt > known.sha256)
printf '%s' "$EVIDENCE_FLAG" | base64 > "$BASE/crypto/evidence-flag.b64"

printf 'Evidence integrity matters.\n' > "$BASE/forensics/original.txt"
cp "$BASE/forensics/original.txt" "$BASE/forensics/copy.txt"
printf 'This is text despite the jpg extension.\n' > "$BASE/forensics/mystery.jpg"

mkdir -p "$BASE/reasoning"
cat > "$BASE/reasoning/case-closure.txt" <<EOF
scenario=broken_object_authorization
reasoning_flag=$REASONING_FLAG
EOF

echo "[+] Beginner CTF files created at $BASE"