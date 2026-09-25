# Extra Practice 03 — Web Application Mapping

**Difficulty:** Intermediate  
**Estimated time:** 90–120 minutes  
**Environment:** Kali Linux + Docker  
**Tools:** Burp Suite, curl, Gobuster or ffuf, browser developer tools  
**Infrastructure:** Nginx reverse proxy + Flask application on an internal Docker network

## Scenario

You have been asked to map a small internal support portal before a deeper security assessment.

You are **not** being asked to exploit it.

Your job is to understand:

- what routes exist,
- what parameters exist,
- which responses are public or restricted,
- what cookies and headers are used,
- what information is exposed,
- which parts of the application deserve deeper review.

## Scope

Authorized target:

~~~text
http://127.0.0.1:8740
~~~

Do not scan other ports or hosts for this lab.

---

## Infrastructure

The lab uses two containers:

~~~text
Browser / Burp / curl
        |
  127.0.0.1:8740
        |
   Nginx Proxy
        |
  ep03_web_network
        |
   Flask App :5000
~~~

Only Nginx is exposed to the Kali host.

The Flask application is reachable only through the internal Docker network.

This is intentionally closer to how many real web environments are structured.

## Start the Lab

~~~bash
docker compose up --build -d
~~~

Verify:

~~~bash
docker compose ps
curl -I http://127.0.0.1:8740/
~~~

---

## Phase 1 — Normal Browsing

Before using content-discovery tools:

1. open the site normally,
2. browse every visible link,
3. use browser developer tools,
4. record all observed routes,
5. record parameters,
6. record cookies,
7. record notable headers.

Build a table:

~~~text
Method | Route | Parameters | Status | Discovery Source | Notes
~~~

## Phase 2 — Burp Proxy

Proxy your browser through Burp.

Capture:

- home request,
- search request,
- API request.

For each identify:

~~~text
Method
Path
Query parameters
Cookie
Host
User-Agent
Response status
Response headers
~~~

## Phase 3 — Repeater

Send the search request to Repeater.

Change only the `q` parameter.

Compare:

- request,
- response,
- page behavior.

Do not add unrelated attack payloads.

The objective is controlled request manipulation.

## Phase 4 — Content Discovery

Use the included:

~~~text
wordlist.txt
~~~

Gobuster example:

~~~bash
gobuster dir   -u http://127.0.0.1:8740   -w wordlist.txt
~~~

ffuf example:

~~~bash
ffuf   -u http://127.0.0.1:8740/FUZZ   -w wordlist.txt
~~~

Record:

- discovered route,
- status,
- size,
- whether the route was already visible,
- whether it deserves manual review.

## Phase 5 — robots.txt

Inspect:

~~~text
/robots.txt
~~~

Answer:

- which routes it references,
- whether robots.txt is access control,
- whether the listed routes are reachable,
- what their responses reveal.

## Phase 6 — Restricted Route

Inspect the administrative route.

Do not attempt authentication bypass.

Document:

- status code,
- response body,
- whether the route existence itself is a vulnerability,
- what additional evidence would be needed for a real finding.

## Phase 7 — API Mapping

Inspect:

~~~text
/api/status
/api/v1/tickets
~~~

Record:

- response format,
- field names,
- object identifiers,
- whether the API reveals more information than the HTML interface.

## Phase 8 — Architecture Inference

Using only application evidence, describe what you can reasonably infer about the infrastructure.

Look at:

- Server headers,
- X-CyberLabs headers,
- proxy behavior,
- application behavior.

Separate:

~~~text
Observed
Inferred
Unknown
~~~

Do not inspect Docker files until after completing this section.

---

## Deliverable

Submit an application map:

~~~text
Target:
Observed technologies:
Cookies:
Headers:

Visible routes:
Hidden/discovered routes:
API routes:
Parameters:

Restricted routes:
Interesting information disclosure:

Observed:
Inferred:
Unknown:

Three areas for deeper review:
1.
2.
3.

Why each deserves review:
~~~

## Cleanup

~~~bash
docker compose down
~~~

Optional:

~~~bash
docker compose down --remove-orphans
~~~
