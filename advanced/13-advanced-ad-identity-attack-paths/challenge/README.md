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

Use only relationships.csv. Do not pivot any names, hosts, or identities to real environments.

## Setup

No live directory or domain is required.

## Investigation / Tasks

Build at least three paths from a low-privilege principal toward privileged assets.

For each edge label:

~~~text
Observed
Inferred
Requires validation
~~~

Then answer:

- which path has the largest blast radius,
- where privileged sessions increase risk,
- which edge should be removed first,
- which telemetry would detect abuse.

## Deliverable

Submit graph, three paths, strongest path, validation gaps, remediation, and monitoring.

## Cleanup

No cleanup is required.
