# Extra Practice 25 — Credential Attack Lab

## Lab Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate → Advanced |
| Estimated time | 90–120 minutes |
| Environment | Kali Linux / local synthetic data |
| Infrastructure | Toy hashes, fictional accounts, and bounded local authentication simulator |
| Tools | hashid, hashcat/John where appropriate, Python, curl |

## Scenario

A fictional organization asks you to evaluate password hygiene and authentication controls using a tiny synthetic account set.

## Authorized Scope

Use only the supplied hashes, account list, wordlist, and optional localhost simulator. Do not test real accounts, university services, or reused credentials.

## Setup

~~~bash
python3 auth_simulator.py
~~~

The simulator listens only on:

~~~text
127.0.0.1:8800
~~~

## Investigation / Tasks

### Phase 1 — Offline Storage Review

Classify the supplied hash formats and identify which storage examples are weak or strong.

### Phase 2 — Bounded Offline Audit

Use only `training-wordlist.txt` against the supplied toy hashes. Do not add larger external dictionaries.

### Phase 3 — Online-Control Review

Use no more than the provided five test credentials against the simulator and record rate-limit/lockout behavior.

### Phase 4 — Password Spray Reasoning

Explain why one password across many accounts differs from many passwords against one account. Do not automate a real spray.

### Phase 5 — MFA / Lockout / Detection

Recommend controls and detection logic for repeated failures, distributed failures, and success-after-failure sequences.

## Deliverable

Submit storage findings, bounded audit results, simulator behavior, control gaps, detection ideas, and remediation.

## Cleanup

Stop the local simulator with Ctrl+C.
