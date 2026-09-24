# Advanced 11 — Red vs. Blue Capstone

**Difficulty:** Advanced capstone  
**Estimated time:** 2–3 hours  
**Prerequisites:** Advanced 01–10  
**Environment:** Kali Linux, Docker, Burp/curl, jq/Python

## Purpose

This capstone connects offensive validation with defensive detection. The same local application produces structured logs so one team can validate a known authorization weakness while another team analyzes the resulting telemetry.

## Learning Objectives

- establish a normal application baseline
- validate a controlled authorization flaw
- capture exact offensive evidence
- identify the corresponding defensive telemetry
- write detection logic
- recommend a precise server-side fix
- conduct a purple-team debrief

## Roles

### Red

- map the application
- establish normal behavior
- validate cross-user object access
- retrieve the instructor-injected flag if configured
- document exact requests and responses

### Blue

- monitor or analyze the generated JSON log
- identify cross-user object access
- build a timeline
- propose detection logic
- recommend response and remediation

### Purple Debrief

Compare:

~~~text
action
  ↓
application decision
  ↓
telemetry
  ↓
detection
  ↓
prevention
~~~

## Setup

~~~bash
docker compose up --build -d
~~~

Target:

~~~text
http://127.0.0.1:8600
~~~

Logs:

~~~text
runtime/app.log
~~~

## Flag Privacy

The public repository contains no filled-in flag. The event lead injects `RED_FLAG_VALUE` at runtime from the private instructor repository.

## Suggested Blue Tools

~~~bash
tail -f runtime/app.log
jq . runtime/app.log
grep cross_user runtime/app.log
~~~

## Deliverables

### Red report

~~~text
Baseline:
Modified request:
Observed authorization failure:
Evidence:
Impact:
~~~

### Blue report

~~~text
Suspicious event:
Timeline:
Detection logic:
Triage context:
Remediation:
~~~

## Cleanup

~~~bash
docker compose down
rm -rf runtime
~~~