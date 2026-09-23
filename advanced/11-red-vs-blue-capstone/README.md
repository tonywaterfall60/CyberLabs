# Advanced 11 — Red vs. Blue Capstone

**Difficulty:** Advanced capstone  
**Estimated time:** 2–3 hours  
**Prerequisites:** Advanced 01–10  
**Environment:** Kali Linux, Docker, Burp/curl, jq/Python

## Purpose

This capstone connects offensive validation with defensive detection.

The same local application produces structured logs so one team can test a known authorization weakness while another team analyzes the resulting telemetry.

## Roles

### Red

- map the application
- establish normal behavior
- validate the authorization flaw
- retrieve the private runtime flag if configured
- document exact requests

### Blue

- monitor or analyze the generated log
- identify cross-user object access
- build a timeline
- propose detection logic
- recommend remediation

### Purple Debrief

Both sides compare:

- action
- observable telemetry
- detection opportunity
- prevention
- gaps

## Setup

```bash
docker compose up --build -d
```

Target:

```text
http://127.0.0.1:8600
```

Logs:

```text
runtime/app.log
```

## Private Flag

The red-team flag is injected through `RED_FLAG_VALUE` by the event lead.

No real value is stored here.

## Cleanup

```bash
docker compose down
rm -rf runtime
```
