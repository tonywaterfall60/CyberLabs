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

Only the provided challenge files and generated local workspace are authorized. Do not pivot identifiers, IP addresses, names, or examples toward real systems.

## Setup

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/wireless-security
~~~

## Investigation / Tasks

### Phase 1 — Baseline

Read `wireless-evidence.csv` and identify the evidence types and important fields.

### Phase 2 — Core Analysis

1. Show that you can identify SSID, BSSID, channel, and client addresses.
2. Show that you can distinguish open from protected wireless networks from provided evidence.
3. Show that you can recognize beacon and probe behavior.
4. Show that you can explain why an SSID name does not prove ownership.

After mapping the protected network, BSSID, channel, and client behavior, inspect `capture-notes.txt` and record the dashboard flag.

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

Submit the discovered flag to the CyberLabs dashboard plus:

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
