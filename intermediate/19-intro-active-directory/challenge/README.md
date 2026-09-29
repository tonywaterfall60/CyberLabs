# Challenge — Build the Identity Map

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate |
| Estimated time | 50–60 minutes |
| Environment | Fictional CSV exports |
| Authorized scope | CSV files in this challenge |
| Goal | Build a simple AD relationship graph |

## Scenario

A fictional domain export shows users, groups, computers, and service accounts.

## Authorized Scope

Use only the supplied fictional data and generated local workspace.

## Setup

The event lead loads the private flag registry, then create the local AD review workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/ad-intro
~~~

No live domain is required.

## Investigation / Tasks

1. Separate human users and service accounts.
2. Map direct group membership.
3. Identify one nested group path.
4. Identify one privileged group.
5. Identify one service account with an SPN.
6. Explain what additional evidence would be needed before claiming compromise.

After mapping users, service accounts, groups, computers, SPNs, and the nested membership path, inspect `identity-map-note.txt` and record the first dashboard flag.

After identifying a privileged group/member relationship and explaining why membership alone does not prove compromise, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus a small graph and an Observed / Inferred / Unknown table.

## Cleanup

~~~bash
./reset.sh
~~~
