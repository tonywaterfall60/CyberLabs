# Challenge — Kubernetes Security

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 90–120 minutes |
| Environment | Static fictional evidence |
| Authorized scope | Static Kubernetes YAML manifests in this challenge directory only. No live cluster is required. |
| Goal | Produce an evidence-backed advanced security assessment |

## Scenario

A fictional namespace is being reviewed before deployment. The manifests include a web workload, a maintenance workload, RBAC, a Secret, and partial NetworkPolicy coverage.

## Authorized Scope

Static Kubernetes YAML manifests and the generated local workspace only. No live cluster is required.

## Setup

The event lead loads the private flag registry, then creates the local Kubernetes review workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/advanced-k8s
~~~

No external platform or account is required.

## Investigation / Tasks

### Phase 1

Inventory workloads, service accounts, services, secrets, and roles.

### Phase 2

Identify privileged/root/host-boundary settings.

### Phase 3

Trace RBAC permissions from service account to resources.

After inventorying workloads/service accounts and tracing the `web-sa` RBAC path plus privileged/host-boundary settings, inspect `rbac-note.txt` and record the first dashboard flag.

### Phase 4

Assess whether network policy limits east-west access.

### Phase 5

Rewrite the highest-risk manifest or policy fragment and explain residual risk.

After producing layered hardening for workload security context, RBAC, privileged/hostPID use, and network-policy coverage, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus the Kubernetes risk table, RBAC path, network-policy assessment, hardened example, and residual-risk notes.

## Cleanup

~~~bash
./reset.sh
~~~
