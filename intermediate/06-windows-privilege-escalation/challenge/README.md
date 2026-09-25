# Challenge — Windows Privilege Audit

**Difficulty:** Intermediate  
**Estimated time:** 75–105 minutes

## Scenario

You are reviewing exported configuration evidence from a fictional Windows workstation. No live Windows host is required.

## Evidence Files

- `whoami_priv.txt`
- `services.txt`
- `scheduled_tasks.txt`
- `permissions.txt`
- `config.txt`

## Analysis Method

For each lead ask:

~~~text
What privilege does this represent?
Does the current user actually control anything important?
What runs as Administrator or SYSTEM?
Which file/service/task permissions matter?
What is directly observed vs. inferred?
How would I validate safely on an authorized host?
~~~

## Tasks

1. Interpret the token privileges.
2. Identify service configurations that deserve review.
3. Correlate scheduled tasks with filesystem permissions.
4. Identify exposed credentials.
5. Separate strong findings from weak leads.
6. Prioritize remediation.

## Required Format

~~~text
Finding:
Evidence:
Privilege level involved:
User-controlled element:
Why it matters:
Validation required:
Remediation:
Priority:
~~~

## Important Concepts

`SeImpersonatePrivilege` is a **lead**, not proof of privilege escalation by itself.

An unquoted service path is also not automatically exploitable; path layout and writable locations matter.

The strongest relationship in this dataset should come from correlating a privileged scheduled task with a user-modifiable script.

## Deliverable

Identify at least five review items, rank the top three, and explain one item that looks interesting but needs more evidence before it becomes a finding.