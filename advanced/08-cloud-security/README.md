# Advanced 08 — Cloud Security

**Difficulty:** Advanced  
**Estimated time:** 120 minutes  
**Prerequisites:** Intermediate security foundations  
**Environment:** Kali Linux, jq; fictional exported cloud configuration only

## Why This Event Exists

Cloud security often depends on configuration and identity relationships rather than a single vulnerable host. This event teaches students to review IAM, storage, and network controls without requiring real cloud credentials.

## Learning Objectives

- review IAM policy scope
- identify wildcard permissions
- inspect storage exposure
- review security-group/network rules
- identify public-access concerns
- apply least privilege
- prioritize remediation
- explain what additional cloud logs or controls would be needed

## Safety

No AWS, Azure, or GCP account is required. Do not use personal or university cloud credentials for this lab.

## Challenge Files

~~~text
challenge/iam-policy.json
challenge/bucket.json
challenge/security-groups.json
challenge/identity-map.json
challenge/audit-events.jsonl
challenge/logging.json
~~~

## Suggested Tools

~~~bash
jq
grep
python3
~~~

## Guided Workflow

~~~text
Cloud identity graph
      ↓
IAM scope
      ↓
Storage exposure
      ↓
Network exposure
      ↓
Audit evidence
      ↓
Logging/visibility gaps
      ↓
Abuse-path reasoning
      ↓
Least-privilege redesign
      ↓
Detection / remediation
~~~

Useful review commands:

~~~bash
jq . challenge/identity-map.json
jq . challenge/iam-policy.json
jq . challenge/bucket.json
jq . challenge/security-groups.json
jq . challenge/logging.json
jq . challenge/audit-events.jsonl
~~~

A wildcard is not automatically a vulnerability; evaluate API semantics, resource scope, and stated business purpose.

## Analysis Questions

- Which identity relationships expand blast radius?
- Which IAM permissions exceed the reporting role's stated purpose?
- Which wildcards are truly excessive versus context-dependent?
- Is internal-classified storage publicly readable?
- Does audit evidence show that public access was actually used?
- Was unrelated identity-management permission actually exercised?
- Which security-group rules are appropriate for service purpose?
- Which logging gaps prevent confident scoping?
- How should the IAM policy be rewritten for least privilege?
- What cloud detections would remain useful after remediation?

## Deliverable

~~~text
Finding:
Evidence:
Affected resource:
Potential impact:
Priority:
Least-privilege remediation:
Validation still needed:
~~~

## Next Event

[Advanced 09 — Container Security](../09-container-security/)