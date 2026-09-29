#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/osint-workshop"
rm -rf "$BASE"
mkdir -p "$BASE"

for f in website.txt social-posts.txt conference-bio.txt whois-summary.txt event-flyer.txt repository-profile.txt; do
  cp "$HERE/$f" "$BASE/$f"
done

PROVENANCE_FLAG="${INTERMEDIATE_OSINT_PROVENANCE_FLAG:-FLAG_NOT_CONFIGURED}"
CONFIDENCE_FLAG="${INTERMEDIATE_OSINT_CONFIDENCE_FLAG:-FLAG_NOT_CONFIGURED}"

cat > "$BASE/provenance-note.txt" <<EOF
artifact_count=6
provenance_flag=$PROVENANCE_FLAG
EOF

cat > "$BASE/.confidence-review" <<EOF
task=corroboration_and_uncertainty
confidence_flag=$CONFIDENCE_FLAG
EOF

echo "[+] Fictional OSINT workspace created at $BASE"
