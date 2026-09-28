# Extra Practice 35 — Purple-Team Operator Challenge

## Lab Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced Capstone |
| Estimated time | 3 hours |
| Environment | Kali Linux + Docker |
| Infrastructure | Local web/API service with structured telemetry |
| Tools | Burp/curl, jq, Python, detection reasoning |

## Scenario

Perform a short, explicitly authorized adversary-emulation sequence against a local training application, then switch perspectives and validate whether the telemetry is sufficient to detect each action.

## Authorized Scope

~~~text
http://127.0.0.1:8870
runtime/events.jsonl
~~~

Only the provided sequence is authorized. Do not broaden testing beyond the documented object IDs and routes.

## Setup

~~~bash
mkdir -p runtime
docker compose up --build -d
~~~

## Investigation / Tasks

### Phase 1 — Establish Baseline

Request object 1 as Alice using the training token.

### Phase 2 — Emulation Step

Make one cross-user request for object 2.

### Phase 3 — Privileged-Route Check

Request the admin endpoint once and record the denied result.

### Phase 4 — Blue Correlation

Find the same requests in `runtime/events.jsonl` and correlate request ID, user, route, object owner, and decision.

### Phase 5 — Detection

Write a detector for allowed cross-user object access and separately track denied admin-route attempts.

### Phase 6 — Purple Debrief

For each action record:

~~~text
Red action
Expected control
Application decision
Telemetry
Detection
Remediation
Residual visibility
~~~

## Deliverable

Submit red evidence, blue timeline, detection logic, false-positive considerations, root-cause fix, and purple-team debrief.

## Cleanup

~~~bash
docker compose down
rm -rf runtime
~~~
