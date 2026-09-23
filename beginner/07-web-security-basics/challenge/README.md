# Challenge — Map the Local Web Application

Start the app:

```bash
docker compose up --build -d
```

Open:

```text
http://127.0.0.1:8080
```

## Rules

Use normal browsing, browser developer tools, and `curl`. The goal is to understand application behavior, not exploit it.

## Tasks

1. Request `/`.
2. Request `/about`.
3. Request `/api/status`.
4. Request `/admin`.
5. Request `/robots.txt`.
6. Record the HTTP status for each route.
7. Identify one custom response header.
8. Explain why seeing a path in `robots.txt` does not mean it is protected.
9. Explain the difference between the `/admin` response and authentication.

## Suggested Commands

```bash
curl -i http://127.0.0.1:8080/
curl -i http://127.0.0.1:8080/about
curl -i http://127.0.0.1:8080/api/status
curl -i http://127.0.0.1:8080/admin
curl -i http://127.0.0.1:8080/robots.txt
```

## Deliverable

| Route | Method | Status | Interesting header/content | Security observation |
|---|---|---:|---|---|

## Cleanup

```bash
docker compose down
```
