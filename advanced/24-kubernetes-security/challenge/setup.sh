#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-k8s"
rm -rf "$BASE"
mkdir -p "$BASE"
for f in workloads.yaml rbac.yaml network-policy.yaml; do cp "$HERE/$f" "$BASE/$f"; done
RBAC_FLAG="${ADV_K8S_RBAC_FLAG:-FLAG_NOT_CONFIGURED}"
HARDEN_FLAG="${ADV_K8S_HARDEN_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/rbac-note.txt" <<EOF
web_sa=can_get_and_list_configmaps_and_secrets
maintenance=privileged_plus_hostPID
rbac_flag=$RBAC_FLAG
EOF
cat > "$BASE/.hardening-review" <<EOF
controls=nonroot,no_privilege_escalation,remove_privileged_hostPID,least_privilege_RBAC,default_deny_network
hardening_flag=$HARDEN_FLAG
EOF
echo "[+] Advanced Kubernetes workspace created at $BASE"
