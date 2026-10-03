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

Use only `internals.txt` and the generated local workspace. No live Windows endpoint is authorized or required.

## Setup

The event lead loads the private flag registry, then creates the local internals workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/advanced-windows-internals
~~~

## Investigation / Tasks

Identify:

- the interactive user process tree,
- the elevated/system process tree,
- integrity levels,
- one suspicious parent/child relationship,
- one service running as LocalSystem,
- what evidence is still needed before claiming malicious activity.

After correlating process ancestry, token groups/privileges, integrity, and service context, inspect `correlation-note.txt` and record the first dashboard flag.

After identifying the strongest lead, alternative explanation, next telemetry, and containment considerations, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus the process tree, token/integrity interpretation, strongest lead, alternative explanation, and next telemetry request.

## Cleanup

~~~bash
./reset.sh
~~~
