#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/forensics-challenge"
[[ -f "$BASE/evidence-manifest.sha256" ]] || { echo "[-] Run ./setup.sh first."; exit 1; }
(cd "$BASE" && sha256sum -c evidence-manifest.sha256 >/dev/null) || { echo "[-] Original evidence no longer matches the manifest."; exit 1; }
type="$(file -b "$BASE/evidence/photo.jpg")"
printf '%s' "$type" | grep -qi 'text' || { echo "[-] Re-check the misleading extension finding."; exit 1; }
FLAG="${BEGINNER_FORENSICS_PRESERVATION_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Evidence validated, but BEGINNER_FORENSICS_PRESERVATION_FLAG is not configured."; exit 2; }
echo "[+] Evidence preservation and type validation passed."
echo "$FLAG"
