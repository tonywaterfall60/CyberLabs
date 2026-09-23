# Beginner 07 — Web Security Basics

**Time:** 75–90 minutes  
**Prerequisites:** Beginner 03–06  
**Environment:** Browser + local web lab

## Learning Objectives

Members should be able to:

- explain HTTP requests and responses
- distinguish GET and POST conceptually
- identify headers, status codes, cookies, and forms
- explain authentication vs. authorization
- recognize why input validation and access control matter

## Safety / Scope

Use only the local training site or another instructor-approved lab.

## Part 1 — HTTP Basics

A simplified request:

```http
GET /about HTTP/1.1
Host: localhost
```

A simplified response:

```http
HTTP/1.1 200 OK
Content-Type: text/html
```

Discuss:

- request method
- path
- response status
- content type

## Part 2 — Browser Developer Tools

Open Developer Tools and use the **Network** tab while browsing the local lab.

Identify:

- requested path
- method
- status code
- response headers

## Part 3 — Security Concepts

Discuss these examples:

### Authentication
"Who are you?"

### Authorization
"What are you allowed to do?"

### Input Validation
"Is this input expected and safe for the application to process?"

### Session Management
"How does the application remember who is logged in?"

## Challenge

For each issue, identify the primary control that should address it:

1. A normal user can access an admin-only page.
2. A password is sent without encryption.
3. A form accepts unexpected input without validation.
4. A session remains active after logout.

## Deliverable

Write one paragraph describing at least three security controls a web application should use.

## Cleanup

Close the local web lab and browser developer tools.
