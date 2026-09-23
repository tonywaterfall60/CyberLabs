import hashlib
import sys

if len(sys.argv) != 3:
    print("Usage: python3 audit.py hashes.txt wordlist.txt")
    raise SystemExit(1)

hash_file, word_file = sys.argv[1], sys.argv[2]

targets = {}
with open(hash_file, encoding="utf-8") as f:
    for line in f:
        line = line.strip()
        if not line or ":" not in line:
            continue
        user, digest = line.split(":", 1)
        targets[user] = digest.lower()

with open(word_file, encoding="utf-8") as f:
    words = [x.strip() for x in f if x.strip()]

for user, target in targets.items():
    match = None
    for word in words:
        digest = hashlib.sha256(word.encode()).hexdigest()
        if digest == target:
            match = word
            break
    if match:
        print(f"[FOUND] {user}: {match}")
    else:
        print(f"[NO MATCH] {user}")
