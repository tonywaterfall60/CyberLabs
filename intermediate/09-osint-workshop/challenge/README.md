# Challenge — Fictional OSINT Investigation

**Difficulty:** Intermediate  
**Estimated time:** 75–105 minutes

## Scenario

A fictional organization called **Northstar Robotics Club** has several public artifacts in this folder.

Your job is to answer specific intelligence questions using only those artifacts, document where each fact came from, and avoid conclusions the evidence cannot support.

## Scope

Everything is fictional.

Do **not** pivot usernames, names, domains, email addresses, or event details to real services or people.

## Files

~~~text
website.txt
social-posts.txt
conference-bio.txt
whois-summary.txt
event-flyer.txt
repository-profile.txt
~~~

## Phase 1 — Define the Questions

Answer:

1. What domain is associated with the organization?
2. Which public handles appear connected to it?
3. Which person is explicitly connected to which handle?
4. What is the likely showcase date and time?
5. Which facts are corroborated by more than one source?

## Phase 2 — Provenance Table

Create:

| Fact | Source | Exact evidence | Primary/secondary | Confidence |
|---|---|---|---|---|

Do not write a conclusion unless you can point to a source.

## Phase 3 — Entity Map

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

## Phase 4 — Timeline

Create a timeline of public activity from the artifacts.

Include source provenance for each entry.

## Phase 5 — Corroboration

Choose three claims and classify each as:

~~~text
single-source
corroborated
conflicting
unresolved
~~~

## Phase 6 — Analytical Restraint

Write one conclusion that is strongly supported and one conclusion that would be irresponsible to make from the available data.

Explain why.

## Deliverable

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