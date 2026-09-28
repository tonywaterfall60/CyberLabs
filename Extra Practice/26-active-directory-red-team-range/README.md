# Extra Practice 26 — Active Directory Red-Team Range

## Lab Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 2–3 hours |
| Environment | Kali/Linux / fictional AD exports |
| Infrastructure | Multi-table identity, group, host, service, session, and delegation dataset |
| Tools | Python, CSV analysis, graphing; BloodHound-style reasoning |

## Scenario

You have been given an exported snapshot of a fictional Windows domain. Your job is to identify realistic attack paths without interacting with a live domain.

## Authorized Scope

Use only the CSV files in this directory. All users, hosts, SPNs, and relationships are fictional.

## Setup

No live domain is required.

## Investigation / Tasks

### Phase 1 — Inventory

Identify human users, service accounts, privileged groups, servers, and workstations.

### Phase 2 — Relationship Graph

Build edges from group membership, local admin, service ownership, sessions, and delegation.

### Phase 3 — Starting Principals

Evaluate paths beginning from `alex` and `jamie`.

### Phase 4 — Service Accounts

Identify SPN-bearing identities and explain what additional evidence would be required before claiming credential compromise.

### Phase 5 — Privileged Sessions

Determine where privileged users have active sessions and why that changes host sensitivity.

### Phase 6 — Path Validation

Produce at least three paths labeled:

~~~text
Observed edge
Inferred edge
Requires validation
~~~

### Phase 7 — Hardening / Monitoring

Recommend tiering, group cleanup, service-account controls, local-admin reduction, and privileged-session monitoring.

## Deliverable

Submit a graph, three candidate paths, strongest path, required validation, remediation, and detection ideas.

## Cleanup

No cleanup is required.
