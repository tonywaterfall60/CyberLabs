# Intermediate 08 — Log Analysis

**Difficulty:** Intermediate  
**Estimated time:** 90 minutes  
**Prerequisites:** Command Line Workshop + Intermediate 07  
**Environment:** Linux/WSL

## Learning Objectives

Members should be able to:

- normalize events from multiple logs
- search and count suspicious activity
- correlate authentication and application events
- build a timeline
- identify indicators worth escalating
- explain limitations of log evidence

## Core Questions

When analyzing logs ask:

1. What happened?
2. When did it happen?
3. Which user, host, source, or session was involved?
4. Which fields let me correlate separate log sources?
5. Was the action successful?
6. What happened immediately before and after?
7. Which action had the highest impact?
8. Which conclusions are direct evidence versus interpretation?
9. What evidence is missing?

A strong Intermediate workflow is:

```text
Understand each schema
      ↓
Find a suspicious event
      ↓
Choose a correlation key
      ↓
Trace the same identity/session across sources
      ↓
Build a timeline
      ↓
Assess impact
      ↓
State confidence and evidence gaps
```

## Challenge

```bash
cd challenge
./setup.sh
cat README.md
```

## Deliverable

Create an incident summary:

```text
Initial suspicious event:
Affected account:
Source IP:
Successful session:
VPN-assigned address:
Sensitive application activity:
Related host activity:
Timeline:
Highest-priority event:

Observed:
Inferred:
Unknown:

Additional evidence requested:
Recommended next steps:
Confidence:
```

The challenge now correlates four sources:

```text
auth.log
vpn.log
app.log
host.log
```

using shared user/session/time fields.

## Cleanup

```bash
./reset.sh
```

## Next Event

[Intermediate 09 — OSINT Workshop](../09-osint-workshop/)
