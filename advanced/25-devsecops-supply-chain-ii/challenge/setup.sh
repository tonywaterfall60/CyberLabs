#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-supply-chain"
rm -rf "$BASE"
mkdir -p "$BASE"
for f in workflow.yml sbom.json provenance.json release-log.jsonl; do cp "$HERE/$f" "$BASE/$f"; done
PROV_FLAG="${ADV_SUPPLY_PROVENANCE_FLAG:-FLAG_NOT_CONFIGURED}"
GATE_FLAG="${ADV_SUPPLY_GATE_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/provenance-note.txt" <<EOF
deployed_digest=sha256:aaaa1111
provenance_digest=sha256:bbbb2222
signed=false
provenance_flag=$PROV_FLAG
EOF
cat > "$BASE/.release-gate-review" <<EOF
gate=identity+digest+provenance+approval
release_gate_flag=$GATE_FLAG
EOF
echo "[+] Advanced supply-chain workspace created at $BASE"
