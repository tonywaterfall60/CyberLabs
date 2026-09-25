#!/usr/bin/env bash
set -euo pipefail
BASE="$(cd "$(dirname "$0")" && pwd)"
cd "$BASE"
docker compose down --remove-orphans
rm -rf runtime
echo "[+] Multi-host range stopped and runtime logs removed."