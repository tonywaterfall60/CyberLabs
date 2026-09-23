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

```bash
cd challenge
docker compose up --build -d
```

Target:

```text
http://127.0.0.1:8070
```

### Task 1 — Developer Tools

Open the Network tab.

Record:

- method
- path
- status
- content type

### Task 2 — curl

```bash
curl -i http://127.0.0.1:8070/
curl -i http://127.0.0.1:8070/api/status
curl -i http://127.0.0.1:8070/admin
curl -i http://127.0.0.1:8070/robots.txt
```

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

## robots.txt Discussion

```bash
curl http://127.0.0.1:8070/robots.txt
```

Explain why `robots.txt` is guidance for crawlers, not an authorization control.

## Challenge

Use normal browsing, developer tools, curl, and optionally Burp Proxy to map the local application.

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
