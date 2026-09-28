# Extra Practice 28 — Pivoting and Lateral Movement Range

## Lab Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 2–3 hours |
| Environment | Kali Linux + Docker + SSH |
| Infrastructure | Dual-homed jump host plus isolated internal subnet |
| Tools | ssh, SOCKS proxying, proxychains/curl, Nmap with explicit scope |

## Scenario

You have authorized access to a fictional DMZ jump host. The jump host can reach an internal subnet that the Kali host cannot reach directly. Your job is to establish a tunnel, enumerate only the provided internal subnet, validate services, and document the trust boundary.

## Authorized Scope

Published entry point:

~~~text
127.0.0.1:8822
~~~

Internal subnet:

~~~text
172.28.28.0/28
~~~

Do not scan any other local, Docker, LAN, campus, or public subnet.

Training SSH credentials:

~~~text
trainee / training-only
~~~

## Setup

~~~bash
docker compose up --build -d
~~~

Verify that direct access to the internal services is not available from the normal host route.

## Investigation / Tasks

### Phase 1 — Establish the Pivot

Create a local SOCKS proxy through the jump host:

~~~bash
ssh -N -D 1080 -p 8822 trainee@127.0.0.1
~~~

### Phase 2 — Proxy Configuration

Use a temporary proxychains configuration or curl SOCKS support. Do not modify unrelated global configuration if avoidable.

### Phase 3 — Internal Discovery

Enumerate only `172.28.28.0/28`. Prefer narrow service checks and manual HTTP validation.

### Phase 4 — Service Mapping

Identify the internal API and admin service. Record what becomes reachable only after the pivot.

### Phase 5 — Lateral-Movement Reasoning

Explain what additional credential, trust, or vulnerability evidence would be needed before claiming lateral movement. The tunnel itself is not proof of host compromise.

### Phase 6 — Hardening / Detection

Recommend segmentation, jump-host controls, SSH monitoring, and egress/connection logging.

## Deliverable

Submit the tunnel command, internal map, evidence that segmentation changed visibility, service validation, uncertainty, and remediation/detection ideas.

## Cleanup

Stop the SSH tunnel, then:

~~~bash
docker compose down
~~~
