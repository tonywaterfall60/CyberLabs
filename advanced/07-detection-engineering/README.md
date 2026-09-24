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
Required fields:
Selection logic:
Exclusions:
Threshold/window:
Severity:
False positives:
Triage steps:
Response:
~~~

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
~~~

Students may test logic with jq, Python, or shell tools.

## Deliverable

- rule logic
- data requirements
- test results
- threshold/window rationale
- false-positive discussion
- severity justification
- recommended telemetry
- analyst triage steps

## Next Event

[Advanced 08 — Cloud Security](../08-cloud-security/)