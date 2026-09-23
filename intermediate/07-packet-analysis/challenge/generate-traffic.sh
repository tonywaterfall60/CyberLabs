#!/usr/bin/env bash
set -e
for path in / /login /api/profile /logout; do
  curl -s -o /dev/null -D - "http://127.0.0.1:8300$path"
  sleep 1
done
echo "[+] Local training traffic generated."
