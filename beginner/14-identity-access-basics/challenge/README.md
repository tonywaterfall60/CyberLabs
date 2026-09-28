# Challenge — Identity Decision Review

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Beginner |
| Estimated time | 30–45 minutes |
| Environment | Static logs |
| Authorized scope | auth-events.txt |
| Goal | Classify authentication, authorization, MFA, and session events |

## Scenario

A fictional university portal produced a short identity log.

## Authorized Scope

Analyze only the provided file.

## Setup

No setup is required.

## Investigation / Tasks

For every event identify:

~~~text
authentication?
authorization?
MFA?
session creation/use?
expected or concerning?
~~~

Then explain why the cross-user grade request is an authorization problem even though authentication succeeded.

## Deliverable

Submit event classifications, the highest-priority finding, and one least-privilege recommendation.

## Cleanup

No cleanup is required.
