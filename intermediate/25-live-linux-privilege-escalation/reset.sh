#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
docker compose down --remove-orphans
rm -f .env
echo "Lab reset. Run bash start.sh for a fresh root flag."
