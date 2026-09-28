# Challenge — DevSecOps / Supply Chain II

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 90–120 minutes |
| Environment | Static fictional evidence |
| Authorized scope | Static fictional CI, SBOM, provenance, and release evidence only. |
| Goal | Produce an evidence-backed advanced security assessment |

## Scenario

A fictional application release passed functional testing, but security engineering found that the artifact registry contains a build whose provenance does not match the approved commit.

## Authorized Scope

Static fictional CI, SBOM, provenance, and release evidence only.

## Setup

No external platform or account is required.

## Investigation / Tasks

### Phase 1

Draw the source→CI→artifact→deployment trust chain.

### Phase 2

Compare workflow.yml, sbom.json, provenance.json, and release-log.jsonl.

### Phase 3

Identify the provenance mismatch and explain what it proves and does not prove.

### Phase 4

List controls that would prevent or detect an untrusted build promotion.

### Phase 5

Design a release gate requiring identity, digest, provenance, and approval validation.

## Deliverable

Supply-chain diagram, mismatch evidence, trust-boundary findings, recommended gates, and remaining uncertainty.

## Cleanup

No cleanup is required for this static-data challenge.
