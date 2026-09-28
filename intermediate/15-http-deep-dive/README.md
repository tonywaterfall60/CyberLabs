# Intermediate 15 — HTTP Deep Dive

## Event Snapshot

| Item | Details |
|---|---|
| Track | Intermediate |
| Difficulty | Intermediate |
| Estimated time | 90 minutes |
| Environment | Kali Linux + Docker |
| Prerequisites | 14 — Windows Security Fundamentals |

## Why This Event Exists

Web security becomes easier when members understand HTTP beyond GET/200. This event focuses on methods, redirects, caching, cookies, content types, CORS, and bearer-token behavior.

## Learning Objectives

- compare HTTP methods,
- interpret status families,
- inspect cookies and cache headers,
- explain CORS at a practical level,
- distinguish browser policy from server authorization.

## Guided Lab

Use curl and Burp against the local training server.

## Challenge

[challenge/README.md](challenge/README.md)

## Cleanup

~~~bash
cd challenge
docker compose down
~~~

---

## Event Navigation

- Previous: [Windows Security Fundamentals](../14-windows-security-fundamentals/)
- Track Home: [Intermediate Track](../README.md)
- Curriculum Index: [All CyberLabs Events](../../CURRICULUM_INDEX.md)
- Next: [API Security Fundamentals](../16-api-security-fundamentals/)
