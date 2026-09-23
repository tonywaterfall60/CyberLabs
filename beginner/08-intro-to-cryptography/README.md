# Beginner 08 — Intro to Cryptography

**Difficulty:** Beginner  
**Estimated time:** 75–90 minutes  
**Prerequisites:** Beginner 02–04  
**Environment:** Command line

## Why This Event Exists

Cybersecurity frequently uses terms such as encoding, hashing, encryption, keys, signatures, and certificates. Members need to understand which tools protect confidentiality, which verify integrity, and which simply change representation.

## Learning Objectives

Members should be able to:

- distinguish encoding, hashing, and encryption
- explain one-way hashing
- explain symmetric vs. asymmetric encryption
- calculate SHA-256 hashes
- explain why secure password storage uses specialized password hashing
- identify when Base64 is being mistaken for encryption

## Encoding

Encoding changes representation.

Example:

```bash
echo -n "cyberclub" | base64
```

Base64 is reversible without a secret key.

## Hashing

Hash functions produce a fixed-length digest.

```bash
echo -n "cyberclub" | sha256sum
```

Important properties conceptually:

- deterministic
- one-way
- small input changes cause very different output
- useful for integrity verification

## Encryption

Encryption protects confidentiality.

### Symmetric

Same secret key is used to encrypt and decrypt.

Example concept:

```text
AES
```

### Asymmetric

Uses a public/private key pair.

Example concept:

```text
RSA
```

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

### File Integrity

```bash
echo "original" > file.txt
sha256sum file.txt
echo "change" >> file.txt
sha256sum file.txt
```

## Password Storage Discussion

Secure applications should not store plaintext passwords.

Explain at a conceptual level:

```text
password
  ↓
salt + password-hashing algorithm
  ↓
stored verifier
```

Examples of password-hashing approaches include Argon2, bcrypt, and scrypt.

## Challenge

```bash
cd challenge
./setup.sh
cat README.md
```

The challenge combines Base64 identification, integrity verification, and hash comparison.

## Cleanup

```bash
./reset.sh
```

## Next Event

[Beginner 09 — Intro to Digital Forensics](../09-intro-to-digital-forensics/)
