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
~~~

## Suggested Tools

~~~bash
jq
grep
python3
~~~

## Guided Workflow

Pretty-print IAM policy:

~~~bash
jq . challenge/iam-policy.json
~~~

Search wildcard strings:

~~~bash
jq '.. | strings | select(. == "*")' challenge/iam-policy.json
~~~

Review bucket configuration:

~~~bash
jq . challenge/bucket.json
~~~

Review network rules:

~~~bash
jq . challenge/security-groups.json
~~~

## Analysis Questions

- Is the IAM action scope broader than required?
- Is the resource scope broader than required?
- Is the storage resource intended to be public?
- Which network rule has the greatest exposure?
- Which finding is configuration context-dependent?
- Which logs would confirm use or abuse?

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