# Challenge — Map HTTP Behavior

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate |
| Estimated time | 50–60 minutes |
| Environment | Static HTTP request/response transcript |
| Authorized scope | http-transcript.txt only |
| Goal | Explain method, status, header, cookie, cache, and CORS behavior |

## Scenario

A fictional application produced a captured set of HTTP exchanges.

## Authorized Scope

Analyze only the provided transcript and generated local review workspace.

## Setup

The event lead loads the private flag registry, then create the local review workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/http-deep-dive
~~~

## Investigation / Tasks

For each exchange identify:

- method,
- status code,
- content type,
- redirect behavior,
- cache policy,
- cookie creation/use,
- CORS behavior.

Then explain why CORS is not authentication or authorization.

After completing the method/status/header/cookie/cache/redirect matrix, inspect `behavior-note.txt` and record the first dashboard flag.

After explaining the CORS/browser-policy boundary and its difference from server-side authorization, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus a route/method matrix and three security implications.

## Cleanup

~~~bash
./reset.sh
~~~
