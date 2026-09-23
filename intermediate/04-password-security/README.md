# Intermediate 04 — Password Security

**Difficulty:** Intermediate  
**Estimated time:** 90 minutes  
**Prerequisites:** Beginner Cryptography + Intermediate 03  
**Environment:** Python 3 / command line

## Why This Event Exists

Passwords remain common, but secure password systems depend on much more than length alone. Members should understand password storage, salts, slow password hashing, MFA, lockout/rate limiting, and what password auditing is actually measuring.

## Learning Objectives

Members should be able to:

- explain why plaintext password storage is unsafe
- distinguish fast general-purpose hashes from password-hashing algorithms
- explain salts
- explain why MFA and rate limiting matter
- describe offline vs. online password attacks conceptually
- perform a toy offline audit against provided training data
- recommend stronger password controls

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

Examples of password-hashing algorithms:

- Argon2
- bcrypt
- scrypt
- PBKDF2

## Fast Hash vs. Password Hash

General-purpose hashes such as SHA-256 are intentionally fast.

Password hashing should intentionally require more computation.

## Online vs. Offline

**Online**
- interacts with a live authentication service
- can be rate-limited/locked out
- generates logs

**Offline**
- attacker already has password verifiers/hashes
- defensive rate limiting no longer applies
- strength of the hashing scheme matters greatly

## Guided Lab

The challenge uses deliberately weak toy SHA-256 hashes so the concept is visible.

```bash
cd challenge
python3 audit.py hashes.txt wordlist.txt
```

Do not use the script against real password databases.

## Analysis Questions

- Which training passwords were found?
- Why was the toy audit fast?
- How would Argon2 change the economics?
- What does a salt prevent?
- Why is MFA still valuable?

## Cleanup

No persistent services are started.

## Next Event

[Intermediate 05 — Linux Privilege Escalation Foundations](../05-linux-privilege-escalation/)
