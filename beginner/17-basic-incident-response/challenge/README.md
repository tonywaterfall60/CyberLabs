# Challenge — Basic Incident Response

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Beginner |
| Estimated time | 35–55 minutes |
| Environment | Local synthetic evidence |
| Authorized scope | Files in this challenge directory only |
| Goal | Apply the event concepts to a small evidence-driven case |

## Scenario

You are given a fictional training case related to **Basic Incident Response**. Use only the provided evidence and document how you reached each answer.

## Authorized Scope

Only the provided challenge files and generated local workspace are authorized. Do not pivot identifiers, IP addresses, names, or examples toward real systems.

## Setup

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/incident-response
~~~

## Investigation / Tasks

### Phase 1 — Baseline

Read `timeline.txt` and identify the evidence types and important fields.

### Phase 2 — Core Analysis

1. Show that you can describe detect, triage, contain, preserve, recover, and lessons-learned phases.
2. Show that you can prioritize containment actions from evidence.
3. Show that you can distinguish containment from eradication.
4. Show that you can write a short incident summary with uncertainty.

After determining the affected user, host, and exported file, inspect `triage-note.txt` for the first flag. After distinguishing containment, preservation, eradication, and recovery, inspect hidden files for the response handoff flag.

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
