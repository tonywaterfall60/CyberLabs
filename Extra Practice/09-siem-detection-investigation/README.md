# Extra Practice 09 — SIEM / Detection Investigation

**Difficulty:** Advanced  
**Estimated time:** 90–120 minutes  
**Environment:** Kali Linux  
**Tools:** jq, grep, Python 3  
**Infrastructure:** synthetic normalized JSONL security events + starter detection engine

## Scenario

You are working a SOC queue after two alerts fired during the same shift.

One alert concerns suspicious process execution. The other concerns repeated authentication failures followed by success.

Your job is to determine whether the detections are useful, what evidence supports them, which false positives are plausible, and how you would tune or triage the rules.

## Scope

Use only the generated files under:

~~~text
~/cyberclub/extra-practice/siem-investigation
~~~

## Data Model

All telemetry uses one-event-per-line JSON.

Main files:

~~~text
process-events.jsonl
auth-events.jsonl
network-events.jsonl
detections.py
~~~

## Setup

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/extra-practice/siem-investigation
~~~

## Phase 1 — Learn the Schema

Use jq to inspect sample records.

Identify which fields are available for:

- timestamp
- host
- user
- process
- parent process
- command line
- source IP
- result
- destination IP/port

## Phase 2 — Process Detection

Investigate a process chain involving an Office-like parent and PowerShell.

Determine:

- parent process
- child process
- user
- host
- command line
- related network activity

Do not treat PowerShell itself as malicious.

## Phase 3 — Authentication Detection

Determine whether the same user/source produced multiple failures followed by success.

Record the time window and any later activity.

## Phase 4 — Correlation

Correlate process, authentication, and network evidence by host/user/time.

Build a timeline with at least six events.

## Phase 5 — Starter Detection Engine

Complete detections.py so it emits alerts for:

1. Office-like parent → PowerShell with encoded-command behavior
2. same user/source with at least 3 failures followed by success within 2 minutes

Do not hard-code one username or host.

## Phase 6 — Tuning

For each detection document:

~~~text
Required fields:
Selection logic:
Threshold/window:
Potential false positives:
Tuning ideas:
Triage steps:
Severity rationale:
~~~

## Deliverable

~~~text
Process finding:
Authentication finding:
Correlated timeline:

Detection 1 logic:
False positives:
Triage:

Detection 2 logic:
False positives:
Triage:

Recommended tuning:
Confidence:
~~~

## Cleanup

~~~bash
./reset.sh
~~~