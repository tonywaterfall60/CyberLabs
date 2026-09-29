# Challenge — Local Service Enumeration

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Beginner |
| Estimated time | 45–60 minutes |
| Environment | Kali + Docker |
| Authorized scope | 127.0.0.1 ports 8000–8100 |
| Goal | Discover, fingerprint, and manually validate local services |
## Scenario

A small training workstation is hosting several local services. You need to discover what is exposed, identify what each service appears to do, and manually validate the results.

## Setup

The event lead loads the private flag environment, then prepares the runtime service artifacts:

~~~bash
chmod +x prepare-flags.sh
./prepare-flags.sh
docker compose up -d
~~~

## Authorized Scope

~~~text
Target: 127.0.0.1
Ports: 8000-8100
~~~

Do not scan outside this range.

## Objectives / Tasks

### Phase 1 — Discovery

~~~bash
nmap -p 8000-8100 127.0.0.1
~~~

Record every open TCP port.

### Phase 2 — Targeted Service Detection

After discovering the ports, scan only those ports with `-sV`.

Example pattern:

~~~bash
nmap -sV -p <comma-separated-open-ports> 127.0.0.1
~~~

Ask yourself:

~~~text
What does Nmap observe?
What does Nmap infer?
~~~

### Phase 3 — Manual HTTP Validation

For each discovered HTTP service:

~~~bash
curl -i http://127.0.0.1:<port>/
~~~

Record:

- status code,
- Server header,
- page title,
- application purpose.

After discovering and validating the inventory service, inspect its `/runtime/discovery.txt` resource and record the first dashboard flag.

### Phase 4 — Raw HTTP with Netcat

Choose one port:

~~~bash
nc -nv 127.0.0.1 <port>
~~~

Then type:

~~~http
GET / HTTP/1.0
Host: localhost

~~~

Press Enter after the blank line.

### Phase 5 — Compare Service Roles

The challenge contains multiple services with different roles.

Create:

~~~text
Port | Nmap Guess | Application Role | Evidence
~~~

Then answer:

1. Which service looks like inventory/data?
2. Which looks like monitoring/status?
3. Which looks like documentation/support?
4. Which would you review first if this were a real internal system, and why?

After correctly mapping the service roles, inspect `/runtime/validation.txt` on the documentation service and record the second dashboard flag.

### Key Concepts

Explain the difference between:

~~~text
Open port
Service detection
Application content
Manual validation
~~~

An open port is an observation. It is not automatically a vulnerability.


## Deliverable

Submit both discovered flags to the CyberLabs dashboard plus:

| Port | State | Nmap service | Application role | curl evidence | nc evidence |
|---:|---|---|---|---|---|

Then answer:

~~~text
Priority service:
Reason:
One thing Nmap told you:
One thing manual validation told you:
Why scope matters:
~~~

## Cleanup

~~~bash
docker compose down
rm -rf runtime
~~~