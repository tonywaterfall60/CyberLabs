# Challenge — Application Mapping

Start:

```bash
docker compose up --build -d
```

Open:

```text
http://127.0.0.1:8200
```

## Rules

Use normal browsing, developer tools, and `curl`. Do not attempt destructive testing.

## Tasks

1. Map all visible routes.
2. Identify at least one route that is not linked from the home page.
3. Identify the API route.
4. Record status codes for public and restricted routes.
5. Identify the cookie set by the application.
6. Identify the custom response header.
7. Identify one route that accepts a query parameter.
8. Create a simple attack-surface diagram.

## Suggested Commands

```bash
curl -i http://127.0.0.1:8200/
curl -i http://127.0.0.1:8200/api/status
curl -i http://127.0.0.1:8200/search?q=test
curl -i http://127.0.0.1:8200/admin
curl -i http://127.0.0.1:8200/robots.txt
```

## Deliverable

```text
Route:
Method:
Parameters:
Status:
Cookie/header observations:
Security questions:
```

## Cleanup

```bash
docker compose down
```
