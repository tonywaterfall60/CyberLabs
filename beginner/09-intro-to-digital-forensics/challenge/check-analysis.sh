#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/forensics-challenge"
orig="$BASE/evidence/meeting-notes.txt"
copy="$BASE/evidence/working-copy.txt"
[[ -f "$orig" && -f "$copy" ]] || { echo "[-] Run ./setup.sh first."; exit 1; }
h1="$(sha256sum "$orig" | awk '{print $1}')"
h2="$(sha256sum "$copy" | awk '{print $1}')"
[[ "$h1" != "$h2" ]] || { echo "[-] Modify only working-copy.txt before this checkpoint."; exit 1; }
strings "$BASE/evidence/archive.bin" | grep -q 'incident-note=beginner-forensics' || { echo "[-] Expected printable evidence was not found."; exit 1; }
FLAG="${BEGINNER_FORENSICS_ANALYSIS_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Analysis validated, but BEGINNER_FORENSICS_ANALYSIS_FLAG is not configured."; exit 2; }
echo "[+] Forensic analysis checkpoint passed."
echo "$FLAG"
