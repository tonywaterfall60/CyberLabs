# Challenge — Fictional OSINT Investigation

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate |
| Estimated time | 75–105 minutes |
| Environment | Local fictional artifact set |
| Authorized scope | Provided fictional OSINT artifacts only |
| Goal | Build sourced conclusions while preserving provenance and uncertainty |
## Scenario

A fictional organization called **Northstar Robotics Club** has several public artifacts in this folder.

Your job is to answer specific intelligence questions using only those artifacts, document where each fact came from, and avoid conclusions the evidence cannot support.

## Authorized Scope

Everything is fictional.

Do **not** pivot usernames, names, domains, email addresses, or event details to real services or people.

## Setup

The event lead loads the private flag registry, then create the fictional investigation workspace:

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/osint-workshop
~~~

No external browsing is required. Work only with the generated local copies.

## Objectives / Tasks

### Files

~~~text
website.txt
social-posts.txt
conference-bio.txt
whois-summary.txt
event-flyer.txt
repository-profile.txt
~~~

### Phase 1 — Define the Questions

Answer:

1. What domain is associated with the organization?
2. Which public handles appear connected to it?
3. Which person is explicitly connected to which handle?
4. What is the likely showcase date and time?
5. Which facts are corroborated by more than one source?

### Phase 2 — Provenance Table

Create:

| Fact | Source | Exact evidence | Primary/secondary | Confidence |
|---|---|---|---|---|

Do not write a conclusion unless you can point to a source.

After completing the provenance table and linking every conclusion to a source, inspect `provenance-note.txt` and record the first dashboard flag.

### Phase 3 — Entity Map

Build an entity map connecting:

~~~text
organization
people
handles
domain
event
repository/project
~~~

Label each connection with the artifact that supports it.

### Phase 4 — Timeline

Create a timeline of public activity from the artifacts.

Include source provenance for each entry.

### Phase 5 — Corroboration

Choose three claims and classify each as:

~~~text
single-source
corroborated
conflicting
unresolved
~~~

### Phase 6 — Analytical Restraint

Write one conclusion that is strongly supported and one conclusion that would be irresponsible to make from the available data.

Explain why.

After completing the corroboration/confidence assessment and unsupported-conclusion exercise, inspect hidden files in the workspace and record the second dashboard flag.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard.

~~~text
Domain:
Handles:
Confirmed person/handle relationship:
Likely event date/time:

Entity map:
Timeline:
Provenance table:

Supported conclusion 1:
Supported conclusion 2:
Supported conclusion 3:

Unresolved uncertainty:
Unsupported/irresponsible conclusion:
Confidence notes:
~~~

## Cleanup

~~~bash
./reset.sh
~~~