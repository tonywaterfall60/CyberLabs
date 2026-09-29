# Challenge — Wireless Management-Frame Timeline

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate |
| Estimated time | 50–60 minutes |
| Environment | Static synthetic 802.11 event export |
| Authorized scope | frames.csv only |
| Goal | Reconstruct AP/client behavior and security posture |

## Scenario

A fictional wireless event export contains management-frame activity from several training access points and clients. Reconstruct what happened without interacting with any live wireless network.

## Authorized Scope

Offline evidence and the generated local workspace only. No live wireless scanning, monitor mode, deauthentication, or password attacks.

## Setup

The event lead loads the private flag registry, then create the local evidence workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/wireless-analysis
~~~

## Investigation / Tasks

Build:

~~~text
SSID/BSSID/channel/security inventory
client probe timeline
authentication/association timeline
observed/inferred/unknown
~~~

Explain why a directed probe may reveal a preferred SSID and why that does not prove compromise.

After reconstructing the client/AP timeline, inspect `timeline-note.txt` and record the first dashboard flag.

After documenting the evidence limitations and what the capture cannot prove, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus the inventory, timeline, privacy observation, and additional evidence needed.

## Cleanup

~~~bash
./reset.sh
~~~
