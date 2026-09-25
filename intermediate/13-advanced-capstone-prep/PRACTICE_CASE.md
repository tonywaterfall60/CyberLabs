# Intermediate 13 — Multi-Source Practice Case

Use this case for interview preparation only.

All data is fictional.

## Authorized Scope

~~~text
Host: 127.0.0.1
Ports: 8500-8510
Evidence below only
~~~

## Nmap Snippet

~~~text
8500/tcp open  http
8505/tcp open  http
~~~

## HTTP Evidence

Service on 8500:

~~~text
HTTP/1.1 200 OK
X-CyberLabs-Service: reports
Content-Type: text/html

<a href="/report/41">My report</a>
~~~

Modified request observed during testing:

~~~text
GET /report/42 HTTP/1.1
Cookie: user=alice
~~~

Response:

~~~text
HTTP/1.1 200 OK
Owner: bob
Classification: Confidential Training
~~~

Service on 8505:

~~~text
HTTP/1.1 200 OK
X-CyberLabs-Service: metrics

build_info{release="2026.09",environment="training"} 1
~~~

## Authentication Log

~~~text
2026-09-25T16:00:01Z FAIL user=alice src=10.50.0.44
2026-09-25T16:00:05Z FAIL user=alice src=10.50.0.44
2026-09-25T16:00:10Z SUCCESS user=alice src=10.50.0.44 session=S-991
~~~

## Application Log

~~~text
2026-09-25T16:00:18Z user=alice session=S-991 action=VIEW_REPORT object=41 owner=alice result=success
2026-09-25T16:00:29Z user=alice session=S-991 action=VIEW_REPORT object=42 owner=bob result=success
~~~

## Configuration Evidence

~~~text
/opt/reports/export.sh mode=0777 owner=root
cron: * * * * * root /opt/reports/export.sh
~~~

## Questions

1. What is the strongest confirmed web finding?
2. Which evidence proves it?
3. Is the login sequence enough to prove account compromise?
4. What does the metrics service reveal, and how severe is that by itself?
5. What is the privilege-boundary concern in the configuration evidence?
6. What would you validate next?
7. Which issue would you prioritize first and why?
8. What remediation fixes each root cause?
9. What detection or logging would help?
10. Which conclusions remain uncertain?

## Required Answer Structure

~~~text
Scope:
Question:
Observed evidence:
Interpretation:
Confidence:
Alternative explanation:
Missing evidence:
Validation:
Remediation:
Detection:
~~~