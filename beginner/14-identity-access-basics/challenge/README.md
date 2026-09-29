# Challenge — Identity & Access Basics

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Beginner |
| Estimated time | 35–55 minutes |
| Environment | Local synthetic evidence |
| Authorized scope | Files in this challenge directory only |
| Goal | Apply the event concepts to a small evidence-driven case |

## Scenario

You are given a fictional training case related to **Identity & Access Basics**. Use only the provided evidence and document how you reached each answer.

## Authorized Scope

Only the provided challenge files and generated local workspace are authorized. Do not pivot identifiers, IP addresses, names, or examples toward real systems.

## Setup

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/identity-access
~~~

## Investigation / Tasks

### Phase 1 — Baseline

Read `evidence.jsonl` and identify the evidence types and important fields.

### Phase 2 — Core Analysis

1. Show that you can distinguish identity, authentication, authorization, and accounting.
2. Show that you can explain MFA and session concepts.
3. Show that you can identify least-privilege failures in simple scenarios.
4. Show that you can recognize the difference between a stolen password and a stolen session.

After reconstructing the login/MFA timeline, inspect `timeline-note.json` for the first flag. After analyzing the cross-user object access, inspect hidden files in the workspace for the second flag.

### Phase 3 — Evidence vs. Interpretation

Create:

~~~text
Observed:
Inferred:
Unknown:
~~~

### Phase 4 — Safe Next Step

State what additional evidence or authorization would be needed before taking action beyond this lab.


## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus:

~~~text
Scope:
Question:
Evidence used:
Observations:
Interpretation:
Unknowns:
Recommended next step:
~~~

## Cleanup

~~~bash
./reset.sh
~~~
