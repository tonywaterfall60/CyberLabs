# Advanced 06 — Threat Hunting

**Difficulty:** Advanced  
**Estimated time:** 120 minutes  
**Prerequisites:** Intermediate Log Analysis + Advanced Network Analysis  
**Environment:** Kali Linux, jq, grep/ripgrep, base64, Python optional

## Why This Event Exists

Threat hunting is a structured search for suspicious behavior based on a hypothesis. It is not simply searching logs for bad words.

## Learning Objectives

- write a testable hunting hypothesis
- identify required telemetry
- query JSON-lines data
- correlate process, network, and file activity
- decode harmless training content
- identify alternative explanations
- state confidence
- request additional evidence

## Hunting Workflow

~~~text
Hypothesis
   ↓
Expected observable behavior
   ↓
Required telemetry / fields
   ↓
Baseline environment
   ↓
Query
   ↓
Correlate sequence
   ↓
Compare against benign cases
   ↓
Competing explanations
   ↓
Refine hunt
   ↓
Outcome / confidence
~~~

Advanced hunting should begin with a falsifiable hypothesis and end with a defensible outcome—not with a keyword search.

## Dataset

~~~text
challenge/events.jsonl
challenge/HUNT_WORKSHEET.md
~~~

Everything is synthetic.

The dataset now includes process, DNS, network, file, registry, and comparison-case activity so students can evaluate a sequence rather than one suspicious string.

## Useful Commands

PowerShell processes:

~~~bash
jq 'select(.event == "process" and .image == "powershell.exe")' challenge/events.jsonl
~~~

Search encoded usage:

~~~bash
grep -i encoded challenge/events.jsonl
~~~

Decode the provided harmless Base64 only after identifying it:

~~~bash
echo '<training-value>' | base64 -d
~~~

## Challenge Hypothesis

A workstation may have executed unusual encoded PowerShell and then performed related network, file, child-process, DNS, or registry activity.

Students must compare that sequence against a separate PowerShell case that looks more like scheduled administration before deciding how strongly to classify the hunt result.

## Deliverable

~~~text
Hypothesis:
Data used:
Query/filter:
Suspicious sequence:
Evidence:
Alternative explanation:
Additional telemetry needed:
Confidence:
~~~

## Next Event

[Advanced 07 — Detection Engineering](../07-detection-engineering/)