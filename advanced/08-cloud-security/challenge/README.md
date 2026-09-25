# Challenge — Fictional Cloud Security Review

**Difficulty:** Advanced  
**Estimated time:** 90–120 minutes

## Scope

Static fictional configuration and audit data only. No real cloud account or credentials are used.

## Evidence

~~~text
iam-policy.json
bucket.json
security-groups.json
identity-map.json
audit-events.jsonl
logging.json
~~~

## Phase 1 — Architecture / Identity Model

Use `identity-map.json` to identify human, role, service identity, trust, and delegated capability relationships.

Build a small identity graph.

## Phase 2 — IAM Policy Analysis

Review action and resource scope.

Separate:

~~~text
wildcard that is expected/required by API semantics
wildcard that creates excessive privilege
permission unrelated to the identity's stated purpose
~~~

## Phase 3 — Storage Exposure

Review `bucket.json`.

Assess public access, data classification, encryption, versioning, and logging separately.

Encryption at rest does not compensate for public authorization.

## Phase 4 — Network Exposure

Review each security-group rule in context.

Do not rank public HTTPS and public SSH as equivalent solely because both use `0.0.0.0/0`.

## Phase 5 — Audit Evidence

Use `audit-events.jsonl` to determine:

- whether public object exposure was actually exercised,
- whether broad IAM permissions were actually used,
- which principal performed each action.

Distinguish **configuration exposure** from **observed use**.

## Phase 6 — Logging / Visibility Gaps

Review `logging.json`.

For each missing telemetry source state which incident question it prevents you from answering.

## Phase 7 — Attack/Abuse Path Reasoning

Build at least two cloud identity/configuration paths.

Example format:

~~~text
reporting-app
  ↓ assumes
reporting-role
  ↓ broad IAM capability
training-service access key
  ↓
persistent service credential risk
~~~

Label every edge as observed or inferred.

## Phase 8 — Least-Privilege Redesign

Create:

~~~text
iam-policy-hardened.json
~~~

Narrow the reporting role to the resources/actions required for reporting.

Remove unrelated identity-administration capability.

## Phase 9 — Prioritization

Rank the top findings using evidence, impact, blast radius, and actual observed use.

## Deliverable

~~~text
Identity graph:
IAM findings:
Storage findings:
Network findings:
Audit findings:
Logging gaps:

Cloud path 1:
Cloud path 2:

Highest-priority issue:
Why:

Hardened IAM policy:
Preventative controls:
Detection/monitoring:
Validation still needed:
Residual risk:
~~~

## Rule

Do not use real AWS, Azure, or GCP credentials for this event.