# Advanced 07 — Detection Engineering

**Difficulty:** Advanced  
**Estimated time:** 120 minutes  
**Prerequisites:** Threat Hunting  
**Environment:** Kali Linux, YAML, Python, jq

## Learning Objectives

Students should be able to:

- convert a hunt finding into detection logic
- define data requirements
- write readable detection rules
- consider false positives
- define severity and triage context
- test logic against synthetic events
- distinguish detection from prevention

## Detection Design Template

```text
Behavior:
Required fields:
Selection logic:
Exclusions:
Threshold:
Severity:
False positives:
Triage steps:
Response:
```

## Challenge

Students will write two detections:

1. encoded PowerShell launched by an Office-like parent
2. repeated failed logins followed by a success from the same source

## Deliverable

- rule logic
- test results
- false-positive discussion
- recommended telemetry
- triage steps

## Next Event

[Advanced 08 — Cloud Security](../08-cloud-security/)
