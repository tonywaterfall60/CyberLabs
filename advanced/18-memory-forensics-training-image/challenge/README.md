# Challenge — Memory Evidence Correlation

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 75–90 minutes |
| Environment | Pre-exported Volatility-style evidence |
| Authorized scope | image-manifest.txt and volatility-summary.txt |
| Goal | Build a defensible memory-forensics hypothesis |

## Scenario

A fictional Windows memory acquisition was pre-processed into a small set of Volatility-style findings for repository use.

## Authorized Scope

Use only `image-manifest.txt`, `volatility-summary.txt`, and the generated local workspace unless an instructor separately supplies an authorized training image.

## Setup

The event lead loads the private flag registry, then creates the local memory-forensics workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/advanced-memory-forensics
~~~

No full memory image is required for the repository version.

## Investigation / Tasks

Correlate:

~~~text
process tree
command line
network socket
file object
memory region
~~~

Identify one suspicious sequence and one plausible alternative explanation.

After correlating the process tree, command line, socket, file object, and executable memory region, inspect `sequence-note.txt` and record the first dashboard flag.

After stating a defensible confidence level and the disk/EDR/log evidence still needed, inspect hidden files in the workspace and record the second dashboard flag.

If an instructor provides a real training image separately, reproduce equivalent evidence with Volatility 3.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus acquisition context, timeline, hypothesis, alternate explanation, additional evidence requested, and confidence.

## Cleanup

~~~bash
./reset.sh
~~~
