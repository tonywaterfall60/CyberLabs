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

Use only `Dockerfile.training` and `compose.training.yml`. No live container or host modification is required.

## Setup

No runtime is required.

## Investigation / Tasks

Identify the base image, default user, exposed/published port, bind mount, environment variable, one risk from running as root, and one risk from a broad host mount.

Then propose a safer configuration.

## Deliverable

Submit a table with Setting, What it does, Security concern, and Safer alternative.

## Cleanup

No cleanup is required.
