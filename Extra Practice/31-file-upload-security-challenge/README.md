# Extra Practice 31 — File Upload Security Challenge

## Lab Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate → Advanced |
| Estimated time | 90–120 minutes |
| Environment | Kali Linux + Docker |
| Infrastructure | Local file-submission web application |
| Tools | Burp Suite, curl, file, sha256sum |

## Scenario

A fictional support portal accepts uploaded evidence files. Assess whether its validation, filename handling, storage, and serving behavior are safe.

## Authorized Scope

~~~text
http://127.0.0.1:8830
~~~

Upload only harmless text/image test files that you create yourself. Do not upload executable malware, shells, or active exploit code.

## Setup

~~~bash
docker compose up --build -d
~~~

## Investigation / Tasks

### Phase 1 — Baseline

Upload an ordinary text file and inspect the response.

### Phase 2 — Validation

Compare filename extension, declared Content-Type, and actual content. Use harmless mismatches only.

### Phase 3 — Filename Handling

Test unusual but harmless filenames such as spaces, multiple dots, and duplicate names.

### Phase 4 — Serving Behavior

Determine whether uploaded files are served inline, downloaded, renamed, or isolated from application execution.

### Phase 5 — Security Review

Evaluate extension allowlists, MIME/content validation, random naming, storage outside executable paths, size limits, and malware scanning concepts.

## Deliverable

Submit upload matrix, evidence, identified weaknesses, secure design, and monitoring ideas.

## Cleanup

~~~bash
docker compose down
~~~
