# Challenge — Build and Test Detection Logic

Files:

- `process_events.jsonl`
- `auth_events.jsonl`
- `starter-rule.yml`

## Detection 1

Alert when:

- process is PowerShell
- command line contains encoded-command behavior
- parent is an Office-like application

## Detection 2

Alert when:

- the same user/source produces multiple failures
- followed by a successful login
- within a short period

## Tasks

1. Complete `starter-rule.yml`.
2. Write plain-English logic for both detections.
3. Use `jq`, Python, or shell commands to test the dataset.
4. Identify possible false positives.
5. Write triage questions.
6. Assign a severity and justify it.

## Goal

Detection quality matters more than matching a particular syntax.
