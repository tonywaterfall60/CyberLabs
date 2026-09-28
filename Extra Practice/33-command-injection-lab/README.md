# Extra Practice 33 — Command Injection Lab

## Lab Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 90–120 minutes |
| Environment | Kali Linux + Docker |
| Infrastructure | Local toy diagnostics application |
| Tools | Burp Suite, curl, shell metacharacter reasoning |

## Scenario

A fictional diagnostics endpoint passes user input to a shell command inside an isolated training container. Demonstrate the weakness with a harmless proof, retrieve the local training objective, then explain the correct fix.

## Authorized Scope

~~~text
http://127.0.0.1:8850
~~~

The container is the only authorized execution environment. Do not reuse payloads against unrelated systems. Do not run destructive commands.

## Setup

~~~bash
docker compose up --build -d
~~~

## Investigation / Tasks

### Phase 1 — Baseline

Use `/check?name=localhost` and record normal output.

### Phase 2 — Injection Hypothesis

Identify where user input reaches the shell.

### Phase 3 — Harmless Proof

Use a harmless second command such as `id` or `printf` to demonstrate command separation.

### Phase 4 — Objective

Read only `/training/objective.txt` as the local completion objective.

### Phase 5 — Secure Rewrite

Explain why argument arrays with `shell=False`, strict input validation, and least privilege prevent the issue.

### Phase 6 — Detection

Discuss process ancestry, shell invocation, unexpected child processes, and application request logging.

## Deliverable

Submit baseline, harmless proof, objective evidence, root cause, secure pseudocode, and detection ideas.

## Cleanup

~~~bash
docker compose down
~~~
