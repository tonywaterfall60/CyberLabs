# Extra Practice 02 — Network Service Triage

**Difficulty:** Intermediate  
**Estimated time:** 75–105 minutes  
**Environment:** Kali Linux + Docker  
**Tools:** Nmap, curl, Netcat, browser optional  
**Infrastructure:** three local services on a dedicated Docker network

## Scenario

A small internal application environment has been handed to you for a security review.

You are told only that:

- several HTTP services are exposed,
- one service contains operational status information,
- one service is administrative in nature,
- you must identify and prioritize what deserves further review.

Your task is not simply to list open ports.

You must:

1. discover services,
2. fingerprint them,
3. manually validate them,
4. determine their likely purpose,
5. prioritize review,
6. recommend hardening.

## Scope

Authorized target:

~~~text
127.0.0.1
~~~

Authorized TCP port range:

~~~text
8700-8799
~~~

Do not scan outside that range for this exercise.

---

## Infrastructure

The lab launches three Nginx services:

~~~text
                     Kali VM
                        |
                    127.0.0.1
                        |
        +---------------+---------------+
        |               |               |
     :8710           :8720           :8730
  Inventory        Monitoring       Admin Portal
        |               |               |
        +---------------+---------------+
                        |
             Docker bridge network
              ep_service_network
~~~

Services are isolated in Docker but published only to the local Kali VM.

## Start the Lab

~~~bash
docker compose up -d
~~~

Verify:

~~~bash
docker compose ps
~~~

Do not inspect the Compose file for service answers until after completing the exercise.

---

## Investigation Phase 1 — Discovery

Perform a scoped TCP scan.

Answer:

- which ports are open,
- which are closed,
- which service labels Nmap suggests.

Record the exact command used.

## Phase 2 — Fingerprinting

Perform targeted service detection only against the ports you discovered.

For each service record:

~~~text
Port:
Nmap service:
Nmap version/product guess:
Confidence:
~~~

Do not treat Nmap's label as final proof.

## Phase 3 — Manual Validation

Use curl against every discovered HTTP service.

Collect:

- HTTP status,
- Server header,
- X-CyberLabs-* headers,
- page title/purpose,
- interesting routes or references.

Example:

~~~bash
curl -i http://127.0.0.1:<port>/
~~~

Use Netcat against at least one service.

Example pattern:

~~~bash
nc -nv 127.0.0.1 <port>
~~~

Then send:

~~~http
GET / HTTP/1.0
Host: localhost

~~~

## Phase 4 — Operational Mapping

Build a service table:

~~~text
Port | Service Purpose | Evidence | Sensitivity | Questions
~~~

Do not use “high risk” simply because a service is open.

Consider:

- Is this an administrative service?
- Does it expose operational details?
- Does it reveal internal asset names?
- Is authentication visible?
- Is the service expected to be reachable?
- Is version information exposed?

## Phase 5 — Prioritization

Rank the three services in the order you would review them further.

For each ranking explain:

~~~text
Why this service deserves this position
What evidence supports the decision
What additional validation would be needed
~~~

## Phase 6 — Hardening

Provide at least one realistic hardening recommendation per service.

Examples of categories:

- network exposure,
- authentication,
- authorization,
- information disclosure,
- version maintenance,
- logging,
- segmentation.

Do not use vague recommendations such as “make it more secure.”

---

## Deliverable

~~~text
Scope:
Discovery command:
Open ports:

Service 1:
  Port:
  Nmap result:
  curl evidence:
  Netcat evidence:
  Purpose:
  Security questions:
  Hardening:

Service 2:
  ...

Service 3:
  ...

Priority order:
1.
2.
3.

Reasoning:
What is still unknown:
~~~

## Cleanup

~~~bash
docker compose down
~~~

Confirm:

~~~bash
docker compose ps
~~~
