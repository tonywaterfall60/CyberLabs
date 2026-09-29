#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/cyberclub/network-troubleshooting"
rm -rf "$BASE"
mkdir -p "$BASE"

cat > "$BASE/ticket-evidence.txt" <<'EOF'
ticket_1=hostname_fails_ip_works
ticket_2=https_refused_ping_works
ticket_3=local_only_remote_fails
ticket_4=dns_returns_wrong_ip
ticket_5=http_500
ticket_6=dns_server_unreachable
ticket_7=process_running_port_not_listening
EOF

FLAG="${BEGINNER_NETWORKING_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/closure-ticket.txt" <<EOF
status=analysis_ready
final_flag=$FLAG
EOF

echo "[+] Network troubleshooting evidence created at $BASE"
