# Extra Practice 34 — SQL Injection Deep Dive

## Lab Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 2–3 hours |
| Environment | Kali Linux + Docker |
| Infrastructure | Local Flask + SQLite application |
| Tools | Burp Suite, curl, SQL reasoning |

## Scenario

A fictional product database exposes a search feature and a boolean existence oracle that construct SQL unsafely. Analyze multiple SQL injection styles against synthetic data only.

## Authorized Scope

~~~text
http://127.0.0.1:8860
~~~

Do not use automated high-volume extraction. Do not target any database outside the local training container.

## Setup

~~~bash
docker compose up --build -d
~~~

## Investigation / Tasks

### Phase 1 — Baseline Queries

Understand normal search behavior and response differences.

### Phase 2 — Error / Syntax Behavior

Use harmless quoting tests to confirm whether input affects SQL syntax.

### Phase 3 — UNION Reasoning

Determine the result column count and retrieve only the synthetic training objective.

### Phase 4 — Boolean Oracle

Use `/exists?name=` to compare true and false conditions. Explain how a blind boolean oracle differs from UNION output.

### Phase 5 — Parameterized Rewrite

Show a parameterized-query version of the vulnerable search.

### Phase 6 — Detection

Discuss SQL errors, unusual operators, request rate, response-size differences, and database telemetry.

## Deliverable

Submit normal query evidence, SQLi confirmation, objective retrieval, boolean-oracle explanation, secure rewrite, and detection ideas.

## Cleanup

~~~bash
docker compose down
~~~
