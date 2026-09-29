#!/usr/bin/env bash
set -euo pipefail

PCAP="${1:-challenge.pcap}"

if [[ ! -f "$PCAP" ]]; then
  echo "[-] PCAP not found: $PCAP"
  echo "    Save your capture as challenge.pcap or pass the file path as an argument."
  exit 1
fi

command -v tshark >/dev/null 2>&1 || {
  echo "[-] tshark is required for this checkpoint."
  exit 1
}

paths="$(tshark -r "$PCAP" -Y 'tcp.port == 8085 && http.request' -T fields -e http.request.uri 2>/dev/null || true)"

for expected in / /status /help; do
  if ! printf '%s
' "$paths" | grep -Fxq "$expected"; then
    echo "[-] Expected HTTP request not found in the PCAP: $expected"
    exit 1
  fi
done

if [[ "$(printf '%s
' "$paths" | grep -Fxc '/status')" -lt 2 ]]; then
  echo "[-] Expected two /status requests in the capture."
  exit 1
fi

FLAG="${BEGINNER_WIRESHARK_PCAP_FLAG:-}"
if [[ -z "$FLAG" ]]; then
  echo "[!] PCAP validated, but BEGINNER_WIRESHARK_PCAP_FLAG is not configured."
  exit 2
fi

echo "[+] PCAP contains the expected local HTTP sequence."
echo "$FLAG"
