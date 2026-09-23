# Challenge — Multi-Service Enumeration

Start the local services:

```bash
docker compose up -d
```

Authorized scope:

```text
Target: 127.0.0.1
Ports: 8100-8199
```

## Tasks

1. Identify all open TCP ports in scope.
2. Run service detection only against discovered ports.
3. Manually validate each HTTP service.
4. Identify any custom response header.
5. Record which service exposes a status endpoint.
6. Identify which service appears intended for internal administration.
7. Recommend one hardening action for each exposed service.

## Suggested Tools

```bash
nmap
curl
```

## Deliverable

| Port | Service | Evidence | Security question | Hardening idea |
|---:|---|---|---|---|

## Bonus

Explain the difference between:

- discovery
- fingerprinting
- validation
- prioritization

## Cleanup

```bash
docker compose down
```
