# Advanced 09 — Container Security

**Difficulty:** Advanced  
**Estimated time:** 120 minutes  
**Prerequisites:** Docker familiarity  
**Environment:** Kali Linux, Docker

## Why This Event Exists

Container security spans build-time, image, and runtime decisions. This event teaches students to review all three layers instead of treating a vulnerability scanner as the entire assessment.

## Learning Objectives

- review Dockerfile security
- identify secrets embedded in images
- identify root execution
- identify risky runtime capabilities and privileged settings
- identify dangerous host mounts/network modes
- distinguish build-time and runtime controls
- recommend safer container configuration

## Safety

The challenge includes intentionally poor configuration for static review.

Do **not** run `compose.insecure.yml` as-is.

## Challenge Files

~~~text
challenge/Dockerfile.insecure
challenge/compose.insecure.yml
challenge/Dockerfile.hardened.example
challenge/compose.hardened.example.yml
challenge/AUDIT_WORKSHEET.md
~~~

## Suggested Tools

~~~bash
docker build
docker history
docker inspect
grep
~~~

Optional if already installed:

~~~bash
trivy image <image>
~~~

## Guided Review

Ask four separate questions:

1. What is risky in the Dockerfile/build?
2. What persists in the image?
3. What is risky only at runtime?
4. Which control changes the container/host trust boundary?

The expanded challenge now includes a hardened comparison so students can distinguish:

~~~text
root-cause hardening
vs.
runtime containment
vs.
residual risk
~~~

Safe image build for inspection:

~~~bash
docker build -f Dockerfile.insecure -t cyberlabs-container-audit .
docker history cyberlabs-container-audit
docker inspect cyberlabs-container-audit
~~~

## Review Areas

- base image/version
- root vs. non-root user
- secrets
- layer history
- privileged mode
- host networking
- host filesystem mounts
- environment variables
- port exposure

## Deliverable

Complete the audit worksheet and provide:

~~~text
Finding:
Layer (build/image/runtime/host-boundary):
Evidence:
Impact:
Hardened comparison:
Residual risk:
Priority:
~~~

If a scanner is used, manually validate at least two findings instead of reporting raw CVE counts.

## Cleanup

Remove the locally built audit image if desired. Do not start the intentionally insecure compose definition.

## Next Event

[Advanced 10 — Exploit Development Foundations](../10-exploit-development/)