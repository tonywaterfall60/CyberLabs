# Extra Practice 10 — Cloud / IAM Review

**Difficulty:** Advanced  
**Estimated time:** 90–120 minutes  
**Environment:** Kali Linux  
**Tools:** jq, grep, Python optional  
**Infrastructure:** fictional exported IAM, object-storage, security-group, and audit-log configuration

## Scenario

You are reviewing a fictional cloud environment after an internal security assessment identified overly broad permissions and possible public exposure.

No cloud credentials are used. Everything is static local evidence.

## Scope

Use only files in this lab directory.

## Evidence

~~~text
iam-policy.json
bucket.json
security-groups.json
audit-events.jsonl
~~~

## Phase 1 — IAM

Inspect the IAM policy and identify wildcard actions/resources, unnecessary administrative scope, and least-privilege opportunities.

Use:

~~~bash
jq . iam-policy.json
~~~

## Phase 2 — Storage

Inspect bucket.json.

Determine whether public access controls are enabled or disabled, whether the bucket ACL permits public read, whether encryption/versioning are configured, and what data-sensitivity context would matter.

## Phase 3 — Network Rules

Inspect security-groups.json.

Evaluate public HTTPS, public SSH, and database exposure separately.

Do not treat every 0.0.0.0/0 rule as equally risky.

## Phase 4 — Audit Events

Inspect audit-events.jsonl.

Determine whether any events show use of the overly broad identity or public object access.

Separate exposure from confirmed use.

## Phase 5 — Prioritization

Create:

~~~text
Finding | Evidence | Impact | Priority | Remediation | Validation Needed
~~~

## Phase 6 — Least-Privilege Rewrite

Create iam-policy-hardened.json that narrows actions/resources for the reporting role.

## Deliverable

~~~text
IAM findings:
Storage findings:
Network findings:
Audit findings:

Highest-priority issue:
Why:

Hardened IAM policy:
Additional telemetry requested:
Residual risk:
~~~