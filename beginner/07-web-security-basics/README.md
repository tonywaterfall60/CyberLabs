# Beginner 07 — Web Security Basics

**Difficulty:** Beginner  
**Estimated time:** 75–90 minutes  
**Prerequisites:** Beginner 03–06  
**Environment:** Browser, developer tools, curl, Docker

## Why This Event Exists

Web applications are a major part of modern computing and cybersecurity. Before members learn web exploitation, they need to understand normal HTTP behavior, requests, responses, status codes, cookies, authentication, authorization, and input handling.

## Learning Objectives

Members should be able to:

- explain the HTTP request/response model
- distinguish GET and POST conceptually
- identify a URL path, headers, body, and status code
- inspect requests in browser developer tools
- explain cookies and sessions at a basic level
- distinguish authentication and authorization
- identify several security-control failures conceptually

## HTTP Model

Request:

```http
GET /about HTTP/1.1
Host: localhost
User-Agent: Browser
```

Response:

```http
HTTP/1.1 200 OK
Content-Type: text/html
```

## Common Status Codes

| Code | Meaning |
|---:|---|
| 200 | OK |
| 301/302 | Redirect |
| 400 | Bad Request |
| 401 | Authentication required/failed |
| 403 | Forbidden |
| 404 | Not Found |
| 500 | Server error |

## Authentication vs. Authorization

```text
Authentication = Who are you?
Authorization  = What may you access?
```

## Guided Lab

Start the local app:

```bash
cd challenge
docker compose up --build -d
```

Open:

```text
http://127.0.0.1:8080
```

### Task 1 — Browser Developer Tools

Open the Network tab and reload the page.

Record:

- request method
- request path
- response status
- content type

### Task 2 — curl

```bash
curl -i http://127.0.0.1:8080/
curl -i http://127.0.0.1:8080/api/status
curl -i http://127.0.0.1:8080/admin
```

Compare the response codes.

### Task 3 — robots.txt

```bash
curl http://127.0.0.1:8080/robots.txt
```

Discuss why `robots.txt` is not an access-control mechanism.

## Challenge

Use only normal browsing, developer tools, and curl to map the local application.

See:

```text
challenge/README.md
```

## Deliverable

Create a small application map:

```text
Route:
Method:
Status:
Purpose:
Security observation:
```

## Cleanup

```bash
docker compose down
```

## Next Event

[Beginner 08 — Intro to Cryptography](../08-intro-to-cryptography/)
