# Extra Practice 14 — Infrastructure Notes

## Network

~~~text
Network: ep14_range
Subnet:  172.28.14.0/28
Gateway: Docker-assigned bridge gateway
~~~

## Hosts

| IP | Container | Service | Port | Purpose |
|---|---|---|---:|---|
| 172.28.14.10 | ep14_web | Nginx | 80 | operations frontend |
| 172.28.14.11 | ep14_api | Flask | 5000 | customer/internal API |
| 172.28.14.12 | ep14_admin | Nginx | 8080 | internal administration |
| 172.28.14.13 | ep14_telemetry | Flask | 9000 | telemetry collector |
| 172.28.14.14 | ep14_activity | Python | none after completion | traffic/activity generator |

## Design Goals

The range intentionally separates application roles across different IPs so students practice:

- subnet discovery,
- per-host service fingerprinting,
- application-role inference,
- structured log analysis,
- exposure/sensitivity prioritization.

## Runtime Logs

~~~text
runtime/api.jsonl
runtime/telemetry.jsonl
~~~

### api.jsonl

Records API home/status/customer-list/debug access with source, method, path, and event-specific metadata.

### telemetry.jsonl

Records health checks and synthetic ingest events.

## Activity Generator

`ep14_activity` waits briefly for services to start and then generates a deterministic sequence:

1. web frontend request
2. API status request
3. telemetry health request
4. customer-list request
5. repeated `/api/debug` access
6. admin-console request
7. telemetry ingest from web-01
8. telemetry ingest noting repeated debug-route access

The activity container exits after generation. An exited `ep14_activity` container is expected.

## Exposure Philosophy

No service is published to a host TCP port. Students interact with the Docker bridge subnet directly from the Kali Docker host.

This keeps the range local while preserving distinct host addresses.

## Reset

`reset.sh` stops containers, removes the custom network, and deletes runtime logs.

Images remain cached.