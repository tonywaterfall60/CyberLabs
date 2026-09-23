# Challenge — Toy Password Audit

This challenge uses fictional SHA-256 hashes generated only for training.

## Scope

Use only the provided `hashes.txt` and `wordlist.txt`.

## Run

```bash
python3 audit.py hashes.txt wordlist.txt
```

## Tasks

1. Identify which toy passwords can be recovered from the wordlist.
2. Identify which hash remains unmatched.
3. Explain why SHA-256 is a poor choice for storing passwords directly.
4. Explain the purpose of a salt.
5. Recommend:
   - a password-hashing approach
   - an MFA control
   - an online rate-limiting control

## Deliverable

```text
Recovered training accounts:
Unmatched account:
Why toy SHA-256 was weak:
Recommended password storage:
Recommended login controls:
```

No flag is required for this challenge.
