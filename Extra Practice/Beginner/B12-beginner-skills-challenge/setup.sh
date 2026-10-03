#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/extra-beginner-b12"
rm -rf "$BASE"
mkdir -p "$BASE/evidence" "$BASE/web"

cat > "$BASE/evidence/auth.log" <<'EOF'
FAIL user=casey src=10.20.30.40
FAIL user=casey src=10.20.30.40
SUCCESS user=casey src=10.20.30.40 session=B12-S1
EOF

printf 'Beginner skills challenge\n' > "$BASE/evidence/message.txt"
sha256sum "$BASE/evidence/message.txt" > "$BASE/evidence/message.sha256"
printf '%s' "${BEGINNER_EXTRA_B12_FLAG:-FLAG_NOT_CONFIGURED}" | base64 > "$BASE/evidence/final.b64"

cat > "$BASE/web/index.html" <<'EOF'
<h1>Beginner Skills Challenge</h1>
<p>service=training-web</p>
<p>status=online</p>
EOF

echo "[+] B12 challenge created at $BASE"
echo "[+] Optional local service: python3 -m http.server 8600 --bind 127.0.0.1 --directory $BASE/web"
