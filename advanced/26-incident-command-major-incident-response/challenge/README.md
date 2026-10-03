# Challenge — Incident Command / Major Incident Response

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 120–150 minutes |
| Environment | Static fictional evidence |
| Authorized scope | Static fictional incident timeline, status board, and role packet in this challenge directory. |
| Goal | Produce a professional evidence-backed security deliverable |

## Scenario

A fictional organization is responding to a multi-system incident involving identity, endpoint, and application alerts. Evidence is incomplete and several business services are affected.

## Authorized Scope

Static fictional incident timeline, status board, role packet, and generated local workspace only.

## Setup

The event lead loads the private flag registry, then creates the local incident-command workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/advanced-incident-command
~~~

No external target or service is required.

## Investigation / Tasks

### Phase 1

Assign incident commander, technical lead, communications lead, and scribe responsibilities.

### Phase 2

Build a current-state timeline from incident-timeline.jsonl.

### Phase 3

Choose three containment actions and document business/forensic tradeoffs.

After assigning roles, reconstructing the timeline, and choosing containment actions with business/forensic tradeoffs, inspect `command-note.txt` and record the first dashboard flag.

### Phase 4

Update status-board.md with confirmed, suspected, and unknown items.

### Phase 5

Write a technical handoff and a separate executive update.

After completing both communication products and keeping confirmed/suspected/unknown clearly separated, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus the role assignment, timeline, decision log, containment plan, technical handoff, and executive update.

## Cleanup

~~~bash
./reset.sh
~~~
