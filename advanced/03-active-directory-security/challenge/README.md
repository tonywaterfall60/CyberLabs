# Challenge — Fictional AD Attack-Path Analysis

**Difficulty:** Advanced  
**Estimated time:** 90–120 minutes

Everything in this folder is fictional exported directory/security data.

## Evidence

~~~text
users.csv
groups.csv
memberships.csv
spns.csv
delegation.csv
computers.csv
local-admin.csv
sessions.csv
password-policy.txt
~~~

## Goal

Build a defensible identity/privilege graph, identify multiple paths to privileged systems or accounts, and distinguish observed relationships from assumptions.

## Phase 1 — Inventory

Identify:

- enabled human users,
- service accounts,
- privileged groups,
- server/workstation roles,
- service accounts with SPNs.

## Phase 2 — Membership Graph

Trace direct and nested group membership.

Do not stop at direct membership.

## Phase 3 — Host Relationships

Use `local-admin.csv` and `sessions.csv` to connect principals to computers.

Ask:

~~~text
Who can administer which host?
Which privileged users have sessions on those hosts?
Which relationships could create credential/administrative exposure?
~~~

Do not claim credential theft from session presence alone.

## Phase 4 — Delegated Rights

Review `delegation.csv`.

For every delegated right ask exactly what the relationship claims and what would still require live validation.

## Phase 5 — Service Accounts

Review SPNs and service-account privilege.

An SPN is context, not proof of compromise or weakness.

## Phase 6 — Build Attack/Exposure Paths

Build at least three graph paths.

For each edge label:

~~~text
Observed
Inferred
Requires validation
~~~

Example format:

~~~text
alice
  ↓ member of [Observed]
Helpdesk
  ↓ nested into [Observed]
Server Operators
  ↓ LocalAdmin [Observed]
backup01
  ↓ privileged session present [Observed]
carol / Domain Admin
  ↓ risk implication [Inferred]
credential/administrative exposure
~~~

## Phase 7 — Password / Identity Policy Context

Review `password-policy.txt`.

Explain how identity policy affects attack-path risk without claiming the policy itself proves compromise.

## Phase 8 — Prioritization

Rank the top three identity relationships to remediate.

Use:

- privilege gained,
- number of principals affected,
- host sensitivity,
- service-account exposure,
- path length,
- evidence quality.

## Phase 9 — Defensive Controls

For each top path provide:

~~~text
Preventative remediation
Monitoring/detection
Validation needed
Residual risk
~~~

## Deliverable

~~~text
Privileged groups:
Direct privileged users:
Nested privileged users:
Service accounts/SPNs:
Sensitive hosts:

Path 1:
Path 2:
Path 3:

Observed edges:
Inferred edges:
Validation required:

Top remediation priorities:
Detection ideas:
Policy observations:
~~~

## Rule

Do not use this dataset to pivot toward real university identities or infrastructure.