# Challenge — Multi-Service Enumeration and Prioritization

**Difficulty:** Intermediate  
**Estimated time:** 75–105 minutes

## Scenario

You have been given a localhost-only slice of a fictional internal environment. Several services are exposed, but you are not told which ports are open or which services are most sensitive.

Your job is to perform scoped discovery, fingerprint only what you find, manually validate each service, and produce a prioritized enumeration report.

## Start

~~~bash
docker compose up -d
~~~

## Authorized Scope

~~~text
Target: 127.0.0.1
TCP ports: 8100-8199
~~~

Do not scan outside this range.

## Phase 1 — Discovery

Choose an Nmap command that answers:

~~~text
Which TCP ports in the authorized range are open?
~~~

Record the command and result.

## Phase 2 — Targeted Fingerprinting

Run service detection only against discovered ports.

For each port record:

~~~text
Nmap service guess:
Product/version evidence:
Confidence:
What still needs manual validation:
~~~

## Phase 3 — Manual Validation

Use `curl -i` against every HTTP service.

Use raw HTTP with Netcat against at least one service.

Collect:

- status code,
- Server header,
- X-CyberLabs-Service header,
- page/API purpose,
- interesting linked route,
- whether the service exposes operational/internal details.

## Phase 4 — Secondary Endpoints

Look for linked or obvious supporting endpoints such as:

~~~text
/health
/metrics
~~~

Do not brute-force arbitrary paths for this lab.

## Phase 5 — Service Classification

Classify each discovered service as primarily:

~~~text
inventory / data
status / monitoring
administration
metrics / observability
~~~

Explain the evidence behind your classification.

## Phase 6 — Prioritization

Rank the services by which you would review first in a real internal assessment.

For each rank explain:

~~~text
Exposure:
Sensitivity:
Information disclosed:
Authentication context:
Operational impact:
Additional validation needed:
~~~

## Phase 7 — Hardening

Recommend one specific hardening action per service.

Examples of categories:

- network segmentation,
- authentication,
- access control,
- information minimization,
- monitoring,
- service binding.

## Deliverable

| Port | Nmap result | Manual evidence | Role | Security question | Priority | Hardening |
|---:|---|---|---|---|---:|---|

Then include:

~~~text
Authorized scope:
Discovery command:
Fingerprint command:
Manual validation command:

Highest-priority service:
Why:

One observation:
One interpretation:
One thing still unknown:
~~~

## Cleanup

~~~bash
docker compose down
~~~