#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/beginner-ctf"
[[ -f "$BASE/crypto/message.b64" ]] || { echo "[-] Run ./setup.sh first."; exit 1; }
decoded="$(base64 -d "$BASE/crypto/message.b64" | tr -d '\n')"
[[ "$decoded" == "Beginner CTF: encoding is not encryption." ]] || { echo "[-] Crypto challenge is incomplete."; exit 1; }
(cd "$BASE/crypto" && sha256sum -c known.sha256 >/dev/null) || { echo "[-] Crypto integrity check failed."; exit 1; }
file -b "$BASE/forensics/mystery.jpg" | grep -qi 'text' || { echo "[-] Forensics file-type finding is incomplete."; exit 1; }
FLAG="${BEGINNER_CTF_EVIDENCE_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Evidence validated, but BEGINNER_CTF_EVIDENCE_FLAG is not configured."; exit 2; }
echo "[+] CTF crypto/forensics checkpoint passed."
echo "$FLAG"
