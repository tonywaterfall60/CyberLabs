# Challenge — Secret in History

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate |
| Estimated time | 45–60 minutes |
| Environment | Static Git evidence |
| Authorized scope | history.txt and diff.txt |
| Goal | Identify secret exposure and correct remediation order |

## Scenario

A fictional repository accidentally committed a training API token, then deleted it in a later commit.

## Authorized Scope

Use only `history.txt` and `diff.txt`. Do not search real repositories or test any credential found in the fictional evidence.

## Setup

No Git server or external repository access is required.

## Investigation / Tasks

Determine:

1. which commit introduced the secret,
2. whether the latest tree still contains it,
3. whether deletion alone makes the token safe,
4. what should happen first: history rewrite or credential rotation,
5. what .gitignore can and cannot prevent.

## Deliverable

Submit incident timeline, exposure explanation, remediation order, and prevention controls.

## Cleanup

No cleanup is required.