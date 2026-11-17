#!/usr/bin/env bash
set -euo pipefail

# Instructor-only build step: embed the private dashboard flags in the
# distributed executable. Never commit the flag values to this public repo.
for flag_var in INTERMEDIATE_RE_STATIC_FLAG INTERMEDIATE_RE_DYNAMIC_FLAG; do
  flag_value="${!flag_var:-}"
  if [[ -z "$flag_value" || "$flag_value" == "FLAG_NOT_CONFIGURED" ]]; then
    echo "[-] Missing $flag_var. Load CyberLabs-Instructor/flags/PRIVATE_FLAGS.env first." >&2
    exit 1
  fi
  if [[ ! "$flag_value" =~ ^SRU\{[A-Za-z0-9_-]+\}$ ]]; then
    echo "[-] $flag_var must contain a valid SRU{...} flag." >&2
    exit 1
  fi
done

umask 077
rm -rf runtime
mkdir -p runtime
printf 'static_flag=%s\n' "$INTERMEDIATE_RE_STATIC_FLAG" > runtime/static-note.txt
printf '%s\n' "$INTERMEDIATE_RE_DYNAMIC_FLAG" > runtime/dynamic-flag.txt

echo "[+] Real flags prepared for compilation into training-bin."
