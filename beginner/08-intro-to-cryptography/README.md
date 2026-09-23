# Beginner 08 — Intro to Cryptography

**Difficulty:** Beginner  
**Estimated time:** 75–90 minutes  
**Prerequisites:** Beginner 02–04  
**Environment:** Kali Linux command line

## Why This Event Exists

Cybersecurity frequently uses encoding, hashing, encryption, keys, signatures, and certificates. Members need to understand what each concept does before using password-auditing tools later.

## Learning Objectives

Members should be able to:

- distinguish encoding, hashing, and encryption
- explain one-way hashing
- explain symmetric vs. asymmetric encryption
- calculate SHA-256 hashes
- use `hashid` to examine a hash
- explain why hash identification can be uncertain
- explain why secure password storage uses specialized password hashing
- identify when Base64 is being mistaken for encryption

## Kali Tools Introduced

| Tool | Purpose |
|---|---|
| base64 | encode/decode Base64 |
| sha256sum | calculate SHA-256 |
| hashid | identify possible hash formats |

## Guided Lab

### Base64

```bash
echo -n "cyberclub" | base64
echo "Y3liZXJjbHVi" | base64 -d
```

### Hash Comparison

```bash
echo -n "cyberclub" | sha256sum
echo -n "CyberClub" | sha256sum
```

### Identify a Hash

```bash
echo -n "cyberclub" | sha256sum | awk '{print $1}' > sample.hash
hashid sample.hash
```

Discuss:

- hash length
- likely formats
- why detection may return several possibilities
- why this does not reveal the original input

### File Integrity

```bash
echo "original" > file.txt
sha256sum file.txt
echo "change" >> file.txt
sha256sum file.txt
```

## Password Storage Preview

```text
password
  +
salt
  ↓
password-hashing algorithm
  ↓
stored verifier
```

Examples include Argon2, bcrypt, and scrypt.

Do not perform password cracking in this Beginner event. Intermediate Password Security introduces scoped toy audits.

## Challenge

```bash
cd challenge
./setup.sh
cat README.md
```

Use `base64`, `sha256sum`, and optionally `hashid`.

## Cleanup

```bash
./reset.sh
rm -f sample.hash file.txt
```

## Next Event

[Beginner 09 — Intro to Digital Forensics](../09-intro-to-digital-forensics/)
