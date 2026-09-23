# Challenge — Map the Local Web Application

Start the app:

```bash
docker compose up --build -d
```

Target:

```text
http://127.0.0.1:8070
```

The application uses port **8070** so Burp Suite can keep its default proxy listener on **127.0.0.1:8080**.

## Authorized Scope

Only interact with:

```text
127.0.0.1:8070
```

## Tools

Required:

- browser developer tools
- curl

Optional Beginner preview:

- Burp Suite Proxy

## Tasks

1. Request `/`.
2. Request `/about`.
3. Request `/api/status`.
4. Request `/admin`.
5. Request `/robots.txt`.
6. Record the HTTP status for each route.
7. Identify one custom response header.
8. Explain why a path in `robots.txt` is not necessarily protected.
9. Explain the difference between authentication and the `403` response.

## curl

```bash
curl -i http://127.0.0.1:8070/
curl -i http://127.0.0.1:8070/about
curl -i http://127.0.0.1:8070/api/status
curl -i http://127.0.0.1:8070/admin
curl -i http://127.0.0.1:8070/robots.txt
```

## Optional Burp Preview

Launch:

```bash
burpsuite
```

Configure Firefox to use:

```text
HTTP proxy: 127.0.0.1
Port: 8080
```

Browse to:

```text
http://127.0.0.1:8070
```

Capture one request and identify:

- method
- path
- Host header
- User-Agent
- response status

Forward the request and then review it in Burp HTTP history.

Do not use Repeater or automated discovery yet; those are introduced in Intermediate.

## Deliverable

| Route | Method | Status | Tool used | Interesting header/content | Security observation |
|---|---|---:|---|---|---|

## Cleanup

```bash
docker compose down
```

If Burp was used, return the browser proxy settings to normal.
