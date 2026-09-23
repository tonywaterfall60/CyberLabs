# Challenge — Local Service Enumeration

Start the intentionally exposed local services:

```bash
docker compose up -d
```

Authorized scope:

```text
Target: 127.0.0.1
Ports: 8000-8100
```

## Kali Tools

Use:

- Nmap
- curl
- Netcat (`nc`)

## Part 1 — Discovery

```bash
nmap -p 8000-8100 127.0.0.1
```

Identify all open TCP ports.

## Part 2 — Service Detection

Run service detection only within scope:

```bash
nmap -sV -p 8000-8100 127.0.0.1
```

## Part 3 — HTTP Validation

Visit each discovered HTTP service with:

```bash
curl -i http://127.0.0.1:<port>/
```

## Part 4 — Raw TCP with Netcat

Choose one discovered HTTP port:

```bash
nc -nv 127.0.0.1 <port>
```

Then type:

```http
GET / HTTP/1.0

```

Press Enter twice.

Observe the server's raw response.

## Tasks

1. Identify all open ports.
2. Record Nmap's service guess.
3. Validate each service with `curl`.
4. Validate at least one with Netcat.
5. Explain the difference between:
   - open port
   - service detection
   - application content
   - manual validation

## Deliverable

| Port | State | Nmap service | curl evidence | nc evidence |
|---:|---|---|---|---|

Then answer:

1. Which service would you review first and why?
2. Why is scanning outside the stated range unnecessary?
3. Why should automated results be manually validated?

## Cleanup

```bash
docker compose down
```
