# Challenge — Build a Multi-Source Analyst Parser

**Difficulty:** Intermediate  
**Estimated time:** 75–105 minutes

## Goal

Complete a Python script that turns local authentication and application logs into a useful analyst summary.

## Files

~~~text
auth.log
app.log
parser.py
~~~

## Requirements

Your script should:

1. parse key=value fields safely,
2. count failed logins by user,
3. count failed logins by source IP,
4. collect successful login events,
5. identify the most frequent failed-login source,
6. correlate successful sessions with application actions,
7. print a short summary.

## Phase 1 — Understand the Input

Before coding, inspect both logs and write down their schemas.

Identify shared correlation fields.

## Phase 2 — Complete the Parser

Run:

~~~bash
python3 parser.py auth.log app.log
~~~

Do not hard-code usernames, sources, or session IDs.

## Phase 3 — Error Handling

Your script should tolerate:

- blank lines,
- unknown fields,
- lines without a session value,
- extra whitespace.

## Phase 4 — Output

Default output should show:

~~~text
Failed logins by user
Failed logins by source
Successful sessions
Most common failed source
Application actions per successful session
~~~

## Stretch Goals

- `--user <name>` filter
- `--json` output
- sort counters by count
- flag sessions containing sensitive actions such as export/download
- write a reusable `parse_kv_fields()` function

## Deliverable

Submit:

- completed parser.py,
- sample output,
- one example where automation was better than manual analysis,
- one limitation of the script.

Do not add network activity; this challenge is local file analysis only.