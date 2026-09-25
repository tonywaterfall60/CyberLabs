# Extra Practice 13 — DevSecOps Pipeline Review

**Difficulty:** Advanced  
**Estimated time:** 90–120 minutes  
**Environment:** Kali Linux  
**Tools:** grep, jq/yq optional, shell, Dockerfile review  
**Infrastructure:** fictional application repository + CI workflow + build artifacts

## Scenario

A development team asks for a security review of its CI/CD pipeline before production deployment.

You are given a simplified repository snapshot containing:

~~~text
app/
.github/workflows/build.yml
Dockerfile
requirements.txt
scan-results.json
deployment.env.example
~~~

Your task is to identify weaknesses in source, dependency, build, secret, and deployment practices.

## Scope

Review only this local training repository snapshot.

Do not connect it to a real CI provider or cloud account.

## Phase 1 — Pipeline Map

Read the workflow and draw:

~~~text
Commit
  ↓
CI job
  ↓
dependency install
  ↓
tests
  ↓
container build
  ↓
registry push
  ↓
deployment
~~~

Mark where credentials/secrets are used.

## Phase 2 — Workflow Review

Look for:

- unpinned third-party actions,
- excessive workflow permissions,
- secrets passed to shell commands,
- unsafe pull-request execution patterns,
- lack of security gates,
- artifact integrity gaps.

## Phase 3 — Dependency Review

Inspect requirements.txt and scan-results.json.

Determine which findings are relevant and which require version/context validation.

Do not treat scanner severity as proof of exploitability.

## Phase 4 — Container Build Review

Inspect Dockerfile.

Identify root execution, floating base image tags, copied secrets, unnecessary packages, and reproducibility concerns.

## Phase 5 — Secret Handling

Inspect deployment.env.example and workflow usage.

Determine whether any values belong in source control at all.

## Phase 6 — Supply-Chain Controls

Recommend improvements covering:

- action pinning,
- dependency pinning,
- least-privilege CI permissions,
- secret isolation,
- branch protection,
- build provenance/signing,
- artifact scanning,
- deployment approval gates.

## Phase 7 — Prioritized Remediation Plan

Create:

~~~text
Finding | Pipeline Stage | Evidence | Impact | Priority | Fix
~~~

## Deliverable

~~~text
Pipeline diagram:
Workflow findings:
Dependency findings:
Container findings:
Secret findings:

Top 3 risks:
1.
2.
3.

Recommended security gates:
Residual risks:
~~~