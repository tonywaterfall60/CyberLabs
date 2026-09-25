# Extra Practice 08 — Infrastructure Notes

## Service Topology

~~~text
Host browser / curl / Burp
          |
    127.0.0.1:8760
          |
       ep08_edge
        Nginx
       /     \
      /       \
ep08_portal   ep08_api
 Flask:5000   Flask:5001
      \       /
       \     /
      ep08_range
          |
   bind-mounted logs
       ./runtime/
~~~

Only ep08_edge publishes a host port.

Portal and API are reachable only by containers on ep08_range.

## Request Routing

### Portal Requests

Requests such as /, /login/alice, /dashboard, and /logout are proxied by Nginx to:

~~~text
portal:5000
~~~

### API Requests

Requests beginning with /api/ are proxied to:

~~~text
api:5001
~~~

## Session Model

Portal and API use the same Flask session secret supplied through:

~~~text
SESSION_SECRET
~~~

This allows the API to validate the same signed session cookie created by the portal.

The portal stores:

~~~text
user
sid
~~~

in the session.

## Logging Model

### auth.jsonl

Written by the portal.

Contains login/logout activity with user and session ID.

### api.jsonl

Written by the API.

Contains document-access decisions including owner, requester, cross_user, result, session ID, and request ID.

### edge-access.jsonl

Written by Nginx.

Contains HTTP method, URI, response status, request time, client metadata, and the upstream X-Request-ID when present.

## Correlation Keys

Useful joins include:

~~~text
auth.jsonl ↔ api.jsonl
    sid

api.jsonl ↔ edge-access.jsonl
    request_id
~~~

## Intentional Training Weakness

The API computes whether document ownership differs from the authenticated user but intentionally returns the object anyway.

This makes the lab useful for:

- broken object-level authorization analysis,
- evidence preservation,
- cross-service logging,
- detection design,
- remediation discussion.

## Private Flag Injection

The API reads:

~~~text
PURPLE_FLAG_VALUE
~~~

The public repository does not contain a filled-in value.

An instructor may launch the range with the private value from CyberLabs-Instructor.

## Reset Behavior

reset.sh:

1. stops all Compose services,
2. removes the Compose network,
3. removes runtime logs.

Images remain cached so future starts are faster.

## Network Exposure

Expected host exposure:

~~~text
127.0.0.1:8760
~~~

Do not change the published address to 0.0.0.0 for normal local practice.