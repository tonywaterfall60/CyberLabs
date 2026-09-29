#!/usr/bin/env bash
set -euo pipefail

ANALYSIS_FLAG="${BEGINNER_WIRESHARK_ANALYSIS_FLAG:-FLAG_NOT_CONFIGURED}"
PCAP_FLAG="${BEGINNER_WIRESHARK_PCAP_FLAG:-FLAG_NOT_CONFIGURED}"

rm -rf runtime
mkdir -p runtime
printf 'analysis_flag=%s\n' "$ANALYSIS_FLAG" > runtime/analysis-note.txt
printf 'pcap_flag=%s\n' "$PCAP_FLAG" > runtime/pcap-marker.txt

echo "[+] Runtime packet-analysis artifacts prepared under ignored runtime/."
