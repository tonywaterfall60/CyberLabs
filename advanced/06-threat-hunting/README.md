# Advanced 06 — Threat Hunting

**Difficulty:** Advanced  
**Estimated time:** 120 minutes  
**Prerequisites:** Intermediate Log Analysis + Advanced Network Analysis  
**Environment:** Kali Linux, jq, grep/ripgrep, Python optional

## Learning Objectives

Students should be able to:

- write a hunting hypothesis
- identify relevant data sources
- search synthetic endpoint/network events
- correlate process and network activity
- separate suspicious behavior from confirmed malicious activity
- document gaps and follow-up questions

## Hunting Workflow

```text
Hypothesis
  ↓
Required telemetry
  ↓
Query/search
  ↓
Correlate
  ↓
Validate
  ↓
Refine hypothesis
  ↓
Document findings
```

## Challenge

```bash
cd challenge
cat README.md
```

The challenge uses synthetic JSON-lines telemetry.

## Deliverable

```text
Hypothesis:
Data used:
Query/filter:
Suspicious sequence:
Evidence:
Alternative explanation:
Additional telemetry needed:
Confidence:
```

## Next Event

[Advanced 07 — Detection Engineering](../07-detection-engineering/)
