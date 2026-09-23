# Advanced 09 — Container Security

**Difficulty:** Advanced  
**Estimated time:** 120 minutes  
**Prerequisites:** Docker familiarity  
**Environment:** Kali Linux, Docker

## Learning Objectives

Students should be able to:

- review Dockerfile security
- identify secret leakage in image layers
- identify root execution
- identify risky runtime capabilities/privileged settings
- distinguish build-time and runtime controls
- recommend safer container configuration

## Challenge

The challenge includes intentionally poor container configuration for **static review**.

Do not run the insecure compose file as-is.

Students may safely build the Dockerfile to inspect image history if desired.

## Tools

- docker build
- docker history
- docker inspect
- grep
- optional Trivy if installed

## Deliverable

Produce findings covering:

- image/base image
- user privilege
- secrets
- package/build hygiene
- runtime privilege
- network exposure
- remediation

## Next Event

[Advanced 10 — Exploit Development Foundations](../10-exploit-development/)
