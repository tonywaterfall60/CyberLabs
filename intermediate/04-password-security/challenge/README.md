# Challenge — Toy Password Audit

This challenge uses fictional SHA-256 hashes generated only for training.

## Authorized Scope

Use only:

```text
hashes.txt
hashes-only.txt
wordlist.txt
```

Do not use these commands against real password databases.

## Part 1 — Hash Identification

```bash
hashid hashes-only.txt
```

Answer:

1. What hash families does the tool suggest?
2. Why can multiple formats sometimes look similar?

## Part 2 — Python Audit

```bash
python3 audit.py hashes.txt wordlist.txt
```

Understand what the code is doing rather than treating it as a black box.

## Part 3 — hashcat

```bash
hashcat   --username   --potfile-disable   -m 1400   hashes.txt   wordlist.txt
```

## Tasks

1. Identify which toy passwords can be recovered from the provided wordlist.
2. Identify which account remains unmatched.
3. Explain why SHA-256 alone is a poor password-storage design.
4. Explain the purpose of salts.
5. Explain why a slow password-hashing algorithm changes offline attack cost.
6. Recommend:
   - a password-hashing approach
   - MFA
   - online rate limiting

## Deliverable

```text
Likely hash format:
Recovered training accounts:
Unmatched account:
Why SHA-256 was weak here:
Recommended password storage:
Recommended authentication controls:
```

No flag is required for this challenge.
