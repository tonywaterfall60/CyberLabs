# Challenge — Cloud Configuration Review

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate |
| Estimated time | 50–60 minutes |
| Environment | Static JSON evidence |
| Authorized scope | cloud.json |
| Goal | Identify identity, storage, network, and logging concerns |

## Scenario

A fictional cloud environment export contains IAM, storage, network, logging, and audit information. Review the configuration and separate exposure from evidence of actual use.

## Authorized Scope

Use only the local `cloud.json` training evidence and generated review workspace. Do not connect to a real cloud account.

## Setup

The event lead loads the private flag registry, then create the local review workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/cloud-security
~~~

No cloud account is required.

## Investigation / Tasks

Review the fictional configuration and identify one overly broad IAM permission, one public-storage concern, one network rule that deserves attention, one missing log source, and one audit event that proves actual use.

After mapping the configuration risks, inspect `config-review.txt` and record the first dashboard flag.

After correlating the successful anonymous object access with the storage exposure and explaining what that event proves, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus five findings with evidence, impact, and remediation.

## Cleanup

~~~bash
./reset.sh
~~~
