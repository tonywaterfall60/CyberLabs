# Challenge — Application Mapping with Burp Suite

Start:

```bash
docker compose up --build -d
```

Target:

```text
http://127.0.0.1:8200
```

## Authorized Scope

Only test:

```text
127.0.0.1:8200
```

Do not point Burp, Gobuster, ffuf, Nikto, or other scanners at unrelated systems.

## Kali Tools

Use:

- Burp Suite
- Gobuster or ffuf
- curl
- Firefox developer tools

Optional:

- Nikto

## Part 1 — Burp Proxy

Launch:

```bash
burpsuite
```

Configure the lab browser to proxy HTTP through:

```text
127.0.0.1:8080
```

Then:

1. Turn Intercept ON.
2. Browse to the challenge.
3. Capture the request.
4. Identify the method, path, headers, and cookies.
5. Forward the request.
6. Turn Intercept OFF.
7. Review the request in HTTP history.

## Part 2 — Burp Repeater

Find:

```text
GET /search?q=training
```

Send it to Repeater.

Change the harmless query value and resend it.

Record:

- changed request
- status code
- response body difference

## Part 3 — Route Discovery

Use the included wordlist.

Gobuster:

```bash
gobuster dir   -u http://127.0.0.1:8200   -w wordlist.txt
```

or ffuf:

```bash
ffuf   -u http://127.0.0.1:8200/FUZZ   -w wordlist.txt
```

## Part 4 — Manual Validation

Validate discoveries:

```bash
curl -i http://127.0.0.1:8200/
curl -i http://127.0.0.1:8200/about
curl -i http://127.0.0.1:8200/api/status
curl -i 'http://127.0.0.1:8200/search?q=test'
curl -i http://127.0.0.1:8200/admin
curl -i http://127.0.0.1:8200/robots.txt
curl -i http://127.0.0.1:8200/debug-info
```

## Optional — Nikto

Run only against the local challenge:

```bash
nikto -h http://127.0.0.1:8200
```

Discuss:

- which results are useful,
- which are informational,
- why automated scanner output must be manually validated.

## Tasks

1. Map all visible routes.
2. Discover at least one unlinked route.
3. Identify the API route.
4. Record status codes for public and restricted routes.
5. Identify the cookie set by the application.
6. Identify the custom response header.
7. Identify one query parameter.
8. Use Burp Repeater to resend one harmless request.
9. Compare Gobuster/ffuf output with manual browsing.
10. Create a simple attack-surface diagram.

## Deliverable

```text
Route:
Method:
Parameters:
Discovered by:
Status:
Cookie/header observations:
Burp observation:
Security questions:
```

## Cleanup

```bash
docker compose down
```

Return your browser proxy settings to normal.
