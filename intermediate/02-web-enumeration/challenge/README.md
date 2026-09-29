# Challenge — Application Mapping with Burp Suite

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Intermediate |
| Estimated time | 90–120 minutes |
| Environment | Kali + Docker + Burp Suite |
| Authorized scope | http://127.0.0.1:8200 only |
| Goal | Build and prioritize a defensible application map |
## Scenario

Build a defensible application map using normal browsing, Burp, targeted route discovery, and manual validation.

At this level, you should choose the next tool based on the question you are trying to answer.

## Authorized Scope

Only test:

~~~text
127.0.0.1:8200
~~~

Do not point Burp, Gobuster, ffuf, Nikto, or other scanners at unrelated systems.

## Setup

The event lead loads the private flag registry, then prepares runtime artifacts before starting the app:

~~~bash
chmod +x prepare-flags.sh
./prepare-flags.sh
docker compose up --build -d
~~~

Verify the application before beginning enumeration:

~~~bash
curl -I http://127.0.0.1:8200/
~~~

## Objectives / Tasks

### Phase 1 — Baseline Browsing

Browse the application before discovery tooling.

Record visible:

- routes,
- links,
- query parameters,
- cookies,
- response types,
- API endpoints.

### Phase 2 — Burp Proxy

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

### Phase 3 — Repeater

Send the search request to Repeater and change only `q`.

Then send one feedback POST request to Repeater and change only one form value.

Explain why changing one input at a time makes the result easier to interpret.

### Phase 4 — Content Discovery

Use the provided wordlist with Gobuster or ffuf.

~~~bash
gobuster dir -u http://127.0.0.1:8200 -w wordlist.txt
~~~

or:

~~~bash
ffuf -u http://127.0.0.1:8200/FUZZ -w wordlist.txt
~~~

Record status, size, and whether the route was already visible.

### Phase 5 — Manual Validation

Manually validate every interesting discovery with browser, curl, or Burp.

Important routes include:

~~~text
/api/v1/projects
/admin
/debug-info
/internal/build
/robots.txt
~~~

The route-discovery process should also reveal a training map-note endpoint. Record the flag returned there after you validate it manually.

Do not label a route vulnerable solely because it is hidden or internal-looking.

### Phase 6 — Trust Boundary Map

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

The internal build/debug surface links to a trust-boundary review artifact. Inspect it after completing the trust-boundary map and record the second dashboard flag.

### Phase 7 — Prioritize Further Testing

Choose three areas you would test more deeply in a later security assessment.

For each state:

~~~text
Why it is interesting:
What evidence you currently have:
What security question remains:
What test category would come next:
~~~

Do not perform exploitation in this event.

### Optional — Nikto

If used, run only against the challenge and manually validate anything interesting.

## Deliverable

| Method | Route | Parameters | Discovery source | Status | Cookie/Header | Purpose | Security question |
|---|---|---|---|---:|---|---|---|

Submit both discovered flags to the CyberLabs dashboard.

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
rm -rf runtime
~~~

Restore browser proxy settings.