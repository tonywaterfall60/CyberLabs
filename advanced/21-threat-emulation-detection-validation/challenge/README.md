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

Use only emulation-events.jsonl. No live emulation against external systems is authorized.

## Setup

No service startup is required.

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

## Deliverable

Submit an action-to-telemetry matrix, two detections, one visibility gap, and one recommended sensor/logging improvement.

## Cleanup

No cleanup is required.
