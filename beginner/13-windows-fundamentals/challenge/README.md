# Challenge — Windows Fundamentals for Cybersecurity

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Beginner |
| Estimated time | 35–55 minutes |
| Environment | Local synthetic evidence |
| Authorized scope | Files in this challenge directory only |
| Goal | Apply the event concepts to a small evidence-driven case |

## Scenario

You are given a fictional training case related to **Windows Fundamentals for Cybersecurity**. Use only the provided evidence and document how you reached each answer.

## Authorized Scope

Only the provided challenge files and generated local workspace are authorized. Do not pivot identifiers, IP addresses, names, or examples toward real systems.

## Setup

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/windows-fundamentals
~~~

## Investigation / Tasks

### Phase 1 — Baseline

Read the generated `evidence.txt` and identify the evidence types and important fields.

### Phase 2 — Core Analysis

1. Show that you can identify users, processes, services, connections, and scheduled tasks from provided Windows-style output.
2. Show that you can explain the difference between a process and a service.
3. Show that you can recognize common Windows paths and security contexts.
4. Show that you can use PowerShell-style output as evidence.

After identifying the process chain, inspect `process-context.txt` and record the first flag. After analyzing the scheduled task and security context, inspect hidden files in the workspace and record the second flag.

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
