# Challenge — Segmented Network Path Analysis

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 75–90 minutes |
| Environment | Static routing/reachability evidence |
| Authorized scope | network-map.txt |
| Goal | Determine the minimum path needed to reach the internal subnet |

## Scenario

A fictional analyst host can reach a jump host, but the target application subnet is reachable only from the jump host.

## Authorized Scope

Use only network-map.txt and the documented training reachability. Do not tunnel through real systems.

## Setup

No live tunnel is required; reason from the provided network evidence.

## Investigation / Tasks

From the evidence identify:

- which host is dual-homed,
- which subnet is directly reachable from the analyst host,
- which subnet requires a pivot,
- what a SOCKS/SSH tunnel would change,
- why a tunnel is not proof of lateral compromise,
- which logs could reveal pivot behavior.

## Deliverable

Submit routing diagram, pivot plan, assumptions, required credentials/trust, and detection ideas.

## Cleanup

No cleanup is required.
