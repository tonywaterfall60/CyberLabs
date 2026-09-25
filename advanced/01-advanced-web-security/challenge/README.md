# Challenge — Object Authorization Review

**Difficulty:** Advanced  
**Estimated time:** 90–120 minutes

## Scenario

You are reviewing a local reports portal with two training users: alice and bob.

The application authenticates users correctly, but object-level authorization must be validated.

## Scope

~~~text
http://127.0.0.1:8500
runtime/access.jsonl
~~~

## Start

~~~bash
mkdir -p runtime
chmod 777 runtime
docker compose up --build -d
~~~

## Phase 1 — Threat Model

Before testing, write:

~~~text
Protected resource:
Actors:
Expected owner relationship:
Trust boundary:
Expected secure decision:
Evidence that would prove failure:
~~~

## Phase 2 — Establish Baselines

Login as Alice and capture her normal report request in Burp. Repeat with Bob.

Record user, normal object ID, expected owner, request, response, status, and request ID.

## Phase 3 — Controlled Authorization Test

Send Alice's normal request to Repeater. Change only the report object ID to Bob's known report ID and send once.

Repeat in the opposite direction. Do not enumerate arbitrary ID ranges.

## Phase 4 — Correlate Application Telemetry

Inspect:

~~~bash
jq . runtime/access.jsonl
~~~

Locate the cross-user request and correlate:

~~~text
user
report_id
owner
cross_user
result
request_id
timestamp
~~~

Compare the API response X-Request-ID header with the log entry.

## Phase 5 — Root Cause

Explain the difference between authentication, resource lookup, ownership check, and authorization enforcement.

Identify the missing server-side decision.

## Phase 6 — Remediation Design

Write pseudocode for a fixed authorization decision.

Explain where the check should live and why hiding links or randomizing IDs would not fix the root cause.

## Phase 7 — Detection Design

Design one alert using the structured logs.

Required fields:

~~~text
event
user
report_id
owner
cross_user
result
request_id
~~~

Discuss legitimate administrative/delegated access as a possible real-world false positive.

## Deliverable

~~~text
Threat model:
Baseline Alice:
Baseline Bob:

Modified request:
Observed response:
Correlated log event:

Finding title:
Root cause:
Impact:
Evidence:
Confidence:

Server-side remediation:
Detection logic:
False positives:
Residual risk:
~~~

## Private Flag

If configured by the event lead, successful cross-user access includes the private event flag. The real value is not stored here.

## Cleanup

~~~bash
docker compose down
rm -rf runtime
~~~