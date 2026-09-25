# Challenge — Security Triage Case File

**Difficulty:** Beginner  
**Estimated time:** 30–45 minutes  
**Goal:** Classify fictional incidents using core cybersecurity concepts and recommend practical controls.

## Scenario

You are helping a small organization's security team review five short incident reports.

For each case, your job is not to “hack” anything. Your job is to decide:

- what matters,
- what weakness exists,
- what could go wrong,
- which security property is affected,
- what control would reduce risk.

## Analysis Template

For every incident complete:

~~~text
Asset:
Threat:
Vulnerability:
Likely impact:
Primary CIA property:
Authentication issue? yes/no/none
Authorization issue? yes/no/none
Preventive control:
Detection/monitoring idea:
Recovery or response action:
Confidence in your answer:
~~~

Use short explanations rather than single words when possible.

## Incident 1 — Reused Password

A student uses the same password for their school account and an unrelated shopping site. The shopping site is breached and the password is leaked.

Additional context: the school account has access to email, class files, and password-reset messages for other services.

Questions:

- What is the most important asset?
- Is the leaked password itself the threat, vulnerability, or evidence?
- Which control most directly reduces credential-reuse risk?

## Incident 2 — Public Admin Function

A web application requires login, but any authenticated user can directly browse to `/admin/reports` and view administrative reports.

Additional context: normal users should only see their own profile and account data.

Questions:

- Did authentication work?
- Which security decision failed?
- Why would hiding the admin link not fix the problem?

## Incident 3 — Missing Restore Test

A department backs up files every night but has never tested restoring a backup.

Additional context: backups complete successfully according to the backup software.

Questions:

- Which CIA property is most directly at risk?
- Why does a successful backup job not prove recoverability?
- What should the department test?

## Incident 4 — Shared Administrator Account

Several employees share the same administrator account. A sensitive configuration is changed, but no one knows who made the change.

Additional context: the account has no MFA and audit logs only record the shared username.

Questions:

- Which security concepts are affected besides confidentiality?
- Why does individual accountability matter?
- What should be changed first?

## Incident 5 — Unsupported Public Server

A public web server is running unsupported software with known security updates available.

Additional context: the server is reachable from the Internet and hosts a public-facing service.

Questions:

- What is the vulnerability?
- What is the threat?
- What would make the risk higher or lower?
- Which mitigation reduces the underlying weakness?

## Comparison Task

After finishing all five, rank them by which incident you would investigate first.

Do not use only “this sounds scary.” Explain your priority using:

~~~text
Exposure
Impact
Evidence
Likelihood
Existing controls
~~~

There is not always one perfect ranking. The quality of your reasoning matters.

## Attacker vs. Defender Task

Choose one incident and complete:

~~~text
Attacker goal:
Likely weakness targeted:
Defender prevention:
Defender detection:
Defender recovery:
~~~

## Deliverable

Submit or discuss:

1. completed analysis for all five incidents,
2. your priority order,
3. your attacker/defender analysis for one case.

## Key Takeaway

A security finding is stronger when you can explain the asset, weakness, impact, and control instead of only naming a cybersecurity term.