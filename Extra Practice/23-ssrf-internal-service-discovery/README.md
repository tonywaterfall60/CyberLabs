# Extra Practice 23 — SSRF and Internal Service Discovery

## Lab Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 2–3 hours |
| Environment | Kali Linux + Docker |
| Infrastructure | Public frontend plus isolated internal services |
| Tools | curl, Burp Suite, HTTP reasoning |

## Scenario

A fictional document-preview service can fetch a URL on behalf of the user. The frontend is the only service published to the Kali host; two internal services exist only on the Docker network.

## Authorized Scope

Published target:

~~~text
http://127.0.0.1:8780
~~~

Internal training service names intentionally referenced by the lab:

~~~text
internal-api:5001
admin-service:5002
~~~

Do not use this lab to probe host metadata services, Docker sockets, your LAN, or unrelated addresses.

## Setup

~~~bash
docker compose up --build -d
~~~

## Investigation / Tasks

### Phase 1 — Baseline

Use the preview endpoint with the explicitly provided safe URL `http://internal-api:5001/health`.

### Phase 2 — Trust Boundary

Explain why the server can reach resources the browser cannot directly reach.

### Phase 3 — Internal API Mapping

Use only the two provided internal hostnames. Discover documented routes by reading normal responses; do not automate port scanning.

### Phase 4 — Controlled SSRF Validation

Demonstrate that the frontend can fetch the admin service objective through the preview feature.

### Phase 5 — Root Cause

Explain why URL allowlisting, outbound network controls, DNS/IP validation, and service authentication matter.

### Phase 6 — Detection

Identify useful logs/fields for detecting unexpected server-side destinations.

## Deliverable

Submit baseline evidence, SSRF evidence, internal service map, trust-boundary explanation, impact, remediation, and monitoring ideas.

## Cleanup

~~~bash
docker compose down
~~~
