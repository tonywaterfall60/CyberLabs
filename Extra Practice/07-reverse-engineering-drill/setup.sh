#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/extra-practice/reverse-drill"

rm -rf "$BASE"
mkdir -p "$BASE"

base64 -d "$SRC_DIR/access-validator.b64" | gzip -d > "$BASE/access-validator"
chmod 755 "$BASE/access-validator"

cat > "$BASE/CASE_INFO.txt" <<'EOF'
Case: EP-07 Reverse Engineering Drill
Artifact: access-validator
Scope: decoded binary only
Objective: recover accepted phrase and explain validation logic
EOF

echo "[+] Reverse-engineering artifact created:"
echo "    $BASE/access-validator"
echo "[+] Start with file, sha256sum, strings, and checksec."