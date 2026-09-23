# Intermediate 02 — Web Enumeration

**Difficulty:** Intermediate  
**Estimated time:** 90–120 minutes  
**Prerequisites:** Intermediate 01  
**Environment:** Kali Linux, Burp Suite, Gobuster/ffuf, curl, browser, Docker

## Why This Event Exists

Before testing a web application, an analyst needs to understand its attack surface. This event teaches systematic mapping of routes, methods, parameters, APIs, headers, cookies, and trust boundaries using tools members already have in Kali.

This is the first event where **Burp Suite** becomes a primary tool rather than an optional demonstration.

## Learning Objectives

Members should be able to:

- configure a browser to proxy through Burp Suite
- capture and inspect HTTP requests in Burp Proxy
- send a request to Burp Repeater
- modify a request safely against the local lab
- map visible and discoverable application routes
- use Gobuster or ffuf with an instructor-provided wordlist
- inspect cookies, headers, parameters, and status codes
- distinguish public, restricted, and hidden functionality
- create an application attack-surface map

## Kali Tools Used

| Tool | Purpose |
|---|---|
| Burp Suite | intercept and inspect HTTP requests |
| Burp Repeater | resend and modify individual requests |
| Gobuster | discover routes using a wordlist |
| ffuf | alternative content discovery |
| curl | quick manual HTTP validation |
| Firefox | normal application browsing |

## Enumeration Workflow

```text
Browse normally
  ↓
Proxy through Burp
  ↓
Inspect requests/responses
  ↓
Map known routes
  ↓
Run targeted content discovery
  ↓
Validate discoveries manually
  ↓
Identify parameters/cookies/headers
  ↓
Map trust boundaries
  ↓
Prioritize test areas
```

## Start the Lab

```bash
cd challenge
docker compose up --build -d
```

Target:

```text
http://127.0.0.1:8200
```

This is the only web target in scope for this event.

---

## Part 1 — Burp Suite Setup

Launch Burp Suite from Kali:

```bash
burpsuite
```

Burp normally listens on:

```text
127.0.0.1:8080
```

Configure the lab browser to use that HTTP proxy.

A common workflow is:

```text
Firefox
  ↓
127.0.0.1:8080
  ↓
Burp Proxy
  ↓
127.0.0.1:8200
```

For this local HTTP challenge, certificate installation is not required.

### Burp Tasks

1. Turn **Intercept ON**.
2. Browse to the challenge.
3. Observe the captured request.
4. Forward it.
5. Turn **Intercept OFF** for normal browsing.
6. Review requests in **HTTP history**.

Identify:

- method
- path
- Host header
- User-Agent
- cookies
- response status
- response headers

---

## Part 2 — Burp Repeater

Choose a request such as:

```text
GET /search?q=training
```

Send it to **Repeater**.

Change:

```text
q=training
```

to another harmless value.

Send the request again.

Observe what changed in the response.

The goal is to understand request manipulation—not to exploit the application.

---

## Part 3 — Content Discovery with Gobuster

A challenge-specific wordlist is included.

Run:

```bash
gobuster dir   -u http://127.0.0.1:8200   -w wordlist.txt
```

Record:

- discovered route
- status code
- whether it was linked from the normal interface

Do not point Gobuster at any target other than the challenge URL.

---

## Part 4 — Alternative Discovery with ffuf

Kali also includes ffuf.

```bash
ffuf   -u http://127.0.0.1:8200/FUZZ   -w wordlist.txt
```

Compare the output with Gobuster.

Discuss:

- similarities
- differences in output
- when one tool may be easier to use

---

## Part 5 — Manual Validation

Use curl to validate discoveries:

```bash
curl -i http://127.0.0.1:8200/
curl -i http://127.0.0.1:8200/api/status
curl -i 'http://127.0.0.1:8200/search?q=training'
curl -i http://127.0.0.1:8200/admin
curl -i http://127.0.0.1:8200/robots.txt
```

Never treat automated discovery output as proof by itself. Validate it.

---

## Application Map Template

```text
Route:
Method:
Parameters:
Discovered by:
Authentication required?
Observed status:
Cookies/headers:
Purpose:
Security questions:
```

## Challenge

See:

```text
challenge/README.md
```

The challenge now expects members to use both Burp Suite and at least one content-discovery tool.

## Cleanup

```bash
docker compose down
```

Close Burp or return the browser proxy settings to normal before using the browser for unrelated activity.

## Next Event

[Intermediate 03 — OWASP Top 10 Workshop](../03-owasp-top-10/)
