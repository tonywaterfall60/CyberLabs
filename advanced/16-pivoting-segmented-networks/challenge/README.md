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

Use only `network-map.txt`, the documented training reachability, and the generated local workspace. Do not tunnel through real systems.

## Setup

The event lead loads the private flag registry, then creates the local path-analysis workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/advanced-pivoting
~~~

No live tunnel is required; reason from the provided network evidence.

## Investigation / Tasks

From the evidence identify:

- which host is dual-homed,
- which subnet is directly reachable from the analyst host,
- which subnet requires a pivot,
- what a SOCKS/SSH tunnel would change,
- why a tunnel is not proof of lateral compromise,
- which logs could reveal pivot behavior.

After identifying the dual-homed host and minimum path into the internal subnet, inspect `path-note.txt` and record the first dashboard flag.

After designing telemetry/detection for SSH, proxy/tunnel use, egress, and internal destination access, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus the routing diagram, pivot plan, assumptions, required credentials/trust, and detection ideas.

## Cleanup

~~~bash
./reset.sh
~~~
