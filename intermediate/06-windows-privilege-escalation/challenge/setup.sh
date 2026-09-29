#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/windows-privesc-audit"
rm -rf "$BASE"
mkdir -p "$BASE"

for f in whoami_priv.txt services.txt scheduled_tasks.txt permissions.txt config.txt; do
  cp "$HERE/$f" "$BASE/$f"
done

EVIDENCE_FLAG="${INTERMEDIATE_WINDOWS_PRIVESC_EVIDENCE_FLAG:-FLAG_NOT_CONFIGURED}"
REMEDIATION_FLAG="${INTERMEDIATE_WINDOWS_PRIVESC_REMEDIATION_FLAG:-FLAG_NOT_CONFIGURED}"

cat > "$BASE/privilege-correlation.txt" <<EOF
task=NightlyBackup
run_as=SYSTEM
script=C:\Tools\backup.ps1
evidence_flag=$EVIDENCE_FLAG
EOF

cat > "$BASE/.remediation-review" <<EOF
fix=remove_modify_permission_from_BUILTIN_Users
remediation_flag=$REMEDIATION_FLAG
EOF

echo "[+] Windows privilege audit created at $BASE"
