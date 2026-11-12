#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
BASE='http://127.0.0.1:8085'

# Six predictable HTTP requests for Wireshark; fail clearly on a bad response.
for path in / /status /help /runtime/analysis-note.txt /status /runtime/pcap-marker.txt; do
  echo "[+] GET $path"
  curl --silent --show-error --fail --max-time 10 \
    --output /dev/null \
    --write-out '    HTTP %{http_code}\n' \
    "$BASE$path"
  sleep 1
done

echo '[+] Traffic generation complete.'
