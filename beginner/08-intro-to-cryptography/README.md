# Beginner 08 — Intro to Cryptography

**Time:** 75–90 minutes  
**Prerequisites:** Beginner 02–04  
**Environment:** Linux, macOS, or Windows with common command-line tools

## Learning Objectives

Members should be able to:

- distinguish encoding, hashing, and encryption
- explain why passwords should be hashed instead of stored in plaintext
- recognize common hash output
- understand symmetric vs. asymmetric encryption at a conceptual level

## Key Concepts

### Encoding

Encoding changes representation. It is not intended to provide secrecy.

Example: Base64.

### Hashing

Hashing produces a fixed-length digest and is designed to be one-way.

### Encryption

Encryption protects confidentiality and is reversible with the correct key.

## Lab

### Task 1 — Base64

Linux/macOS:

```bash
echo -n "cyberclub" | base64
```

Decode:

```bash
echo "Y3liZXJjbHVi" | base64 -d
```

Discuss why this is not encryption.

### Task 2 — Hashing

```bash
echo -n "cyberclub" | sha256sum
echo -n "CyberClub" | sha256sum
```

Compare the two hashes.

### Task 3 — File Integrity

```bash
echo "original notes" > notes.txt
sha256sum notes.txt
echo "modified" >> notes.txt
sha256sum notes.txt
```

Explain why the hash changed.

## Challenge

Classify each as **encoding**, **hashing**, or **encryption**:

1. Base64
2. SHA-256
3. AES
4. RSA

## Reflection

Why is hashing useful for integrity checking?

## Cleanup

```bash
rm -f notes.txt
```
