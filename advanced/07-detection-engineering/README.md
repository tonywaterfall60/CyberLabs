# Advanced 07 — Detection Engineering

**Difficulty:** Advanced  
**Estimated time:** 120 minutes  
**Prerequisites:** Threat Hunting  
**Environment:** Kali Linux, YAML, jq, Python

## Why This Event Exists

Threat hunting asks a question manually. Detection engineering turns useful behavior into repeatable logic that can alert analysts at scale.

## Learning Objectives

- convert a hunt finding into detection logic
- define required fields and telemetry
- write readable selection logic
- define thresholds and windows
- consider false positives
- assign defensible severity
- test rules against synthetic events
- write triage guidance

## Detection Design Template

~~~text
Behavior:
Threat/use case:
Required telemetry:
Required fields:
Selection logic:
Correlation key:
Threshold/window:
Positive test cases:
Negative test cases:
Known false positives:
Exclusions:
Coverage gaps:
Severity:
Triage steps:
Response:
Regression tests:
~~~

At Advanced level, detections should be treated like maintained code rather than one-off queries.

## Detection 1

Detect an Office-like process launching PowerShell with encoded-command behavior.

Useful questions: Which process fields are required? How specific should the parent relationship be? What legitimate automation could match?

## Detection 2

Detect repeated authentication failures from the same source/user followed by a success inside a short window.

Useful questions: How many failures? What time window? What if many users share one NAT address?

## Challenge

Files:

~~~text
challenge/process_events.jsonl
challenge/auth_events.jsonl
challenge/starter-rule.yml
challenge/test_detections.py
~~~

The expanded dataset contains both positive and negative/edge cases.

Students must build a regression matrix, test expected alerts and non-alerts, document threshold semantics, and explain how schema changes or tuning could break coverage.

## Deliverable

- rule logic
- telemetry/data requirements
- correlation keys
- positive/negative test cases
- regression matrix
- test output
- threshold/window rationale
- false-positive discussion
- coverage/evasion gaps
- severity justification
- analyst triage steps
- detection maintenance/version-control guidance

## Next Event

[Advanced 08 — Cloud Security](../08-cloud-security/)