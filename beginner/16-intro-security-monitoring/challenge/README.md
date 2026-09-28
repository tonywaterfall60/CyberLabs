# Challenge — First Alert Triage

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Beginner |
| Estimated time | 30–45 minutes |
| Environment | Static event log |
| Authorized scope | events.log |
| Goal | Build a small timeline and decide what deserves follow-up |

## Scenario

A fictional SOC alert reports repeated login failures.

## Authorized Scope

Analyze only the provided log.

## Setup

No setup is required.

## Investigation / Tasks

Build a timeline and identify:

- failed-login count,
- whether a success followed,
- source address,
- later application action,
- what remains unknown.

Classify the result as:

~~~text
likely benign
needs follow-up
high priority
~~~

and justify the choice.

## Deliverable

Submit the timeline, classification, supporting evidence, and two additional logs you would request.

## Cleanup

No cleanup is required.
