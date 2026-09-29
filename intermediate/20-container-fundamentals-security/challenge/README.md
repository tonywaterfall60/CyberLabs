# Challenge — Read the Container Definition

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate |
| Estimated time | 45–60 minutes |
| Environment | Static Dockerfile + Compose evidence |
| Authorized scope | Dockerfile.training and compose.training.yml |
| Goal | Identify container boundaries and basic security concerns |

## Scenario

A development team provided a training Dockerfile and Compose definition for review. Identify the container boundaries and basic security implications before anything is deployed.

## Authorized Scope

Use only the provided Dockerfile/Compose evidence and generated local workspace. No live container or host modification is required.

## Setup

The event lead loads the private flag registry, then create the local review workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/container-security
~~~

No live container runtime is required for the challenge.

## Investigation / Tasks

Identify the base image, default user, exposed/published port, bind mount, environment variable, one risk from running as root, and one risk from a broad host mount.

Then propose a safer configuration.

After mapping image/container, published-port, bind-mount, user, and environment boundaries, inspect `boundary-note.txt` and record the first dashboard flag.

After identifying the root-default, broad mount, and plaintext environment-secret concerns and proposing safer alternatives, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus a table with Setting, What it does, Security concern, and Safer alternative.

## Cleanup

~~~bash
./reset.sh
~~~
