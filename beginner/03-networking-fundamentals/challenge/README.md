# Challenge — Network Troubleshooting

You are given the following fictional network:

```text
Laptop
IP: 192.168.56.10/24
Gateway: 192.168.56.1
DNS: 192.168.56.53

Web server
IP: 192.168.56.20
HTTP: 80
HTTPS: 443

DNS server
IP: 192.168.56.53
```

For each ticket, identify the most likely area to investigate first and explain why.

## Ticket 1

The user can open:

```text
http://192.168.56.20
```

but:

```text
http://training.local
```

fails.

## Ticket 2

The user can ping `192.168.56.20`, but the browser reports that the connection to port 443 is refused.

## Ticket 3

The user can reach devices on `192.168.56.0/24`, but cannot reach any remote network.

## Ticket 4

A DNS query for `training.local` returns `192.168.56.25`, but the web server is actually `192.168.56.20`.

## Ticket 5

The browser resolves the correct IP and reaches the server, but the web application itself returns an HTTP 500 error.

## Deliverable

For each ticket provide:

```text
Likely layer/component:
Reason:
First troubleshooting step:
```

## Bonus

Explain why a successful ping does not prove that a website is functioning correctly.
