# Challenge — Windows Security Evidence Review

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate |
| Estimated time | 45–60 minutes |
| Environment | Static Windows evidence |
| Authorized scope | windows-evidence.txt |
| Goal | Correlate services, tasks, ACLs, and logs |

## Scenario

A fictional endpoint generated several configuration and event records during an administrative review.

## Authorized Scope

Use only the provided evidence and generated local review workspace.

## Setup

The event lead loads the private flag registry, then create the local review workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/windows-security-review
~~~

## Investigation / Tasks

Identify:

- one high-privilege service,
- one scheduled task,
- one writable path,
- one useful Security event,
- one PowerShell event,
- one item that is suspicious but not proof of compromise.

After correlating service, task, ACL, Security, Sysmon, and PowerShell evidence, inspect `evidence-correlation.txt` and record the first dashboard flag.

After writing two defensible remediation ideas and separating configuration weakness from observed abuse, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus an evidence table with `Observed / Inferred / Unknown` and two remediation ideas.

## Cleanup

~~~bash
./reset.sh
~~~
