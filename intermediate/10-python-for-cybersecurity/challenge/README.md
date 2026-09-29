# Challenge — Build a Multi-Source Analyst Parser

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate |
| Estimated time | 75–105 minutes |
| Environment | Kali + Python 3 + local logs |
| Authorized scope | auth.log, app.log, and parser.py in this challenge |
| Goal | Build a reusable parser for multi-source analyst summaries |
## Scenario

Complete a Python script that turns local authentication and application logs into a useful analyst summary.

## Authorized Scope

Work only with the local challenge files. Do not add network activity or real log sources.

## Setup

The event lead loads the private flag registry, then prepares ignored runtime artifacts:

~~~bash
chmod +x prepare-flags.sh
./prepare-flags.sh
~~~

Python 3 is sufficient.

## Objectives / Tasks

### Files

~~~text
auth.log
app.log
parser.py
~~~

### Requirements

Your script should:

1. parse key=value fields safely,
2. count failed logins by user,
3. count failed logins by source IP,
4. collect successful login events,
5. identify the most frequent failed-login source,
6. correlate successful sessions with application actions,
7. print a short summary.

### Phase 1 — Understand the Input

Before coding, inspect both logs and write down their schemas.

Identify shared correlation fields.

### Phase 2 — Complete the Parser

Run:

~~~bash
python3 parser.py auth.log app.log
~~~

Do not hard-code usernames, sources, or session IDs.

### Phase 3 — Error Handling

Your script should tolerate:

- blank lines,
- unknown fields,
- lines without a session value,
- extra whitespace.

### Phase 4 — Output

Default output should show:

~~~text
Failed logins by user
Failed logins by source
Successful sessions
Most common failed source
Application actions per successful session
~~~

Once your parser produces the required analyst summary, inspect `runtime/parser-complete.txt` and record the first dashboard flag.

### Stretch Goals

- `--user <name>` filter
- `--json` output
- sort counters by count
- flag sessions containing sensitive actions such as export/download
- write a reusable `parse_kv_fields()` function

After documenting one example where automation improved the analysis and one limitation of the script, inspect `runtime/automation-note.txt` and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard, plus:

- completed parser.py,
- sample output,
- one example where automation was better than manual analysis,
- one limitation of the script.

Do not add network activity; this challenge is local file analysis only.

## Cleanup

Remove generated runtime material when finished:

~~~bash
rm -rf runtime
~~~