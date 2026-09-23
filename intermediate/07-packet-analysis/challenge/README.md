# Challenge — Reconstruct the Web Session

Start the local service:

```bash
docker compose up -d
```

Begin a Wireshark capture of your own local traffic, then run:

```bash
./generate-traffic.sh
```

## Tasks

1. Identify the destination port.
2. Find requests to `/`, `/login`, `/api/profile`, and `/logout`.
3. Identify the response status for each.
4. Follow at least one TCP stream.
5. Determine the order of application activity.
6. Identify one custom header.
7. Create a four-step timeline.

## Scope

Only traffic to:

```text
127.0.0.1:8300
```

## Cleanup

```bash
docker compose down
```
