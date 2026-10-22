#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
command -v docker >/dev/null || { echo "Docker is required"; exit 1; }
docker compose version >/dev/null || { echo "Docker Compose plugin is required"; exit 1; }
if [[ ! -f .env ]]; then
  if [[ -n "${LAB_FLAG:-}" ]]; then
    FLAG="$LAB_FLAG"
  else
    RANDOM_PART="$(od -An -N12 -tx1 /dev/urandom | tr -d ' \n')"
    FLAG="SRU{LINUX_ROOT_${RANDOM_PART}}"
  fi
  if [[ ! "$FLAG" =~ ^SRU\{[a-zA-Z0-9_]+\}$ ]]; then
    echo "Flag must have SRU{LETTERS_NUMBERS_UNDERSCORES} format"; exit 1
  fi
  (umask 077; printf 'LAB_FLAG=%s\n' "$FLAG" > .env)
fi
docker compose up --build -d
echo
echo "Connect: ssh -p 2222 student@127.0.0.1"
echo "Password: cyberlabs"
echo "Stop: docker compose down"
echo "Reset: ./reset.sh (creates a new flag next run)"
