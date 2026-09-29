#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/crypto-challenge"
[[ -f "$BASE/message.b64" ]] || { echo "[-] Run ./setup.sh first."; exit 1; }
msg="$(base64 -d "$BASE/message.b64" | tr -d '\n')"
note="$(base64 -d "$BASE/operator-note.b64" | tr -d '\n')"
[[ "$msg" == "CyberLabs says: encoding is not encryption." ]] || { echo "[-] message.b64 was not decoded correctly."; exit 1; }
[[ "$note" == "Verify the evidence hash before trusting the file." ]] || { echo "[-] operator-note.b64 was not decoded correctly."; exit 1; }
FLAG="${BEGINNER_CRYPTO_ENCODING_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Decoding validated, but BEGINNER_CRYPTO_ENCODING_FLAG is not configured."; exit 2; }
echo "[+] Base64 decoding checkpoint passed."
echo "$FLAG"
