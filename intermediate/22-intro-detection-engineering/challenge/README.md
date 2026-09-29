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

Use only `process-events.jsonl` and the generated local workspace. This is offline synthetic telemetry.

## Setup

The event lead loads the private flag registry, then create the local detection workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/detection-engineering
~~~

## Investigation / Tasks

Create logic using parent process, child process, and command line.

After writing a rule that detects the suspicious Office-to-encoded-PowerShell pattern, inspect `detection-note.txt` and record the first dashboard flag.

Test against all supplied events.

Document positive cases, negative cases, required fields, false positives, and one coverage gap.

After validating the expected positive and negative test cases, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus pseudocode or Sigma-like logic and a test matrix.

## Cleanup

~~~bash
./reset.sh
~~~
