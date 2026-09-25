# Extra Practice 06 — Container Security Audit

**Difficulty:** Advanced  
**Estimated time:** 90–120 minutes  
**Environment:** Kali Linux + Docker  
**Tools:** Docker, grep, docker history, docker inspect; optional Trivy  
**Infrastructure:** deliberately insecure build/runtime configuration plus a safe review target

## Scenario

A development team has provided a containerized internal reporting service for pre-production security review.

You have been given:

~~~text
Dockerfile.review
compose.review.yml
app/
~~~

The configuration intentionally contains multiple security weaknesses.

Your job is to review the container without running the unsafe Compose configuration.

## Scope

Authorized files:

~~~text
Extra Practice/06-container-security-audit/
~~~

You may build the review image using the documented safe command.

Do not run compose.review.yml as-is.

## Infrastructure Model

~~~text
Host
 |
 +-- container runs as root
 |
 +-- host network
 |
 +-- privileged mode
 |
 +-- broad host filesystem mount
 |
 +-- plaintext runtime secret
 |
 +-- application image with embedded build secret
~~~

The purpose is to distinguish Build-time risk, Image/layer risk, and Runtime risk.

## Phase 1 — Dockerfile Review

Inspect:

~~~bash
cat Dockerfile.review
~~~

Identify base-image concerns, secrets, user context, unnecessary packages, exposed ports, and reproducibility concerns.

Classify every finding as Build, Image, or Runtime.

## Phase 2 — Safe Build

Build only the image:

~~~bash
docker build -f Dockerfile.review -t cyberlabs-extra-container-audit .
~~~

Do not start the image yet.

## Phase 3 — Image History

Inspect:

~~~bash
docker history cyberlabs-extra-container-audit
~~~

Answer whether embedded build values can appear in layer metadata/history, which instructions created important layers, and whether deleting a file in a later layer erases it from earlier layers.

## Phase 4 — Image Configuration

Inspect:

~~~bash
docker inspect cyberlabs-extra-container-audit
~~~

Look for configured user, environment variables, exposed ports, command, and image metadata.

## Phase 5 — Runtime Configuration Review

Read:

~~~bash
cat compose.review.yml
~~~

Identify privileged mode, host networking, host filesystem mounts, plaintext environment secrets, added capabilities, and exposure/binding choices.

Do not run it.

## Phase 6 — Optional Vulnerability Scan

If Trivy is installed:

~~~bash
trivy image cyberlabs-extra-container-audit
~~~

Separate known package/image vulnerabilities from configuration/design risks.

Do not let scanner severity replace manual analysis.

## Phase 7 — Secure Redesign

Create Dockerfile.hardened and compose.hardened.yml.

The hardened design should avoid privileged mode, host networking, broad host mounts, and committed plaintext secrets; bind only to localhost if exposed; and use a non-root user.

Document where runtime secrets should come from rather than committing them.

## Phase 8 — Compare

Create:

~~~text
Risk | Original Evidence | Hardened Change | Residual Risk
~~~

## Deliverable

~~~text
Build-time findings:
Image/layer findings:
Runtime findings:

Highest-priority risk:
Why:

docker history observations:
docker inspect observations:
Trivy observations (if used):

Hardened Dockerfile:
Hardened Compose file:

Residual risks:
~~~

## Cleanup

Remove only this lab's image:

~~~bash
docker image rm cyberlabs-extra-container-audit
~~~

If Docker reports the image is still in use:

~~~bash
docker ps -a
~~~

Do not use broad prune commands.