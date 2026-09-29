#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/cyberclub/security-triage"
rm -rf "$BASE"
mkdir -p "$BASE"

cat > "$BASE/case-summary.txt" <<'EOF'
CyberLabs Security Triage
Review all five incidents in the challenge README.
Document asset, threat, vulnerability, impact, control, and confidence.
EOF

FLAG="${BEGINNER_INTRO_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/closure-note.txt" <<EOF
case_status=ready_for_review
completion_flag=$FLAG
EOF

echo "[+] Triage workspace created at $BASE"
echo "[+] Complete the README analysis, then inspect the generated case files."
