# Extra Practice 14 — Multi-Host Cyber Range Investigation

**Difficulty:** Advanced  
**Estimated time:** 2–3 hours  
**Environment:** Kali Linux + Docker  
**Tools:** Nmap, curl, Netcat, jq, grep, browser/Burp optional  
**Infrastructure:** dedicated Docker subnet with four service hosts and generated telemetry

## Scenario

You have been assigned a small isolated training subnet after an architecture review found that several internal services may be exposed more broadly than intended.

Your job is to:

1. discover the hosts,
2. fingerprint services,
3. manually validate application roles,
4. identify information exposure and risky service placement,
5. correlate service logs,
6. prioritize remediation.

This is a range investigation, not a flag race.

## Scope

Authorized subnet:

~~~text
172.28.14.0/28
~~~

Authorized services are created only by this lab.

Do not scan outside this subnet.

## Infrastructure

~~~text
                    Kali / Docker Host
                           |
                    ep14_range bridge
                      172.28.14.0/28
          +----------------+----------------+----------------+
          |                |                |                |
   172.28.14.10      172.28.14.11     172.28.14.12     172.28.14.13
      web-01             api-01            admin-01          telemetry-01
      TCP 80             TCP 5000          TCP 8080          TCP 9000
          |                |                |                |
          +----------------+----------------+----------------+
                           |
                        runtime/
~~~

An additional activity generator briefly creates normal and suspicious-looking requests so the range has telemetry to investigate.

## Start

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
~~~

Verify:

~~~bash
docker compose ps
docker network inspect ep14_range
~~~

## Phase 1 — Host Discovery

Discover live hosts only inside the authorized /28.

Record:

~~~text
IP
Open ports
Service guesses
Initial role hypothesis
~~~

## Phase 2 — Targeted Fingerprinting

Perform targeted version/service detection only against discovered ports.

Do not run broad scans against unrelated interfaces.

## Phase 3 — Manual Validation

Use curl or Netcat to validate each HTTP service.

Collect:

- status code,
- Server header,
- X-CyberLabs headers,
- page/API purpose,
- interesting routes,
- whether authentication is represented.

## Phase 4 — Application Mapping

Review normal routes and APIs.

Interesting routes may include health, status, inventory, debug/build, admin, and telemetry endpoints.

Do not assume an unlinked route is automatically a vulnerability.

## Phase 5 — Telemetry Review

Inspect:

~~~text
runtime/api.jsonl
runtime/telemetry.jsonl
~~~

Determine:

- which service received repeated access,
- which client/source generated it,
- whether one request exposed more information than expected,
- which event should be prioritized for follow-up.

## Phase 6 — Architecture Assessment

Create a network/service diagram based on what you observed.

Then identify:

~~~text
Expected public-ish service:
Internal service:
Administrative service:
Monitoring/telemetry service:
~~~

Discuss whether each service belongs on the same reachable subnet.

## Phase 7 — Prioritization

Rank findings using:

- service sensitivity,
- exposure,
- information disclosed,
- authentication/authorization context,
- operational impact,
- evidence of actual use.

## Phase 8 — Hardening Plan

Recommend:

- segmentation changes,
- access-control changes,
- information-disclosure reduction,
- logging improvements,
- service-binding changes,
- monitoring/detection ideas.

## Deliverable

~~~text
Scope:
Live hosts:

Host 1:
  IP:
  Ports:
  Role:
  Evidence:
  Security questions:

Host 2:
  ...

Range diagram:
Telemetry findings:
Priority order:
Top remediation actions:
Unknowns / validation needed:
~~~

## Cleanup

~~~bash
./reset.sh
~~~