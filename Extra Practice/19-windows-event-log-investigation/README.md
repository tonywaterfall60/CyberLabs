# Extra Practice 19 — Windows Event Log Investigation

## Lab Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate → Advanced |
| Estimated time | 90–120 minutes |
| Environment | Kali/Linux or Windows |
| Infrastructure | Fictional Security/Sysmon/PowerShell/Task Scheduler JSONL exports |
| Tools | jq, Python, timeline correlation |
## Scenario

A Windows workstation generated several alerts during the same user session. You are given normalized exports representing multiple Windows telemetry sources.

Your job is to correlate identity, process, scripting, and scheduled-task events into a defensible timeline and determine what is observed, inferred, and still unknown.

## Authorized Scope

Use only the provided fictional JSONL exports and starter timeline script.

## Setup

No live Windows host is required.

## Investigation / Tasks

### Evidence

~~~text
Security.jsonl
Sysmon.jsonl
PowerShell.jsonl
TaskScheduler.jsonl
timeline.py
~~~

### Phase 1 — Understand the Schemas

For each file identify its event types and useful join fields such as user, host, logon_id, process_guid, pid, task name, and timestamp.

### Phase 2 — Authentication Context

Use Security events to identify the relevant logon session and source address.

### Phase 3 — Process Tree

Use Sysmon-style process events to reconstruct parent/child relationships.

Pay special attention to Office → PowerShell → cmd relationships.

### Phase 4 — PowerShell Evidence

Review script-block events. Decode only the harmless Base64 value present in the fictional data.

### Phase 5 — Scheduled Task Evidence

Determine whether a task was created, modified, or executed, and which user/process was associated with it.

### Phase 6 — Correlation

Correlate the same host/user/logon/process across sources.

Build at least a 10-event timeline.

### Phase 7 — Automation

Complete or extend `timeline.py` so it loads all four files and sorts normalized events by timestamp.

Do not hard-code the final answer.

### Phase 8 — Analysis

Answer:

- What sequence is directly observed?
- Which event is highest priority?
- Does the evidence prove malicious persistence?
- What alternate administrative explanation is possible?
- Which evidence source would you request next?

## Deliverable

~~~text
Host:
User:
Logon ID:
Source IP:

Process chain:
PowerShell finding:
Scheduled-task finding:

Timeline:
Highest-priority event:

Observed:
Inferred:
Unknown:
Additional telemetry:
Detection ideas:
Remediation/response:
~~~

## Cleanup

No cleanup is required unless you created additional local output files.