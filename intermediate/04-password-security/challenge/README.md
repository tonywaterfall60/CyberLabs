# Challenge — Toy Password Security Assessment

**Difficulty:** Intermediate  
**Estimated time:** 75–105 minutes

## Scope

Use only the files in this challenge directory.

Do not use these techniques against real password databases, accounts, or credentials.

## Scenario

A fictional application team asks you to review its password-storage and authentication controls.

You are given:

~~~text
hashes.txt
hashes-only.txt
wordlist.txt
storage-examples.txt
auth-policy.txt
salt-demo.py
audit.py
~~~

Your task is broader than recovering toy passwords. You must assess storage design and online authentication controls.

## Part 1 — Hash Identification

~~~bash
hashid hashes-only.txt
~~~

Answer:

1. What formats are suggested?
2. Why can several algorithms share the same visual format/length?
3. Why is hash identification not proof?

## Part 2 — Understand the Audit Script

Read:

~~~bash
less audit.py
~~~

Identify:

- hashing algorithm,
- candidate source,
- comparison logic,
- why the audit is offline.

Then run:

~~~bash
python3 audit.py hashes.txt wordlist.txt
~~~

## Part 3 — hashcat Validation

Use only the provided toy hashes:

~~~bash
hashcat --username --potfile-disable -m 1400 hashes.txt wordlist.txt
~~~

Compare hashcat results with the Python script.

## Part 4 — Storage Design Review

Inspect:

~~~text
storage-examples.txt
~~~

Classify each example:

~~~text
plaintext
fast unsalted hash
salted iterative password verifier
~~~

Explain which design is strongest and why.

## Part 5 — Salt Demonstration

Run:

~~~bash
python3 salt-demo.py
~~~

Explain why the same password produces different stored values when unique salts are used.

Also explain what salts **do not** provide.

## Part 6 — Online Authentication Controls

Inspect:

~~~text
auth-policy.txt
~~~

Review:

- MFA,
- rate limiting,
- lockout behavior,
- password length,
- breached-password screening,
- logging.

Recommend at least four improvements.

## Part 7 — Online vs. Offline

Create a comparison:

| Control | Helps Online Guessing? | Helps Offline Guessing? | Why? |
|---|---|---|---|
| Rate limiting | | | |
| MFA | | | |
| Unique salt | | | |
| Argon2/bcrypt/scrypt/PBKDF2 | | | |

## Deliverable

~~~text
Likely hash format:
Recovered toy accounts:
Unmatched account:

Why SHA-256 was weak here:
Purpose of salts:
Salt limitations:
Recommended password hashing:

Online-control weaknesses:
Recommended MFA/rate-limit/logging improvements:

Python vs hashcat comparison:
Online vs offline comparison:
~~~

No flag is required.