# Intermediate 02 — Web Enumeration

**Difficulty:** Intermediate  
**Estimated time:** 90 minutes  
**Prerequisites:** Intermediate 01  
**Environment:** Browser developer tools, curl, Docker

## Why This Event Exists

Before testing a web application, an analyst needs to understand its attack surface. This event teaches systematic mapping of routes, methods, parameters, APIs, headers, cookies, and trust boundaries.

## Learning Objectives

Members should be able to:

- map visible and discoverable application routes
- inspect HTTP methods and status codes
- identify forms and parameters
- inspect cookies and response headers
- identify API calls
- distinguish public, authenticated, and restricted functionality
- create an attack-surface diagram

## Enumeration Workflow

```text
Browse normally
  ↓
Inspect requests
  ↓
Map routes
  ↓
Identify parameters
  ↓
Observe cookies/headers
  ↓
Identify trust boundaries
  ↓
Prioritize test areas
```

## Start the Lab

```bash
cd challenge
docker compose up --build -d
```

Open:

```text
http://127.0.0.1:8200
```

## Guided Tasks

Use browser developer tools and `curl -i` to identify:

- main pages
- API routes
- restricted routes
- HTTP methods
- status codes
- custom headers
- cookies
- parameters

## Application Map Template

```text
Route:
Method:
Parameters:
Authentication required?
Observed status:
Purpose:
Security questions:
```

## Challenge

See `challenge/README.md`.

## Cleanup

```bash
docker compose down
```

## Next Event

[Intermediate 03 — OWASP Top 10 Workshop](../03-owasp-top-10/)
