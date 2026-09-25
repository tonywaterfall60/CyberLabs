# Challenge — Map the Local Web Application

**Difficulty:** Beginner  
**Estimated time:** 45–60 minutes  
**Target:** `http://127.0.0.1:8070`

## Scenario

You are documenting a small local training web application before a more advanced assessment.

The goal is to understand normal HTTP behavior: routes, methods, status codes, headers, JSON, cookies, and authorization responses.

Do not exploit the app.

## Start

~~~bash
docker compose up --build -d
~~~

The application uses port 8070 so Burp may keep its default proxy listener on 127.0.0.1:8080.

## Scope

Only interact with:

~~~text
127.0.0.1:8070
~~~

## Phase 1 — Normal Browser Mapping

Visit:

~~~text
/
/about
/session-demo
/api/status
/admin
/robots.txt
~~~

Use browser Developer Tools → Network.

For each request record:

~~~text
Method
Path
Status
Content-Type
One request header
One response header
~~~

## Phase 2 — curl

Use:

~~~bash
curl -i http://127.0.0.1:8070/
curl -i http://127.0.0.1:8070/about
curl -i http://127.0.0.1:8070/api/status
curl -i http://127.0.0.1:8070/admin
curl -i http://127.0.0.1:8070/robots.txt
~~~

Compare HTML, JSON, plain text, and error responses.

## Phase 3 — Cookie Demonstration

Request the home page while saving cookies:

~~~bash
curl -i -c cookies.txt http://127.0.0.1:8070/
~~~

Inspect:

~~~bash
cat cookies.txt
~~~

Then send the stored cookie back:

~~~bash
curl -i -b cookies.txt http://127.0.0.1:8070/session-demo
~~~

Answer:

- Which response header set the cookie?
- Which request header later sends it?
- Is `training_view` an authentication token? Why or why not?

## Phase 4 — Authorization Response

Request:

~~~text
/admin
~~~

Explain:

~~~text
Authentication = who are you?
Authorization  = are you allowed to access this resource?
~~~

A 403 means the server understood the request but refused access.

Do not attempt to bypass it in this Beginner lab.

## Phase 5 — robots.txt

Inspect `/robots.txt`.

Explain why listing `/admin` does not protect it.

## Optional Burp Preview

Launch Burp and configure Firefox HTTP proxy:

~~~text
127.0.0.1:8080
~~~

Capture one request only.

Identify:

- method,
- path,
- Host,
- User-Agent,
- Cookie header if present,
- response status.

Forward it and review HTTP history.

Do not use Repeater or automated discovery yet.

## Application Map

Create:

| Route | Method | Status | Content Type | Interesting Header/Cookie | Purpose |
|---|---|---:|---|---|---|

## Deliverable

Also answer:

~~~text
One custom X-CyberLabs header:
Cookie name:
Who sets the cookie:
Who sends it back:
Admin status:
Why robots.txt is not authorization:
Difference between authentication and authorization:
~~~

## Cleanup

~~~bash
docker compose down
rm -f cookies.txt
~~~

If Burp was used, restore browser proxy settings.