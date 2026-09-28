# Extra Practice 30 — SOC Shift Challenge

## Lab Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 2–3 hours |
| Environment | Kali/Linux / static SOC evidence |
| Infrastructure | Twenty alerts plus endpoint/auth/network context |
| Tools | jq, grep, Python optional, analyst triage |

## Scenario

You are the analyst for a fictional SOC shift. Twenty alerts are waiting. Some are benign, some are duplicates, some are low-value, and a small number require escalation.

## Authorized Scope

Use only the supplied JSONL evidence. No external lookups are required.

## Setup

No service startup is required.

## Investigation / Tasks

### Phase 1 — Queue Triage

Review `alerts.jsonl`. Assign each alert:

~~~text
close-benign
close-duplicate
investigate
escalate
~~~

### Phase 2 — Evidence Correlation

Use `endpoint.jsonl`, `auth.jsonl`, and `network.jsonl` to validate the highest-priority alerts.

### Phase 3 — Timeline

Build one incident timeline from at least three telemetry sources.

### Phase 4 — False Positives

Document why at least three alerts should be closed.

### Phase 5 — Escalation Note

Write a concise handoff for the incident that needs escalation.

### Phase 6 — Shift Handoff

Summarize unresolved work, owners, and recommended next actions.

## Deliverable

Submit triage disposition for all alerts, one detailed investigation, one escalation note, false-positive rationale, and shift handoff.

## Cleanup

No cleanup is required.
