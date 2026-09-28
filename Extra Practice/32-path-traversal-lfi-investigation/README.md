# Extra Practice 32 — Path Traversal / LFI Investigation

## Lab Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate → Advanced |
| Estimated time | 90–120 minutes |
| Environment | Kali Linux + Docker |
| Infrastructure | Local document-viewer application |
| Tools | curl, Burp Suite, URL encoding, path normalization reasoning |

## Scenario

A fictional document viewer accepts a filename and returns documents from a public directory. Determine whether path normalization prevents access to a protected training directory.

## Authorized Scope

~~~text
http://127.0.0.1:8840
~~~

Only access files intentionally provided inside this training container. Do not redirect traversal techniques toward unrelated applications.

## Setup

~~~bash
docker compose up --build -d
~~~

## Investigation / Tasks

### Phase 1 — Baseline

Request the normal public documents listed by the application.

### Phase 2 — Path Handling

Test relative path components against the local training route. Keep tests limited to the documented training files.

### Phase 3 — Encoding

Compare ordinary `../` with URL-encoded path characters and record how the framework/server normalizes them.

### Phase 4 — Impact

Demonstrate access to the protected training objective if the viewer permits traversal.

### Phase 5 — Remediation

Explain canonicalization, allowlists, fixed document IDs, and resolving paths before enforcing an approved root.

## Deliverable

Submit baseline, traversal request, normalization observations, impact, secure design, and detection ideas.

## Cleanup

~~~bash
docker compose down
~~~
