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

## Beginner Crypto Decision Model

Before choosing a tool, ask what the goal is:

~~~text
Need to represent data differently?
→ Encoding

Need to detect whether data changed?
→ Hashing

Need confidentiality with a shared secret?
→ Symmetric encryption

Need public/private-key functionality?
→ Asymmetric cryptography
~~~

This prevents the common mistake of treating Base64, hashes, and encryption as interchangeable.

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

~~~bash
echo "original" > file.txt
sha256sum file.txt
echo "change" >> file.txt
sha256sum file.txt
~~~

Then compare two files directly:

~~~bash
cp file.txt copy.txt
sha256sum file.txt copy.txt
~~~

Matching hashes are evidence that the file contents are identical for this exercise.

### Verify a Provided Checksum

A common real workflow is:

~~~text
publisher provides checksum
        ↓
you download/receive file
        ↓
you calculate checksum
        ↓
compare
~~~

The challenge includes this exact pattern.

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

~~~bash
cd challenge
./setup.sh
cat README.md
~~~

The expanded evidence package includes:

~~~text
message.b64
operator-note.b64
original.txt
copy.txt
modified.txt
evidence.txt
known.sha256
concepts.txt
~~~

Students decode multiple Base64 messages, compare file integrity, verify a known SHA-256 digest, use hashid appropriately, modify a file and observe the digest change, and classify Base64/SHA-256/AES/RSA.

## Cleanup

```bash
./reset.sh
rm -f sample.hash file.txt
```

## Next Event

[Beginner 09 — Intro to Digital Forensics](../09-intro-to-digital-forensics/)
