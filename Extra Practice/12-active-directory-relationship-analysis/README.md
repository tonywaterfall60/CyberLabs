# Extra Practice 12 — Active Directory Relationship Analysis

**Difficulty:** Advanced  
**Estimated time:** 90–120 minutes  
**Environment:** Kali Linux  
**Tools:** csvkit optional, grep, awk, Python, graphing on paper or diagrams  
**Infrastructure:** fictional exported Active Directory relationship data

## Scenario

An identity team exported a subset of Active Directory relationship data after noticing that several ordinary users may inherit more privilege than intended.

You are not working against a live domain.

Your job is to reconstruct privilege relationships and determine which paths deserve remediation.

## Scope

Use only the CSV files in this directory.

Do not pivot names, SPNs, hosts, or domains to real environments.

## Evidence

~~~text
users.csv
groups.csv
memberships.csv
spns.csv
delegation.csv
local-admin.csv
~~~

## Phase 1 — Inventory

Identify all users, service accounts, privileged groups, and systems.

Separate human users from service identities.

## Phase 2 — Direct Membership

Map direct user-to-group relationships.

Do not stop at direct membership.

## Phase 3 — Nested Groups

Trace nested membership paths.

Create a graph where each edge is labeled with the relationship that caused it.

## Phase 4 — Service Accounts

Review SPN-bearing accounts and their group memberships.

Answer:

- Which service accounts hold privileged membership?
- Which service accounts are managed by other groups?
- Which relationships would require validation in a real domain?

## Phase 5 — Delegation / Management Paths

Review delegation.csv and local-admin.csv.

Build at least three possible privilege paths.

For every edge label it:

~~~text
Observed
Inferred
Requires validation
~~~

## Phase 6 — Prioritization

Prioritize paths based on:

- privilege gained,
- number of hops,
- service-account sensitivity,
- nested membership,
- breadth of affected systems.

## Phase 7 — Remediation

Recommend concrete changes such as removing unnecessary nesting, reducing service-account privilege, separating admin identities, narrowing delegated rights, and monitoring privileged-group changes.

## Deliverable

~~~text
Privileged groups:
Privileged users:
Privileged service accounts:

Path 1:
Path 2:
Path 3:

Observed edges:
Inferred edges:
Validation required:

Highest-priority remediation:
Monitoring recommendations:
~~~