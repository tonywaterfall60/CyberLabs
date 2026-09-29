#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/windows-security-review"
rm -rf "$BASE"
mkdir -p "$BASE"

cp "$HERE/windows-evidence.txt" "$BASE/windows-evidence.txt"

EVIDENCE_FLAG="${INTERMEDIATE_WINDOWS_SECURITY_EVIDENCE_FLAG:-FLAG_NOT_CONFIGURED}"
REMEDIATION_FLAG="${INTERMEDIATE_WINDOWS_SECURITY_REMEDIATION_FLAG:-FLAG_NOT_CONFIGURED}"

cat > "$BASE/evidence-correlation.txt" <<EOF
focus=service_task_acl_security_sysmon_powershell
evidence_flag=$EVIDENCE_FLAG
EOF

cat > "$BASE/.remediation-note" <<EOF
task=separate_configuration_weakness_from_observed_abuse
remediation_flag=$REMEDIATION_FLAG
EOF

echo "[+] Windows security review created at $BASE"
