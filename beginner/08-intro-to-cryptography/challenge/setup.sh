#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/cyberclub/crypto-challenge"
rm -rf "$BASE"
mkdir -p "$BASE"

printf 'Q3liZXJMYWJzIHNheXM6IGVuY29kaW5nIGlzIG5vdCBlbmNyeXB0aW9uLgo=' > "$BASE/message.b64"
printf 'VmVyaWZ5IHRoZSBldmlkZW5jZSBoYXNoIGJlZm9yZSB0cnVzdGluZyB0aGUgZmlsZS4K' > "$BASE/operator-note.b64"

printf 'Evidence integrity matters.\n' > "$BASE/original.txt"
cp "$BASE/original.txt" "$BASE/copy.txt"
printf 'Evidence integrity matters.\nThis file was changed.\n' > "$BASE/modified.txt"

printf 'CyberLabs evidence package\nCase: beginner-crypto\n' > "$BASE/evidence.txt"
(cd "$BASE" && sha256sum evidence.txt > known.sha256)

cat > "$BASE/concepts.txt" <<'EOF'
Base64
SHA-256
AES
RSA
EOF

ENCODING_FLAG="${BEGINNER_CRYPTO_ENCODING_FLAG:-FLAG_NOT_CONFIGURED}"
INTEGRITY_FLAG="${BEGINNER_CRYPTO_INTEGRITY_FLAG:-FLAG_NOT_CONFIGURED}"
printf '%s' "$ENCODING_FLAG" | base64 > "$BASE/flag-message.b64"
printf '%s' "$INTEGRITY_FLAG" | base64 > "$BASE/.integrity-note.b64"

echo "[+] Crypto challenge created at $BASE"
echo "[+] Start with: cd $BASE && ls -l"