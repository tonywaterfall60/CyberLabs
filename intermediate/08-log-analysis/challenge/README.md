# Challenge — Multi-Source Authentication Incident

**Difficulty:** Intermediate  
**Estimated time:** 75–105 minutes

## Setup

~~~bash
./setup.sh
cd ~/cyberclub/log-analysis
~~~

## Evidence

~~~text
auth.log
vpn.log
app.log
host.log
~~~

## Goal

Correlate identity, VPN, application, and host events into one defensible timeline.

## Phase 1 — Schema

Identify the shared fields across logs, especially `user`, `session`, `src`, and time.

## Phase 2 — Authentication

Count failed logins by user and source. Determine whether a success follows the failures from the same source.

## Phase 3 — Session Correlation

Trace session `S-2201` across all files without manually reading every line.

## Phase 4 — Impact

Identify the highest-impact application action and any related host/file activity.

## Phase 5 — Timeline

Create:

~~~text
Timestamp | Log Source | User/Session | Event | Evidence | Interpretation
~~~

Include at least eight events.

## Phase 6 — Confidence

Separate:

~~~text
Observed
Inferred
Unknown
~~~

Answer whether the logs prove account compromise, and explain why or why not.

## Phase 7 — Missing Evidence

Request at least four additional sources and state what question each would answer.

## Deliverable

~~~text
Most targeted account:
Suspicious source:
Successful session:
VPN-assigned IP:
Sensitive action:
Related host activity:
Timeline:
Highest-priority event:
Observed:
Inferred:
Unknown:
Additional evidence:
~~~

## Cleanup

~~~bash
./reset.sh
~~~