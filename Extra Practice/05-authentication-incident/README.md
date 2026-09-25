# Extra Practice 05 — Authentication Incident

**Difficulty:** Intermediate → Advanced  
**Estimated time:** 90–120 minutes  
**Environment:** Kali Linux  
**Tools:** grep, awk, sort, uniq, jq, Python 3  
**Infrastructure:** generated authentication, MFA, VPN, and application logs

## Scenario

The security team received an alert that one employee account may have been used from an unusual source.

You have four evidence sources:

~~~text
auth.log
mfa.jsonl
vpn.log
application.log
~~~

Your goal is to determine whether the evidence supports normal user error, password guessing, successful unauthorized access, or an unresolved event requiring more evidence.

Do not jump directly to “compromised account.”

## Scope

Generated evidence directory:

~~~text
~/cyberclub/extra-practice/auth-incident
~~~

Use only those files.

## Infrastructure Model

~~~text
Internet Client
     |
     v
Identity Provider  ---> mfa.jsonl
     |
     +-------------> auth.log
     |
     v
VPN Gateway ------> vpn.log
     |
     v
Internal App -----> application.log
~~~

Each source has different visibility. The exercise is about correlation across telemetry, not searching one log.

## Setup

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/extra-practice/auth-incident
ls -l
~~~

## Phase 1 — Understand the Schema

Read a few lines from every source and identify timestamp, username, source, result, device/session, and action fields.

Write down which fields are shared between sources.

## Phase 2 — Authentication Failures

Determine which account has the most failures, which source generated them, the time range, and whether another account also received failures from that source.

Use command-line aggregation rather than manual counting.

## Phase 3 — Successful Authentication

Determine whether the targeted account later succeeded and record source IP, device ID, session ID, and timestamp.

## Phase 4 — MFA

Use jq against mfa.jsonl.

Determine whether MFA was challenged, approved or denied, which device was associated with the event, and whether multiple MFA events exist.

Do not assume MFA approval proves the user intentionally approved it.

## Phase 5 — VPN Correlation

Inspect vpn.log and determine whether a VPN session was established.

Record user, source, device, session, assigned internal IP, and timestamp.

## Phase 6 — Application Activity

Inspect application.log and determine what the authenticated session did after VPN access.

Identify activity with higher impact.

## Phase 7 — Build a Unified Timeline

Create:

~~~text
Timestamp | Source Log | User | Source/Device | Event | Interpretation
~~~

Include events from all four evidence sources.

## Phase 8 — Confidence Assessment

Write:

~~~text
Evidence supporting unauthorized access:
Evidence supporting legitimate access:
Evidence that is ambiguous:
Missing evidence:
Confidence:
~~~

Explain any Low/Medium/High confidence label.

## Phase 9 — Python Correlation

Open correlate.py and complete the TODO sections so it counts authentication failures per user/source, finds successful authentications, prints MFA results, VPN sessions, and important application actions.

Do not hard-code expected answers.

## Deliverable

~~~text
Most targeted user:
Suspicious source:
Successful login:
MFA result:
VPN session:
Important application action:

Unified timeline:

Evidence supporting unauthorized use:
Evidence supporting legitimate use:
Ambiguous evidence:
Additional telemetry requested:
Confidence:

Python script completed: yes/no
~~~

## Cleanup

~~~bash
./reset.sh
~~~