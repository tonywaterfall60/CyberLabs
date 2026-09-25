# Beginner 07 — Web Security Basics

**Difficulty:** Beginner  
**Estimated time:** 75–90 minutes  
**Prerequisites:** Beginner 03–06  
**Environment:** Kali Linux, Firefox, curl, Docker; optional Burp Suite preview

## Why This Event Exists

Web applications are a major part of modern cybersecurity. This event focuses on normal HTTP behavior first, then gives members a short preview of Burp Suite before it becomes a primary Intermediate tool.

## Learning Objectives

Members should be able to:

- explain HTTP requests and responses
- distinguish GET and POST conceptually
- identify URL paths, headers, and status codes
- inspect requests with browser developer tools
- use curl to inspect raw responses
- explain cookies and sessions at a basic level
- distinguish authentication and authorization
- understand what an intercepting proxy does
- preview Burp Suite safely against the local lab

## Kali Tools Introduced

| Tool | Purpose |
|---|---|
| Firefox Developer Tools | inspect browser traffic |
| curl | manually inspect HTTP |
| Burp Suite | optional intercepting-proxy preview |

## Guided Lab

Start:

~~~bash
cd challenge
docker compose up --build -d
~~~

Target:

~~~text
http://127.0.0.1:8070
~~~

## Beginner HTTP Workflow

For each page, ask:

~~~text
What did I request?
How did I request it?
What status came back?
What type of content came back?
Which headers describe the request/response?
Did the browser store any state?
~~~

### Task 1 — Developer Tools

Open the Network tab.

Visit several routes and record:

- method,
- path,
- status,
- content type,
- one request header,
- one response header.

### Task 2 — curl

~~~bash
curl -i http://127.0.0.1:8070/
curl -i http://127.0.0.1:8070/api/status
curl -i http://127.0.0.1:8070/admin
curl -i http://127.0.0.1:8070/robots.txt
~~~

Compare:

~~~text
HTML
JSON
plain text
403 response
~~~

## Optional Burp Suite Preview

Launch:

```bash
burpsuite
```

Explain:

```text
Browser
  ↓
Burp Proxy
  ↓
Local training application
```

If time allows, configure Firefox to proxy HTTP through:

```text
127.0.0.1:8080
```

Burp uses port 8080 as the proxy listener; the training application itself runs on port 8070.

Then visit the local challenge and use Burp only to:

1. capture one request,
2. identify method/path/headers,
3. forward the request,
4. view it in HTTP history.

Do not introduce exploitation yet.

Intermediate Web Enumeration covers Repeater and content discovery.

## Cookie / Session-State Demonstration

The challenge now sets a harmless training cookie.

Save it:

~~~bash
curl -i -c cookies.txt http://127.0.0.1:8070/
~~~

Send it back:

~~~bash
curl -i -b cookies.txt http://127.0.0.1:8070/session-demo
~~~

Use this to identify:

~~~text
Set-Cookie response header
Cookie request header
~~~

The cookie is intentionally **not** authentication. This prevents students from learning the incorrect rule that every cookie equals a login session.

## robots.txt Discussion

```bash
curl http://127.0.0.1:8070/robots.txt
```

Explain why `robots.txt` is guidance for crawlers, not an authorization control.

## Challenge

Use normal browsing, developer tools, curl, cookie storage, and optionally Burp Proxy to build an application map.

The challenge now covers:

- routes,
- methods,
- status codes,
- HTML/JSON/plain-text responses,
- custom headers,
- cookie creation and return,
- authorization responses,
- robots.txt.

Exploitation remains intentionally out of scope.

## Deliverable

```text
Route:
Method:
Status:
Headers:
Tool used:
Purpose:
Security observation:
```

## Cleanup

```bash
docker compose down
```

If Burp was used, return browser proxy settings to normal.

## Next Event

[Beginner 08 — Intro to Cryptography](../08-intro-to-cryptography/)
