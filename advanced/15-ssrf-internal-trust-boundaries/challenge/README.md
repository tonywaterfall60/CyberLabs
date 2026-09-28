# Challenge — Server-Side Trust Boundary Review

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 75–90 minutes |
| Environment | Static architecture + request evidence |
| Authorized scope | architecture.txt and requests.txt |
| Goal | Validate SSRF impact and propose layered controls |

## Scenario

A fictional frontend can fetch URLs on behalf of users and has network access to services that clients cannot reach directly.

## Authorized Scope

Use only architecture.txt and requests.txt. No external or real internal services are authorized.

## Setup

No service startup is required.

## Investigation / Tasks

1. Draw the client/frontend/internal-service trust boundaries.
2. Identify which destinations the user cannot reach directly.
3. Identify which destinations the frontend can reach.
4. Explain why server-side fetch changes the effective attack surface.
5. Recommend destination validation, egress controls, and internal authentication.
6. Propose useful request/destination logging.

## Deliverable

Submit architecture diagram, SSRF evidence, impact, layered remediation, and detection strategy.

## Cleanup

No cleanup is required.
