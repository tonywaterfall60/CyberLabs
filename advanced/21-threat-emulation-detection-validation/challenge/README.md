# Challenge — Action-to-Telemetry Validation

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 75–90 minutes |
| Environment | Synthetic emulation sequence |
| Authorized scope | emulation-events.jsonl |
| Goal | Determine whether planned actions are observable and detectable |

## Scenario

A synthetic adversary-emulation sequence has been converted into telemetry events. Your task is to validate visibility and detection coverage.

## Authorized Scope

Use only `emulation-events.jsonl` and the generated local workspace. No live emulation against external systems is authorized.

## Setup

The event lead loads the private flag registry, then creates the local validation workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/advanced-emulation-validation
~~~

## Investigation / Tasks

For each sequence identify:

~~~text
emulated action
expected data source
observed event
candidate detection
false positive
visibility gap
~~~

Classify each control as prevention, detection, or response.

After mapping each emulated action to the expected/observed telemetry and candidate detection, inspect `coverage-note.txt` and record the first dashboard flag.

After identifying the most important visibility gap and proposing the sensor/logging improvement needed to close it, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus an action-to-telemetry matrix, two detections, one visibility gap, and one recommended sensor/logging improvement.

## Cleanup

~~~bash
./reset.sh
~~~
