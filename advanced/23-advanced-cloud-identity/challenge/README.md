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

Static fictional cloud identity, trust-policy, audit files, and the generated local workspace only.

## Setup

The event lead loads the private flag registry, then creates the local cloud-identity workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/advanced-cloud-identity
~~~

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

After correlating the trust graph with the audit trail and identifying the shortest path to persistent service credentials, inspect `path-note.txt` and record the first dashboard flag.

### Phase 5

Propose preventative, detective, and credential-lifecycle controls.

After designing controls that reduce cross-role trust and long-lived credential risk, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus the identity graph, observed vs inferred path, top finding, hardened trust/permission recommendations, and monitoring plan.

## Cleanup

~~~bash
./reset.sh
~~~
