#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/container-security"
rm -rf "$BASE"
mkdir -p "$BASE"
cp "$HERE/Dockerfile.training" "$BASE/Dockerfile.training"
cp "$HERE/compose.training.yml" "$BASE/compose.training.yml"
BOUNDARY_FLAG="${INTERMEDIATE_CONTAINER_BOUNDARY_FLAG:-FLAG_NOT_CONFIGURED}"
HARDEN_FLAG="${INTERMEDIATE_CONTAINER_HARDEN_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/boundary-note.txt" <<EOF
published_port=127.0.0.1:8900->5000
bind_mount=./:/app/data
boundary_flag=$BOUNDARY_FLAG
EOF
cat > "$BASE/.hardening-review" <<EOF
issues=root_default,broad_bind_mount,plaintext_environment_secret
hardening_flag=$HARDEN_FLAG
EOF
echo "[+] Container security workspace created at $BASE"
