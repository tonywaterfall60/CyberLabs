#!/usr/bin/env bash
set -euo pipefail
BASE="http://127.0.0.1:8070"
command -v curl >/dev/null 2>&1 || { echo "[-] curl is required."; exit 1; }

declare -A expected=(["/"]="200" ["/about"]="200" ["/session-demo"]="200" ["/api/status"]="200" ["/admin"]="403" ["/robots.txt"]="200")
for path in "/" "/about" "/session-demo" "/api/status" "/admin" "/robots.txt"; do
  code="$(curl -s -o /dev/null -w '%{http_code}' "$BASE$path")"
  if [[ "$code" != "${expected[$path]}" ]]; then
    echo "[-] Unexpected status for $path: $code"
    exit 1
  fi
done
FLAG="${BEGINNER_WEB_MAP_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Map validated, but BEGINNER_WEB_MAP_FLAG is not configured."; exit 2; }
echo "[+] Application map validated."
echo "$FLAG"
