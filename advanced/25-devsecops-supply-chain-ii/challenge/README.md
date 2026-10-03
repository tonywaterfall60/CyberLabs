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

Static fictional CI, SBOM, provenance, release evidence, and the generated local workspace only.

## Setup

The event lead loads the private flag registry, then creates the local supply-chain workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/advanced-supply-chain
~~~

No external platform or account is required.

## Investigation / Tasks

### Phase 1

Draw the source→CI→artifact→deployment trust chain.

### Phase 2

Compare workflow.yml, sbom.json, provenance.json, and release-log.jsonl.

### Phase 3

Identify the provenance mismatch and explain what it proves and does not prove.

After comparing the deployed artifact digest with the provenance digest and explaining what the mismatch proves and does not prove, inspect `provenance-note.txt` and record the first dashboard flag.

### Phase 4

List controls that would prevent or detect an untrusted build promotion.

### Phase 5

Design a release gate requiring identity, digest, provenance, and approval validation.

After defining the release gate and controls needed to prevent promotion of an untrusted build, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus the supply-chain diagram, mismatch evidence, trust-boundary findings, recommended gates, and remaining uncertainty.

## Cleanup

~~~bash
./reset.sh
~~~
