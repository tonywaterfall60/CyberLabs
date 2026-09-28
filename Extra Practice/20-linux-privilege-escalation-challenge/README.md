# Extra Practice 20 — Linux Privilege Escalation Challenge

## Lab Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 90–120 minutes |
| Environment | Kali Linux / static evidence |
| Infrastructure | Fictional Linux privilege-audit bundle |
| Tools | grep, awk, find-style reasoning, permission analysis |

## Scenario

You are reviewing a fictional Linux server after a security assessment identified several privilege-boundary concerns. Your job is to determine which findings are merely interesting and which could allow a lower-privileged user to influence execution performed by root.

## Authorized Scope

Use only the evidence files in this directory. Do not alter your own sudoers, cron configuration, services, or system permissions.

## Setup

No live target is required.

## Investigation / Tasks

### Phase 1 — Identity and Sudo Review

Review `sudoers.txt` and determine what the training user can execute with elevated privileges.

### Phase 2 — Scheduled Execution

Review `cron.txt` and identify commands executed by root.

### Phase 3 — Writable-Path Analysis

Use `permissions.txt` to determine whether any lower-privileged user can modify a file that root later executes.

### Phase 4 — Service Review

Review `services.txt` and identify service configuration that deserves follow-up.

### Phase 5 — Credential Exposure

Review `config-backup.txt` and explain why exposed credentials are a separate issue from privilege escalation.

### Phase 6 — Rank the Paths

For each candidate path record:

~~~text
Higher-privileged execution:
Lower-privileged influence:
Evidence:
Exploit precondition:
Impact:
Confidence:
~~~

Do not execute a real privilege-escalation technique.

## Deliverable

Submit the strongest privilege-escalation path, two weaker leads, evidence supporting each, remediation, and one detection/monitoring idea.

## Cleanup

No cleanup is required for this static-data lab.
