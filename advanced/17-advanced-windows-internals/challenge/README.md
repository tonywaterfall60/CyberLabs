# Challenge — Process, Token, and Service Correlation

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 75–90 minutes |
| Environment | Static Windows internals evidence |
| Authorized scope | internals.txt |
| Goal | Correlate process ancestry, tokens, integrity, and service context |

## Scenario

A fictional Windows endpoint export contains process, token, integrity, and service context that must be correlated.

## Authorized Scope

Use only internals.txt. No live Windows endpoint is authorized or required.

## Setup

No setup is required.

## Investigation / Tasks

Identify:

- the interactive user process tree,
- the elevated/system process tree,
- integrity levels,
- one suspicious parent/child relationship,
- one service running as LocalSystem,
- what evidence is still needed before claiming malicious activity.

## Deliverable

Submit process tree, token/integrity interpretation, strongest lead, alternative explanation, and next telemetry request.

## Cleanup

No cleanup is required.
