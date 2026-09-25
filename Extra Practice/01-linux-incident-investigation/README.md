# Extra Practice 01 — Linux Incident Investigation

**Difficulty:** Beginner → Intermediate  
**Estimated time:** 60–90 minutes  
**Environment:** Kali Linux  
**Infrastructure:** generated local filesystem and synthetic logs  
**Tools:** grep, find, sort, uniq, cut/awk, stat, sha256sum

## Scenario

You are assisting with a small internal Linux incident review.

An administrator reports:

- repeated failed SSH logins,
- one later successful login,
- a suspicious file placed in a temporary directory,
- an application configuration file that may expose sensitive information.

Your job is to reconstruct what happened using only the provided local evidence.

Everything is synthetic and generated under:

~~~text
~/cyberclub/extra-practice/linux-incident
~~~

## Scope

You may inspect only:

~~~text
~/cyberclub/extra-practice/linux-incident
~~~

Do not investigate the actual Kali system logs for this exercise.

## Learning Objectives

Practice:

- navigating evidence directories,
- filtering authentication logs,
- counting repeated events,
- building a timeline,
- identifying file metadata,
- hashing evidence,
- distinguishing evidence from assumptions,
- documenting an incident clearly.

---

## Setup

From this lab directory:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
~~~

Then:

~~~bash
cd ~/cyberclub/extra-practice/linux-incident
find . -maxdepth 2 -type f -print
~~~

## Evidence Layout

The setup script creates:

~~~text
linux-incident/
├── logs/
│   ├── auth.log
│   └── app.log
├── evidence/
│   ├── updater.sh
│   └── note.txt
├── config/
│   └── app.conf
└── case-info.txt
~~~

## Investigation Tasks

### Task 1 — Authentication Activity

Determine:

- which user received the most failed logins,
- which source generated the failures,
- whether a later login succeeded,
- the timestamp of the success.

Do not manually count if a shell pipeline can answer the question.

### Task 2 — Application Activity

Correlate the successful login with `logs/app.log`.

Determine:

- which application actions occurred afterward,
- whether any action should receive extra attention,
- whether the logs alone prove compromise.

### Task 3 — Suspicious File

Inspect:

~~~text
evidence/updater.sh
~~~

Collect:

- file type,
- permissions,
- size,
- timestamps,
- SHA-256,
- interesting strings/content.

Do **not** execute the file.

### Task 4 — Configuration Review

Inspect:

~~~text
config/app.conf
~~~

Identify at least one security concern.

Explain why the concern matters and how it should be remediated.

### Task 5 — Timeline

Create a timeline using this format:

~~~text
Timestamp | Source/User | Event | Evidence Source | Interpretation
~~~

Include at least five events.

### Task 6 — Final Assessment

Write a short incident summary that distinguishes:

~~~text
Observed facts
Likely interpretation
Uncertainty
Additional evidence requested
Recommended remediation
~~~

## Flag

One evidence item contains an instructor-injected practice flag when the lab is prepared for an event.

Search only after completing the investigation.

Flag format:

~~~text
SRU{...}
~~~

If no private value was injected, you may see:

~~~text
FLAG_NOT_CONFIGURED
~~~

## Deliverable

Submit:

~~~text
Most targeted user:
Suspicious source:
Successful login:
Important application action:
Suspicious file SHA-256:
Configuration concern:
Timeline:
Incident summary:
Additional evidence requested:
Flag:
~~~

## Cleanup

Return to this lab directory and run:

~~~bash
./reset.sh
~~~
