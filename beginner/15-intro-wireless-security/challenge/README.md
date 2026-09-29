# Challenge — Intro to Wireless Security

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Beginner |
| Estimated time | 35–55 minutes |
| Environment | Local synthetic evidence |
| Authorized scope | Files in this challenge directory only |
| Goal | Apply the event concepts to a small evidence-driven case |

## Scenario

You are given a fictional training case related to **Intro to Wireless Security**. Use only the provided evidence and document how you reached each answer.

## Authorized Scope

Only files in this challenge directory are authorized. Do not pivot identifiers, IP addresses, names, or examples toward real systems.

## Setup

No service startup is required.

## Investigation / Tasks

### Phase 1 — Baseline

Read `evidence.txt` and identify the evidence types and important fields.

### Phase 2 — Core Analysis

1. Show that you can identify SSID, BSSID, channel, and client addresses.
2. Show that you can distinguish open from protected wireless networks from provided evidence.
3. Show that you can recognize beacon and probe behavior.
4. Show that you can explain why an SSID name does not prove ownership.

### Phase 3 — Evidence vs. Interpretation

Create:

~~~text
Observed:
Inferred:
Unknown:
~~~

### Phase 4 — Safe Next Step

State what additional evidence or authorization would be needed before taking action beyond this lab.

## Flag

After completing the wireless evidence analysis, run:

~~~bash
chmod +x check-wireless.sh
./check-wireless.sh
~~~

**Flag count:** 1

## Deliverable

Submit the flag plus:

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
