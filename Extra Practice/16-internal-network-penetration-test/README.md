# Extra Practice 16 — Internal Network Penetration Test

**Difficulty:** Intermediate → Advanced  
**Estimated time:** 2–3 hours  
**Environment:** Kali Linux + Docker  
**Infrastructure:** isolated 4-host Docker subnet

## Scenario

You have been authorized to assess a small fictional internal network.

Given scope:

~~~text
172.28.16.0/28
~~~

Your job is to discover hosts, map services, manually validate findings, identify the intended attack path, retrieve the protected local training artifact, and document hardening recommendations.

## Scope

Only 172.28.16.0/28 is authorized. Do not scan any other subnet or interface.

## Start

~~~bash
docker compose up --build -d
docker network inspect ep16_range
~~~

Kali should be the Docker host for this lab.

## Rules

- No denial of service.
- No attacks outside the dedicated subnet.
- No brute-force password guessing.
- No automated exploitation frameworks.
- Validate findings manually.
- Stop after retrieving the local training objective.

## Phase 1 — Host Discovery

Identify live hosts and document IP, open ports, likely service, and evidence.

## Phase 2 — Service Enumeration

Run targeted service detection only after discovery. Manually validate HTTP services with curl/browser.

Ask which services appear frontend, administrative, API, or telemetry-oriented, and which observations materially change your next step.

## Phase 3 — Web / Content Mapping

Map the discovered web service. Review normal links, headers, and robots.txt. Do not blindly brute-force the server.

## Phase 4 — Intended Path

The range contains a deliberately exposed operational note that provides context for accessing a second service.

Expected methodology:

~~~text
discover
→ validate
→ use provided training-only service token
→ reach protected training artifact
~~~

Do not guess credentials.

## Phase 5 — Trust Review

Explain which trust assumptions failed, considering web-accessible secrets, service-to-service trust, segmentation, secret rotation, and logging.

## Phase 6 — Reporting

~~~text
Finding:
Affected host/service:
Evidence:
Attack path:
Impact:
Root cause:
Remediation:
Detection/monitoring:
Confidence:
~~~

## Deliverable

Submit a network map, host/service inventory, exact attack path, evidence for each step, protected training artifact, top three remediation priorities, and one detection idea per attack-path stage.

## Cleanup

~~~bash
docker compose down
~~~