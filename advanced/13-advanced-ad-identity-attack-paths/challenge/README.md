# Challenge — Identity Path Validation

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 75–90 minutes |
| Environment | Synthetic relationship graph |
| Authorized scope | relationships.csv |
| Goal | Identify and validate enterprise privilege paths |

## Scenario

A fictional enterprise identity export suggests several low-privilege principals may have multi-hop paths toward privileged assets.

## Authorized Scope

Use only `relationships.csv` and the generated local workspace. Do not pivot any names, hosts, or identities to real environments.

## Setup

The event lead loads the private flag registry, then creates the local identity-path workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/advanced-identity-paths
~~~

No live directory or domain is required.

## Investigation / Tasks

Build at least three paths from a low-privilege principal toward privileged assets.

For each edge label:

~~~text
Observed
Inferred
Requires validation
~~~

After building at least three multi-hop paths and labeling each edge, inspect `paths-note.txt` and record the first dashboard flag.

Then answer:

- which path has the largest blast radius,
- where privileged sessions increase risk,
- which edge should be removed first,
- which telemetry would detect abuse.

After prioritizing the highest-blast-radius path and selecting the first relationship to remediate, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus the graph, three paths, strongest path, validation gaps, remediation, and monitoring.

## Cleanup

~~~bash
./reset.sh
~~~
