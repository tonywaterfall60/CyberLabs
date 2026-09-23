# Intermediate 02 — Web Enumeration

**Time:** 75–90 minutes  
**Environment:** Local Docker web lab

## Objectives
Members should be able to:
- inspect HTTP requests and responses
- identify application routes and technologies
- examine headers
- document attack surface without leaving the authorized lab

## Start
```bash
docker compose up -d
```

Open:
```text
http://127.0.0.1:8080
```

## Tasks
1. Browse the application normally.
2. Inspect response headers using browser developer tools.
3. Identify visible routes and application behavior.
4. Draw a simple application map.
5. Identify three areas that deserve deeper security review.

## Cleanup
```bash
docker compose down -v
```
