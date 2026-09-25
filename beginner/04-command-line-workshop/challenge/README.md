# Challenge — Authentication Log Analysis

**Difficulty:** Beginner  
**Estimated time:** 40–55 minutes  
**Goal:** Turn a raw authentication log into useful information using shell pipelines.

## Scenario

A small help-desk team received a larger authentication log and needs a quick summary before escalating the case.

Your job is to use small command-line tools together rather than manually counting lines.

## Setup

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/cli-challenge
~~~

Generated files:

~~~text
auth.log
hosts.csv
~~~

## Rules

- Do not manually count entries.
- Record every pipeline you use.
- Build complex pipelines one command at a time.
- Check intermediate output before adding another pipe.

## Phase 1 — Basic Filtering

1. Display all `FAILED_LOGIN` events.
2. Count failed-login events.
3. Display all `LOGIN_SUCCESS` events.
4. Count successful logins.

## Phase 2 — Username Analysis

Determine which username appears most often in failed logins.

Suggested building blocks:

~~~text
grep
cut
sort
uniq -c
sort -nr
~~~

Do not hard-code the username.

## Phase 3 — Source Analysis

1. Display only source-IP fields from failed events.
2. Remove the `source=` prefix.
3. Sort the addresses.
4. Count how often each source appears.

## Phase 4 — Save Evidence

Create:

~~~text
failed.txt
failed-count.txt
failed-sources.txt
~~~

`failed.txt` should contain all failed events.

`failed-count.txt` should contain only the failed-event count.

`failed-sources.txt` should contain one source IP per line, sorted.

## Phase 5 — CSV Practice

Use `hosts.csv` to:

1. display only hostnames,
2. display only IP addresses,
3. display only port numbers,
4. sort the hostnames alphabetically.

## Phase 6 — Build a Summary

Create `summary.txt` containing:

~~~text
Failed login count: <number>
Successful login count: <number>
Most targeted user: <user>
Most common failed source: <ip>
~~~

You may use `echo`, command substitution, and redirection if comfortable.

## Deliverable

Submit:

~~~text
Failed count:
Success count:
Most targeted user:
Most common failed source:

Pipelines used:

Files created:
failed.txt
failed-count.txt
failed-sources.txt
summary.txt
~~~

## Cleanup

~~~bash
./reset.sh
~~~

## Key Takeaway

A pipeline is easier to trust when you understand what every stage does. Build it gradually and validate intermediate output.