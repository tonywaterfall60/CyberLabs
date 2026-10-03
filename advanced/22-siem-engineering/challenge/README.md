# Challenge — Normalize and Correlate a SIEM Data Set

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 75–90 minutes |
| Environment | Kali + local JSONL/CSV telemetry |
| Authorized scope | Files in this challenge directory only |
| Goal | Normalize multiple sources and explain how schema quality affects detections |

## Scenario

A fictional SOC ingests authentication, endpoint, and proxy data from three teams. The schemas are inconsistent and one source changed field names after an upgrade.

## Authorized Scope

Use only the provided synthetic files and generated local workspace. No production SIEM is required.

## Setup

The event lead loads the private flag registry, then creates the local SIEM-engineering workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/advanced-siem
~~~

## Investigation / Tasks

### Phase 1 — Source Inventory
Document each source, timestamp format, identity field, host field, and event-type field.

### Phase 2 — Normalization
Create a common schema for timestamp, source, host, user, action, result, src_ip, dst_ip, and process where available.

After defining a common schema and mapping the auth, endpoint, and proxy sources into it, inspect `normalization-note.txt` and record the first dashboard flag.

### Phase 3 — Schema Drift
Identify the field change that would silently break a detection relying on the old schema.

### Phase 4 — Correlation
Build one cross-source timeline using normalized host/user/time fields.

After identifying the proxy field-name changes and explaining how they would silently break detections without parser/mapping updates, inspect hidden files in the workspace and record the second dashboard flag.

### Phase 5 — Engineering Decisions
Recommend parsing tests, enrichment, retention, and monitoring for ingestion failures.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus the normalized schema, one correlated timeline, the schema-drift finding, detection impact, and a SIEM engineering improvement plan.

## Cleanup

~~~bash
./reset.sh
~~~
