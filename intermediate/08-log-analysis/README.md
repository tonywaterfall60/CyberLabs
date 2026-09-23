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
3. Which user/host was involved?
4. What source initiated it?
5. Was it successful?
6. What happened immediately before and after?
7. What evidence is missing?

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
Successful activity:
Timeline:
Evidence:
Recommended next steps:
```

## Cleanup

```bash
./reset.sh
```

## Next Event

[Intermediate 09 — OSINT Workshop](../09-osint-workshop/)
