# Challenge — Build, Test, and Tune Detection Logic

**Difficulty:** Advanced  
**Estimated time:** 90–120 minutes

## Goal

Treat detections like code: define behavior, write logic, test positive and negative cases, tune, and document triage requirements.

## Evidence

~~~text
process_events.jsonl
auth_events.jsonl
starter-rule.yml
test_detections.py
~~~

## Detection A — Encoded PowerShell from Office Parent

Requirements:

- PowerShell process
- Office-like parent
- encoded-command syntax
- support both long and abbreviated encoded-command forms

### Tasks

1. Review starter-rule.yml.
2. Identify the required fields.
3. Confirm which synthetic events should alert.
4. Confirm which events should **not** alert.
5. Explain the known false-positive class.
6. Decide whether medium severity is appropriate.

## Detection B — Failures Followed by Success

Requirements:

~~~text
same user
same source
>= 3 failures
then success
within 120 seconds
~~~

### Tasks

1. Identify the positive test sequence.
2. Explain why Pat's sequence should not alert under the 120-second rule.
3. Explain why failures across multiple users from one source are a different detection problem.
4. State the correlation keys and time semantics explicitly.

## Test Harness

Run:

~~~bash
python3 test_detections.py
~~~

Treat the script as a reference implementation, not the only acceptable answer.

## Regression Matrix

Create:

| Test case | Expected alert? | Actual | Why |
|---|---:|---:|---|
| Office → encoded PowerShell | | | |
| Office → normal PowerShell script | | | |
| Explorer → normal PowerShell | | | |
| 3 fails then success <120s | | | |
| 2 fails then success >120s | | | |
| many users fail from same source | | | |

## Tuning

For each rule document:

~~~text
Required telemetry
Logic
Threshold/window
Known false positives
Possible exclusions
Evasion/coverage gaps
Severity
Triage steps
Response
~~~

## Detection-as-Code Discussion

Explain:

- what should be version-controlled,
- how tests protect against regressions,
- how schema changes can silently break detections,
- why tuning changes should be reviewed.

## Deliverable

Submit updated rule logic, regression matrix, test output, false-positive analysis, coverage gaps, severity rationale, and analyst triage steps.