# Challenge — Advanced Cloud Identity

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 90–120 minutes |
| Environment | Static fictional evidence |
| Authorized scope | Static fictional cloud identity, trust-policy, and audit files in this challenge directory. |
| Goal | Produce an evidence-backed advanced security assessment |

## Scenario

A fictional reporting workload can assume several roles. An internal review found unexpected credential creation and a cross-role trust path that may exceed the workload's purpose.

## Authorized Scope

Static fictional cloud identity, trust-policy, and audit files in this challenge directory.

## Setup

No external platform or account is required.

## Investigation / Tasks

### Phase 1

Build an identity/trust graph from identity-map.json.

### Phase 2

Review trust-policy.json and distinguish who can assume a role from what that role can do.

### Phase 3

Correlate audit-events.jsonl with the trust graph.

### Phase 4

Identify the shortest path to persistent service credentials.

### Phase 5

Propose preventative, detective, and credential-lifecycle controls.

## Deliverable

Identity graph, observed vs inferred path, top finding, hardened trust/permission recommendations, and monitoring plan.

## Cleanup

No cleanup is required for this static-data challenge.
