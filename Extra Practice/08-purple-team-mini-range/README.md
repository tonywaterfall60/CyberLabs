# Extra Practice 08 — Purple-Team Mini Range

**Difficulty:** Advanced  
**Estimated time:** 2–3 hours  
**Environment:** Kali Linux + Docker  
**Tools:** Burp Suite, curl, jq, grep, Python  
**Infrastructure:** Nginx edge proxy + portal + internal API + shared structured telemetry

## Scenario

A small internal document portal is being reviewed by both offensive and defensive analysts.

The environment has a user-facing portal, a separate internal API, an edge reverse proxy, session-based authentication, structured authentication logs, structured API access logs, and reverse-proxy access logs.

The red side must validate a controlled authorization weakness. The blue side must determine what the same activity looks like in telemetry and design a detection. The purple-team objective is to connect the two views.

## Scope

Authorized target:

~~~text
http://127.0.0.1:8760
~~~

Authorized evidence:

~~~text
runtime/
~~~

Do not scan unrelated ports or systems.

## Infrastructure

~~~text
Browser / Burp / curl
        |
  127.0.0.1:8760
        |
   Nginx Edge
      /     \
     /       \
 Portal     API
 :5000      :5001
     \       /
      \     /
    ep08_range
        |
   shared logs
      runtime/
~~~

Only the Nginx edge is exposed to the Kali host. Portal and API containers are internal-only.

## Telemetry

After activity begins, runtime/ contains:

~~~text
auth.jsonl
api.jsonl
edge-access.jsonl
~~~

Each log answers a different question.

## Setup

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
~~~

Verify:

~~~bash
docker compose ps
curl -I http://127.0.0.1:8760/
ls -l runtime
~~~

If an instructor injects a private event flag, it is provided at runtime and is not stored in this repository.

## Training Accounts

The portal provides links for alice and bob. Password mechanics are intentionally out of scope.

# Phase 1 — Establish Normal Behavior

Before modifying anything, log in as Alice, open Alice's normal document, capture the request in Burp, record object ID and owner, and observe the resulting logs.

Repeat with Bob if useful.

Create a baseline:

~~~text
User
Own document ID
Expected owner
Request path
HTTP status
API log event
Edge log event
~~~

## Phase 2 — Application Mapping

Map visible portal routes, API status, document API route, cookies, headers, and response formats.

Do not brute-force broad content.

## Phase 3 — Controlled Authorization Test

Send Alice's normal document request to Burp Repeater.

Change only the document ID to Bob's known document ID.

Before sending, write:

~~~text
Expected secure behavior:
Evidence that would prove authorization failed:
~~~

Send the modified request once.

If cross-user content is returned, preserve the exact request, exact response, authenticated identity, requested object, actual owner, and timestamp.

Do not enumerate large ranges of IDs.

## Phase 4 — Red-Team Finding

Write:

~~~text
Baseline:
Modified request:
Observed behavior:
Security control that failed:
Impact:
Reproduction:
Remediation:
~~~

The completion flag, if configured, is supporting challenge evidence—not the vulnerability itself.

# Phase 5 — Blue-Team Baseline

Inspect:

~~~bash
jq . runtime/auth.jsonl
jq . runtime/api.jsonl
less runtime/edge-access.jsonl
~~~

Determine what normal login, API access, and document access look like.

## Phase 6 — Correlate the Red Action

Find the cross-user request across edge-access.jsonl and api.jsonl.

Answer which user made the request, which document was requested, who owned it, whether the API allowed it, approximate request timestamp, and HTTP status observed at the edge.

## Phase 7 — Detection Design

Create detection logic for an authenticated user accessing a document owned by another user while the API allows it.

Document:

~~~text
Required fields:
Selection logic:
Severity:
False positives:
Triage steps:
Recommended response:
~~~

Consider whether legitimate delegated or admin access could exist in a real system.

## Phase 8 — Starter Detector

Open blue/detect.py and complete the TODO sections so it reads runtime/api.jsonl and prints an alert for allowed cross-user document access.

Do not hard-code a username or document ID.

## Phase 9 — Purple-Team Review

Build this chain:

~~~text
Red request
  ↓
Edge log
  ↓
API decision
  ↓
API log
  ↓
Detection
  ↓
Server-side authorization fix
~~~

Answer what Red could see, what Blue could see, which fields connected their evidence, which useful field is missing, what preventative control fixes the root cause, and which detection remains useful after remediation.

## Deliverable

### Red

~~~text
Baseline request:
Modified request:
Evidence:
Impact:
Remediation:
~~~

### Blue

~~~text
Relevant edge event:
Relevant API event:
Detection logic:
False positives:
Triage:
~~~

### Purple

~~~text
Correlated timeline:
Visibility gaps:
Additional logging:
Preventative control:
Residual detection value:
~~~

## Cleanup

~~~bash
./reset.sh
~~~

This stops containers and removes the local runtime log directory.