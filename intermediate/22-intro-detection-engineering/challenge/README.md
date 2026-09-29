# Challenge — Write Your First Detection

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate |
| Estimated time | 45–60 minutes |
| Environment | Synthetic process events |
| Authorized scope | process-events.jsonl |
| Goal | Detect Office launching encoded PowerShell without alerting on normal PowerShell |

## Scenario

A SOC team wants a first-pass analytic for a suspicious Office-to-PowerShell pattern while avoiding alerts on ordinary PowerShell use.

## Authorized Scope

Use only `process-events.jsonl`. This is offline synthetic telemetry.

## Setup

No service startup is required.

## Investigation / Tasks

Create logic using parent process, child process, and command line.

Test against all supplied events.

Document positive cases, negative cases, required fields, false positives, and one coverage gap.

## Deliverable

Submit pseudocode or Sigma-like logic plus a test matrix.

## Cleanup

No cleanup is required.
