#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/crypto-challenge"
[[ -f "$BASE/known.sha256" ]] || { echo "[-] Run ./setup.sh first."; exit 1; }
(cd "$BASE" && sha256sum -c known.sha256 >/dev/null) || { echo "[-] evidence.txt does not match the known digest."; exit 1; }
h1="$(sha256sum "$BASE/original.txt" | awk '{print $1}')"
h2="$(sha256sum "$BASE/copy.txt" | awk '{print $1}')"
if [[ "$h1" == "$h2" ]]; then
  echo "[-] copy.txt still matches original.txt. Complete the modification phase first."
  exit 1
fi
FLAG="${BEGINNER_CRYPTO_INTEGRITY_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Integrity work validated, but BEGINNER_CRYPTO_INTEGRITY_FLAG is not configured."; exit 2; }
echo "[+] Integrity checkpoint passed."
echo "$FLAG"
