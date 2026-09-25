#!/usr/bin/env bash
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/extra-practice/full-ir-case"
rm -rf "$BASE"
mkdir -p "$BASE"/{identity,network,endpoint,application}

cat > "$BASE/case-info.txt" <<'EOF'
Case: EP-11 Full Incident Response
Primary identity: sam
Primary endpoint: WS-17
Collection window: 2026-09-25T02:00:00Z - 2026-09-25T02:30:00Z
Evidence type: synthetic training data
EOF

cat > "$BASE/identity/auth.log" <<'EOF'
2026-09-25T02:02:01Z FAIL user=sam src=198.51.100.66 device=unknown reason=bad_password
2026-09-25T02:02:08Z FAIL user=sam src=198.51.100.66 device=unknown reason=bad_password
2026-09-25T02:02:17Z FAIL user=sam src=198.51.100.66 device=unknown reason=bad_password
2026-09-25T02:02:31Z SUCCESS user=sam src=198.51.100.66 device=WS-17 session=IR-S-441
2026-09-25T02:12:00Z SUCCESS user=lee src=203.0.113.20 device=WS-22 session=IR-S-900
EOF

cat > "$BASE/identity/mfa.jsonl" <<'EOF'
{"ts":"2026-09-25T02:02:34Z","user":"sam","device":"WS-17","session":"IR-S-441","factor":"push","result":"approved"}
{"ts":"2026-09-25T02:12:03Z","user":"lee","device":"WS-22","session":"IR-S-900","factor":"push","result":"approved"}
EOF

cat > "$BASE/endpoint/process.jsonl" <<'EOF'
{"ts":"2026-09-25T02:03:12Z","host":"WS-17","user":"sam","parent":"winword.exe","process":"powershell.exe","cmd":"powershell.exe -ExecutionPolicy Bypass -File C:\\Users\\sam\\AppData\\Local\\Temp\\suspicious-update.ps1"}
{"ts":"2026-09-25T02:03:19Z","host":"WS-17","user":"sam","parent":"powershell.exe","process":"cmd.exe","cmd":"cmd.exe /c whoami"}
{"ts":"2026-09-25T02:03:24Z","host":"WS-17","user":"sam","parent":"powershell.exe","process":"powershell.exe","cmd":"powershell.exe -EncodedCommand VHJhaW5pbmdPbmx5"}
{"ts":"2026-09-25T02:15:00Z","host":"WS-22","user":"lee","parent":"explorer.exe","process":"powershell.exe","cmd":"powershell.exe Get-Service"}
EOF

cat > "$BASE/endpoint/files.jsonl" <<'EOF'
{"ts":"2026-09-25T02:03:05Z","host":"WS-17","user":"sam","action":"file_create","path":"C:\\Users\\sam\\AppData\\Local\\Temp\\suspicious-update.ps1"}
{"ts":"2026-09-25T02:04:40Z","host":"WS-17","user":"sam","action":"file_create","path":"C:\\Users\\sam\\AppData\\Local\\Temp\\employee-export.csv"}
EOF

cat > "$BASE/endpoint/suspicious-update.ps1" <<'EOF'
# CyberLabs training artifact - DO NOT EXECUTE
$domain = 'sync.training.invalid'
$marker = "$env:TEMP\\training-marker.txt"
Set-Content -Path $marker -Value 'training-only'
Write-Output $domain
EOF

cat > "$BASE/network/dns.log" <<'EOF'
2026-09-25T02:03:26Z host=WS-17 query=sync.training.invalid result=192.0.2.44
2026-09-25T02:15:05Z host=WS-22 query=intranet.training.local result=10.90.0.20
EOF

cat > "$BASE/application/access.log" <<'EOF'
2026-09-25T02:04:02Z user=sam session=IR-S-441 action=VIEW_PROFILE object=sam result=success
2026-09-25T02:04:18Z user=sam session=IR-S-441 action=VIEW_EMPLOYEE_DIRECTORY object=all result=success
2026-09-25T02:04:36Z user=sam session=IR-S-441 action=EXPORT_EMPLOYEE_DIRECTORY object=all result=success
2026-09-25T02:08:10Z user=sam session=IR-S-441 action=LOGOUT result=success
2026-09-25T02:12:10Z user=lee session=IR-S-900 action=VIEW_PROFILE object=lee result=success
EOF

python3 "$SRC/generate_pcap.py" "$BASE/network/incident.pcap"

(cd "$BASE" && find identity network endpoint application -type f -print0 | sort -z | xargs -0 sha256sum > evidence-manifest.sha256)

echo "[+] Full IR case created at: $BASE"
echo "[+] Start with case-info.txt and evidence-manifest.sha256"