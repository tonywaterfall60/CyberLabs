# Blue-Team Workflow

Use this directory after generating normal and cross-user activity in the range.

## Inspect Logs

~~~bash
jq . ../runtime/auth.jsonl
jq . ../runtime/api.jsonl
less ../runtime/edge-access.jsonl
~~~

## Questions

1. Which identity logged in?
2. What session ID was assigned?
3. Which document request was cross-user?
4. Was the request allowed or denied?
5. What request ID connects the API and edge records?
6. Which response status did the edge observe?

## Complete the Detector

Open:

~~~text
detect.py
~~~

Implement logic that alerts on allowed cross-user document access.

Requirements:

- do not hard-code alice or bob,
- do not hard-code object IDs,
- parse JSON properly,
- preserve enough event context for triage.

Run:

~~~bash
python3 detect.py
~~~

## Detection Write-Up

Document:

~~~text
Required fields:
Selection logic:
Severity:
False positives:
Triage steps:
Response:
~~~