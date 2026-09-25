# Challenge — Application Mapping with Burp Suite

**Difficulty:** Intermediate  
**Estimated time:** 90–120 minutes  
**Target:** `http://127.0.0.1:8200`

## Goal

Build a defensible application map using normal browsing, Burp, targeted route discovery, and manual validation.

At this level, you should choose the next tool based on the question you are trying to answer.

## Scope

Only test:

~~~text
127.0.0.1:8200
~~~

Do not point Burp, Gobuster, ffuf, Nikto, or other scanners at unrelated systems.

## Phase 1 — Baseline Browsing

Browse the application before discovery tooling.

Record visible:

- routes,
- links,
- query parameters,
- cookies,
- response types,
- API endpoints.

## Phase 2 — Burp Proxy

Proxy Firefox through:

~~~text
127.0.0.1:8080
~~~

Capture at least:

~~~text
GET /
GET /search?q=training
GET /feedback
POST /feedback
GET /api/status
~~~

For each identify method, path, query/body parameters, cookie, content type, status, and useful response headers.

## Phase 3 — Repeater

Send the search request to Repeater and change only `q`.

Then send one feedback POST request to Repeater and change only one form value.

Explain why changing one input at a time makes the result easier to interpret.

## Phase 4 — Content Discovery

Use the provided wordlist with Gobuster or ffuf.

~~~bash
gobuster dir -u http://127.0.0.1:8200 -w wordlist.txt
~~~

or:

~~~bash
ffuf -u http://127.0.0.1:8200/FUZZ -w wordlist.txt
~~~

Record status, size, and whether the route was already visible.

## Phase 5 — Manual Validation

Manually validate every interesting discovery with browser, curl, or Burp.

Important routes include:

~~~text
/api/v1/projects
/admin
/debug-info
/internal/build
/robots.txt
~~~

Do not label a route vulnerable solely because it is hidden or internal-looking.

## Phase 6 — Trust Boundary Map

Create a simple diagram showing:

~~~text
Browser
  ↓
Web application
  ├── HTML routes
  ├── form submission
  └── JSON API
~~~

Label:

- user-controlled query data,
- user-controlled POST body data,
- cookie state,
- restricted functionality,
- unlinked/internal-style functionality.

## Phase 7 — Prioritize Further Testing

Choose three areas you would test more deeply in a later security assessment.

For each state:

~~~text
Why it is interesting:
What evidence you currently have:
What security question remains:
What test category would come next:
~~~

Do not perform exploitation in this event.

## Optional — Nikto

If used, run only against the challenge and manually validate anything interesting.

## Deliverable

| Method | Route | Parameters | Discovery source | Status | Cookie/Header | Purpose | Security question |
|---|---|---|---|---:|---|---|---|

Also submit:

~~~text
Trust-boundary diagram:
Three prioritized test areas:
One automated result you manually validated:
One observation:
One inference:
One unknown:
~~~

## Cleanup

~~~bash
docker compose down
~~~

Restore browser proxy settings.