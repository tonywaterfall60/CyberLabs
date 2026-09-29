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

Use only `history.txt`, `diff.txt`, and the generated local workspace. Do not search real repositories or test any credential found in the fictional evidence.

## Setup

The event lead loads the private flag registry, then create the local review workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/git-security
~~~

No Git server or external repository access is required.

## Investigation / Tasks

Determine:

1. which commit introduced the secret,
2. whether the latest tree still contains it,
3. whether deletion alone makes the token safe,
4. what should happen first: history rewrite or credential rotation,
5. what .gitignore can and cannot prevent.

After identifying commit `b2` as the introduction point and recognizing that later deletion does not erase history, inspect `exposure-note.txt` and record the first dashboard flag.

After determining that credential rotation/revocation must happen before any optional history rewrite, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus the incident timeline, exposure explanation, remediation order, and prevention controls.

## Cleanup

~~~bash
./reset.sh
~~~