# Challenge — API Mapping and Authorization

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate |
| Estimated time | 50–60 minutes |
| Environment | Static JSON API transcript |
| Authorized scope | api-transcript.txt only |
| Goal | Map an API and identify one object-authorization failure |

## Scenario

A fictional notes API captured several authenticated requests for review.

## Authorized Scope

Analyze only the provided transcript and generated local workspace.

## Setup

The event lead loads the private flag registry, then create the local review workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/api-security
~~~

No live API is required.

## Investigation / Tasks

1. Map the routes and methods shown.
2. Identify which token belongs to Alice and Bob.
3. Establish Alice's normal note request.
4. Identify the cross-user note request.
5. Explain whether authentication succeeded.
6. Explain whether authorization succeeded.
7. Recommend server-side ownership validation and useful logging.

After mapping the endpoints/tokens and establishing Alice's baseline request, inspect `endpoint-map-note.txt` and record the first dashboard flag.

After identifying the cross-user object access and explaining the authorization failure, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus the endpoint map, baseline, authorization finding, impact, evidence, remediation, and detection idea.

## Cleanup

~~~bash
./reset.sh
~~~
