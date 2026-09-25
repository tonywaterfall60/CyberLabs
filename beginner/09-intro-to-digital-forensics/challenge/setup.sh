#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/cyberclub/forensics-challenge"
rm -rf "$BASE"
mkdir -p "$BASE/evidence"

printf 'Meeting moved to 7 PM.\nBring the incident worksheet.\n' > "$BASE/evidence/meeting-notes.txt"
cp "$BASE/evidence/meeting-notes.txt" "$BASE/evidence/working-copy.txt"

printf 'This is plain text even though the extension suggests an image.\nCase note: verify file type before trusting an extension.\n' > "$BASE/evidence/photo.jpg"

cat > "$BASE/evidence/auth.log" <<'EOF'
2026-09-24T13:00:01Z user=alex action=LOGIN_SUCCESS source=192.168.56.10
2026-09-24T13:01:02Z user=sam action=FAILED_LOGIN source=192.168.56.50
EOF

printf '\x7fELFtraining-artifact\x00incident-note=beginner-forensics\x00' > "$BASE/evidence/archive.bin"

touch -t 202609241300 "$BASE/evidence/meeting-notes.txt"
touch -t 202609241300 "$BASE/evidence/working-copy.txt"
touch -t 202609241305 "$BASE/evidence/photo.jpg"
touch -t 202609241310 "$BASE/evidence/auth.log"
touch -t 202609241315 "$BASE/evidence/archive.bin"

(cd "$BASE" && sha256sum evidence/* > evidence-manifest.sha256)

echo "[+] Forensics challenge created at $BASE"
echo "[+] Start with: cd $BASE && cat evidence-manifest.sha256"