# Challenge — Threat Modeling / Architecture Review

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 90–120 minutes |
| Environment | Static fictional evidence |
| Authorized scope | Fictional architecture diagram, data-flow table, and requirements in this challenge directory. |
| Goal | Produce a professional evidence-backed security deliverable |

## Scenario

A fictional student-services platform is moving from one application to several services. The design includes a public portal, API gateway, identity provider, reporting service, object storage, and administrative interface.

## Authorized Scope

Fictional architecture diagram, data-flow table, requirements, and generated local workspace only.

## Setup

The event lead loads the private flag registry, then creates the local architecture-review workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/advanced-threat-modeling
~~~

No external target or service is required.

## Investigation / Tasks

### Phase 1

Identify assets, actors, and trust boundaries.

### Phase 2

Trace sensitive data through dataflows.csv.

### Phase 3

Write at least five abuse cases tied to concrete architecture elements.

After identifying assets, actors, trust boundaries, sensitive data flows, and at least five concrete abuse cases, inspect `model-note.txt` and record the first dashboard flag.

### Phase 4

Identify where authentication, authorization, secrets, and logging decisions belong.

### Phase 5

Prioritize three design changes and explain which threat each reduces.

After placing authentication, authorization, secret-management, and logging controls at the correct architectural boundaries, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus the threat model, trust-boundary diagram, abuse-case table, prioritized design changes, telemetry requirements, and residual-risk notes.

## Cleanup

~~~bash
./reset.sh
~~~
