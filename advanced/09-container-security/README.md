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

Ask three separate questions:

1. What is risky in the Dockerfile/build?
2. What persists in the image?
3. What is risky only at runtime?

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

~~~text
Finding:
Layer (build/image/runtime):
Evidence:
Impact:
Safer configuration:
Priority:
~~~

## Cleanup

Remove the locally built audit image if desired. Do not start the intentionally insecure compose definition.

## Next Event

[Advanced 10 — Exploit Development Foundations](../10-exploit-development/)