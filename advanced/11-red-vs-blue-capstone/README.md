# Advanced 11 — Red vs. Blue Capstone

## Event Snapshot

| Item | Details |
|---|---|
| Track | Advanced |
| Difficulty | Advanced |
| Estimated time | 2–3 hours |
| Environment | Kali Linux / local CyberLabs environment |
| Prerequisites | Advanced 01–10 |


## Scenario

This capstone connects offensive validation with defensive detection. The same local application produces structured logs so one team can validate a known authorization weakness while another team analyzes the resulting telemetry.

## Objectives / Tasks

### Learning Objectives

- establish normal behavior for multiple users
- validate a controlled authorization flaw
- capture exact offensive evidence
- correlate a response request ID with defensive telemetry
- write and test detection logic
- distinguish prevention from detection
- recommend a precise server-side fix
- discuss false-positive/delegated-access context
- conduct a structured purple-team debrief

### Roles

### Red

- map the application
- establish normal behavior
- validate cross-user object access
- retrieve the instructor-injected flag if configured
- document exact requests and responses

### Blue

- monitor or analyze the generated JSON log
- identify cross-user object access
- build a timeline
- propose detection logic
- recommend response and remediation

### Purple Debrief

Compare:

~~~text
action
  ↓
application decision
  ↓
telemetry
  ↓
detection
  ↓
prevention
~~~

## Authorized Scope

Authorized target and telemetry:

~~~text
http://127.0.0.1:8600
runtime/app.log
~~~

Do not redirect the red-team workflow or detector toward unrelated services or logs.

## Setup

~~~bash
chmod +x prepare-flags.sh
./prepare-flags.sh
docker compose up --build -d
~~~

Target:

~~~text
http://127.0.0.1:8600
~~~

Logs:

~~~text
runtime/app.log
~~~

Reference blue detector:

~~~text
detect_cross_user.py
~~~

Purple-team worksheet:

~~~text
PURPLE_DEBRIEF.md
~~~

### Flag Privacy

The public repository contains no filled-in flags. The event lead injects the Red value at runtime from the private instructor repository. Blue and Purple milestone values are written only to ignored runtime artifacts.

### Suggested Blue Tools

~~~bash
tail -f runtime/app.log
jq . runtime/app.log
grep cross_user runtime/app.log
~~~

## Deliverable

### Red report

~~~text
Baseline Alice/Bob:
Modified request:
Observed authorization failure:
X-Request-ID:
Evidence:
Impact:
Confidence:
~~~

### Blue report

~~~text
Suspicious event:
Request ID correlation:
Timeline:
Detection logic:
False-positive context:
Triage questions:
Response:
Remediation:
~~~

### Purple report

Complete PURPLE_DEBRIEF.md and explain how the same request connects:

~~~text
Red action
→ application decision
→ request ID
→ log event
→ detector
→ remediation
~~~

After Blue correlates the cross-user event and request ID, inspect `runtime/blue-note.txt` for the Blue milestone flag. After the Purple debrief and prevention/detection redesign are complete, inspect `runtime/purple-note.txt` for the Purple milestone flag.

Submit all three flags to the CyberLabs dashboard.

## Cleanup

~~~bash
docker compose down
rm -rf runtime
~~~

---

## Event Navigation
- Previous: [Exploit Development Foundations](../10-exploit-development/)
- Track Home: [Advanced Track](../README.md)
- Curriculum Index: [All CyberLabs Events](../../CURRICULUM_INDEX.md)
- Next: [API Exploitation & Authorization Testing](../12-api-exploitation-authorization-testing/)
