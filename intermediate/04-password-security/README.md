# Intermediate 04 — Password Security

**Difficulty:** Intermediate  
**Estimated time:** 90 minutes  
**Prerequisites:** Beginner Cryptography + Intermediate 03  
**Environment:** Kali Linux, Python 3, hashid, hashcat; optional John the Ripper

## Why This Event Exists

Passwords remain common, but secure password systems depend on much more than length alone. Members should understand password storage, salts, slow password hashing, MFA, lockout/rate limiting, and what password auditing is actually measuring.

The challenge uses deliberately weak **training-only** hashes so members can safely use common Kali password-auditing tools.

## Learning Objectives

Members should be able to:

- explain why plaintext password storage is unsafe
- distinguish general-purpose hashes from password-hashing algorithms
- explain salts
- identify a likely hash format
- perform a scoped offline audit against provided toy hashes
- compare a custom Python audit with hashcat
- explain why MFA and rate limiting matter
- recommend stronger password controls

## Kali Tools Used

| Tool | Purpose |
|---|---|
| hashid | identify likely hash formats |
| hashcat | audit challenge-provided toy hashes |
| John the Ripper | optional alternative auditing workflow |
| Python | understand the logic behind a simple wordlist audit |

## Password Storage Model

```text
Password
  +
Unique salt
  ↓
Password-hashing algorithm
  ↓
Stored verifier
```

Examples:

- Argon2
- bcrypt
- scrypt
- PBKDF2

## General-Purpose Hash vs. Password Hash

General-purpose hashes such as SHA-256 are intentionally fast.

Password hashing should intentionally require more computation and should include unique salts.

## Online vs. Offline

### Online

- interacts with a live authentication service
- can be rate-limited
- may trigger lockout
- generates authentication logs

### Offline

- operates on already-obtained password verifiers
- online rate limits no longer help
- password-hashing cost becomes especially important

## Guided Lab

Enter:

```bash
cd challenge
```

### Step 1 — Identify the Hash Format

Extract or copy one training hash and run:

```bash
hashid
```

or:

```bash
hashid hashes-only.txt
```

Discuss why hash identification is not always definitive.

### Step 2 — Python Audit

```bash
python3 audit.py hashes.txt wordlist.txt
```

Review the code so members understand the process.

### Step 3 — hashcat

Use only the provided training hashes:

```bash
hashcat   --username   --potfile-disable   -m 1400   hashes.txt   wordlist.txt
```

Then show recovered results in the same run/output workflow.

The challenge data is intentionally small.

### Optional — John the Ripper

Use John only against the provided toy dataset as an alternate demonstration.

## Analysis Questions

- Why was SHA-256 fast to audit?
- What does a unique salt change?
- Why would Argon2 be more resistant to offline guessing?
- Why is MFA still valuable?
- What does rate limiting protect against?
- Why should password auditing require authorization?

## Scope

Do not use these techniques against real password dumps, accounts, or credentials for club exercises.

## Next Event

[Intermediate 05 — Linux Privilege Escalation Foundations](../05-linux-privilege-escalation/)
