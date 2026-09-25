# Challenge — Network Troubleshooting Desk

**Difficulty:** Beginner  
**Estimated time:** 35–50 minutes

## Scenario

You are working the help desk for a small fictional training network.

Several users report connectivity problems. Your job is to identify which networking component you would investigate first and which command could help test that hypothesis.

## Network Diagram

~~~text
                Remote Network
                     |
              [ Default Gateway ]
                192.168.56.1
                     |
        192.168.56.0/24 LAN
          /          |          \
         /           |           \
 Laptop          DNS Server     Web Server
.10/24             .53            .20
                                  |
                              80 / 443
~~~

### Laptop

~~~text
IP:      192.168.56.10/24
Gateway: 192.168.56.1
DNS:     192.168.56.53
~~~

### Web Server

~~~text
IP:    192.168.56.20
HTTP:  80
HTTPS: 443
~~~

### DNS Server

~~~text
IP: 192.168.56.53
~~~

## Response Template

For every ticket provide:

~~~text
Likely component:
Why:
First command/tool:
What result would support your hypothesis:
What result would make you investigate somewhere else:
~~~

## Ticket 1 — Name Works by IP Only

The user can open:

~~~text
http://192.168.56.20
~~~

but:

~~~text
http://training.local
~~~

fails.

## Ticket 2 — HTTPS Refused

The user can ping `192.168.56.20`, but the browser reports that the connection to TCP 443 is refused.

## Ticket 3 — Local Only

The user can reach devices on `192.168.56.0/24`, but cannot reach any remote network.

## Ticket 4 — Wrong DNS Answer

A DNS query for `training.local` returns `192.168.56.25`, but the actual web server is `192.168.56.20`.

## Ticket 5 — HTTP 500

The browser resolves the correct address and reaches the server, but the application returns:

~~~text
HTTP/1.1 500 Internal Server Error
~~~

## Ticket 6 — DNS Server Unreachable

The laptop cannot reach `192.168.56.53`, but it can still ping `192.168.56.20`.

## Ticket 7 — Listening Port Check

An administrator says the web server process is running, but users still cannot connect to port 80.

What local server-side command could help confirm whether anything is actually listening?

## Command Matching

Match each command to the question it helps answer:

~~~text
ip addr
ip route
ping
dig
ss -tulpn
curl -I
traceroute
~~~

Questions:

1. What IP addresses are assigned locally?
2. What is the default route?
3. Can I reach this IP at all?
4. What address does this hostname resolve to?
5. What services are listening locally?
6. What HTTP status/headers come back?
7. Which network hops respond along a route?

## Bonus — Why Ping Is Not Enough

Explain why:

~~~text
ping succeeds
~~~

does **not** prove:

~~~text
the website is healthy
~~~

Include at least two reasons.

## Deliverable

Complete all seven tickets and the command-matching section.