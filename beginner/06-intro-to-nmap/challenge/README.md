# Challenge — Local Service Enumeration

Start the intentionally exposed local services:

```bash
docker compose up -d
```

Your authorized scope is strictly:

```text
Target: 127.0.0.1
Ports: 8000-8100
```

## Tasks

1. Identify all open TCP ports within the authorized range.
2. Run service detection only against those ports.
3. Visit each discovered HTTP service in a browser or with `curl`.
4. Record what each service returns.
5. Explain the difference between:
   - open port
   - identified service
   - application content

## Suggested Commands

```bash
nmap -p 8000-8100 127.0.0.1
nmap -sV -p 8000-8100 127.0.0.1
```

## Deliverable

| Port | State | Service | Evidence |
|---:|---|---|---|

Then answer:

1. Which exposed service would you review first and why?
2. Why is scanning outside the stated port range unnecessary for this challenge?
3. What would change if this were a production environment?

## Cleanup

```bash
docker compose down
```
