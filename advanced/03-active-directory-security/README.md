# Advanced 03 — Active Directory Security

**Difficulty:** Advanced  
**Estimated time:** 120 minutes  
**Prerequisites:** Intermediate Windows privilege foundations  
**Environment:** Kali Linux; fictional exported AD dataset  
**Future range:** BloodHound, LDAP/Kerberos tooling against a club-owned domain only

## Why This Event Exists

Enterprise security is heavily influenced by identity relationships rather than isolated hosts.

Active Directory security requires thinking in graphs:

~~~text
user
  ↓
group
  ↓
nested group
  ↓
delegated right
  ↓
privileged system/account
~~~

The local version teaches that reasoning without requiring a live domain.

## Learning Objectives

Students should be able to:

- explain users, groups, nested membership, service accounts, and SPNs
- identify privileged groups
- trace nested privilege relationships
- identify delegated-management relationships
- build a plausible attack path from exported data
- distinguish observed relationships from assumptions
- recommend identity hardening
- explain how BloodHound-style graph analysis helps

## Challenge Dataset

~~~text
challenge/
├── users.csv
├── groups.csv
├── memberships.csv
├── spns.csv
├── delegation.csv
├── computers.csv
├── local-admin.csv
├── sessions.csv
└── password-policy.txt
~~~

Everything is fictional.

## Suggested Kali Tools

~~~bash
grep
awk
cut
sort
column
python3
~~~

Optional tools include csvtool and graphing utilities if already installed.

## Guided Workflow

### 1. Identify Privileged Groups

Inspect groups.csv and identify direct privilege.

### 2. Trace Membership

Inspect memberships.csv for direct and nested relationships.

### 3. Review SPNs

Identify service identities in spns.csv. An SPN is context, not proof of compromise.

### 4. Review Delegation

Inspect delegation.csv and ask which relationships cross privilege boundaries.

### 5. Add Host and Session Context

Use local-admin.csv and sessions.csv to connect identities/groups to computers.

A privileged session on a host is context. It does not by itself prove credential theft or compromise.

### 6. Review Identity Policy

Use password-policy.txt to identify policy conditions that may increase or reduce path risk.

### 7. Build a Graph

Example:

~~~text
alice
  ↓ member of
Helpdesk
  ↓ nested member of
Server Operators
  ↓ relationship
backup01
~~~

Label each edge as observed, inferred, or requires validation.

## Deliverable

~~~text
Privileged groups:
Direct privileged users:
Nested privileged users:
Service accounts:
Delegated relationships:
Attack/exposure paths:
Host/session relationships:
Policy context:
Evidence:
Observed vs inferred edges:
Validation still required:
Remediation priorities:
Detection ideas:
~~~

## Future Shared-Range Upgrade

When the club has an isolated AD lab, add BloodHound, bloodhound-python, LDAP queries, SPN review, and local-admin relationship analysis against the club-owned domain only.

## Next Event

[Advanced 04 — Malware Analysis](../04-malware-analysis/)