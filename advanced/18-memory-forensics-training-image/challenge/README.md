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

Use only image-manifest.txt and volatility-summary.txt unless an instructor separately supplies an authorized training image.

## Setup

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

If an instructor provides a real training image separately, reproduce equivalent evidence with Volatility 3.

## Deliverable

Submit acquisition context, timeline, hypothesis, alternate explanation, additional evidence requested, and confidence.

## Cleanup

No cleanup is required for the repository evidence.
