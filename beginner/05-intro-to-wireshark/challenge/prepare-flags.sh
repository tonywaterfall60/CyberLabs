#!/usr/bin/env bash
set -euo pipefail

# This lab uses Python's built-in HTTP server; no Docker is needed.
# Generated evidence is excluded by the repository's .gitignore.
cd "$(dirname "$0")"
umask 077

ANALYSIS_FLAG="${BEGINNER_WIRESHARK_ANALYSIS_FLAG:-FLAG_NOT_CONFIGURED}"
PCAP_FLAG="${BEGINNER_WIRESHARK_PCAP_FLAG:-FLAG_NOT_CONFIGURED}"

mkdir -p site
rm -rf -- site/runtime
mkdir -p site/runtime
printf 'analysis_flag=%s\n' "$ANALYSIS_FLAG" > site/runtime/analysis-note.txt
printf 'pcap_flag=%s\n' "$PCAP_FLAG" > site/runtime/pcap-marker.txt

if [[ "$ANALYSIS_FLAG" == "FLAG_NOT_CONFIGURED" || "$PCAP_FLAG" == "FLAG_NOT_CONFIGURED" ]]; then
  echo '[!] Private flags were not supplied; practice traffic still works.'
  echo '[!] FLAG_NOT_CONFIGURED is not a valid dashboard flag.'
else
  echo '[+] Instructor runtime evidence prepared.'
fi
echo '[+] Runtime files created under ignored challenge/site/runtime/.'
