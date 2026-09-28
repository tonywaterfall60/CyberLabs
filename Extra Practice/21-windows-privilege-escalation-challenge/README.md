# Extra Practice 21 — Windows Privilege Escalation Challenge

## Lab Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 90–120 minutes |
| Environment | Kali/Linux or Windows / static evidence |
| Infrastructure | Fictional Windows privilege-audit exports |
| Tools | text analysis, ACL/service/task reasoning |

## Scenario

A fictional Windows workstation has several administrative services and scheduled tasks. Determine which configuration creates the strongest privilege boundary failure.

## Authorized Scope

Use only the exported evidence in this directory. Do not modify a real Windows host.

## Setup

No live Windows system is required.

## Investigation / Tasks

### Phase 1 — User Privileges

Review `whoami-priv.txt`.

### Phase 2 — Services

Review `services.txt` and `service-acls.txt`. Identify services running with high privilege whose executable or configuration is modifiable by a normal user.

### Phase 3 — Scheduled Tasks

Review `scheduled-tasks.txt` and `file-acls.txt`.

### Phase 4 — Registry / Startup

Review `registry-startup.txt` for weak startup locations.

### Phase 5 — Evidence Ranking

Classify each lead as:

~~~text
informational
requires validation
credible privilege path
highest-priority privilege path
~~~

### Phase 6 — Mitigation

Recommend a specific ACL/service/task fix and explain what telemetry could detect abuse.

## Deliverable

Submit the strongest path, required preconditions, supporting ACL evidence, two decoys/leads that are weaker, remediation, and detection ideas.

## Cleanup

No cleanup is required.
