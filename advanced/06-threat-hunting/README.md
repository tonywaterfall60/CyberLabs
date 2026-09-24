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
Hypothesis → Required telemetry → Query → Correlate → Validate → Alternative explanation → Refine → Document
~~~

## Dataset

~~~text
challenge/events.jsonl
~~~

Everything is synthetic.

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

A workstation may have executed unusual encoded PowerShell and then performed related network or file activity.

Students should test the hypothesis rather than assume it is true.

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