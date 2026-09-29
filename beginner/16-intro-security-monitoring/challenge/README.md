# Challenge — Intro to Security Monitoring

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Beginner |
| Estimated time | 35–55 minutes |
| Environment | Local synthetic evidence |
| Authorized scope | Files in this challenge directory only |
| Goal | Apply the event concepts to a small evidence-driven case |

## Scenario

You are given a fictional training case related to **Intro to Security Monitoring**. Use only the provided evidence and document how you reached each answer.

## Authorized Scope

Only files in this challenge directory are authorized. Do not pivot identifiers, IP addresses, names, or examples toward real systems.

## Setup

No service startup is required.

## Investigation / Tasks

### Phase 1 — Baseline

Read `evidence.txt` and identify the evidence types and important fields.

### Phase 2 — Core Analysis

1. Show that you can identify the purpose of common security telemetry.
2. Show that you can build a simple event timeline.
3. Show that you can separate a single suspicious event from a correlated sequence.
4. Show that you can describe one reasonable detection idea.

### Phase 3 — Evidence vs. Interpretation

Create:

~~~text
Observed:
Inferred:
Unknown:
~~~

### Phase 4 — Safe Next Step

State what additional evidence or authorization would be needed before taking action beyond this lab.

## Flags

This challenge contains **2 flags**.

### Flag 1 — Timeline Reconstruction

~~~bash
chmod +x check-timeline.sh
./check-timeline.sh
~~~

### Flag 2 — Detection / Correlation Reasoning

~~~bash
chmod +x check-detection.sh
./check-detection.sh
~~~

## Deliverable

Submit both flags plus:

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

No cleanup is required for this static-data challenge.
