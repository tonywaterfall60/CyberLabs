# B04 — Service Discovery

## Goal

Practice a simple workflow:

~~~text
discover
→ identify
→ manually validate
~~~

## Setup

~~~bash
chmod +x setup.sh
./setup.sh
python3 -m http.server 8400 --bind 127.0.0.1 --directory ~/cyberclub/extra-beginner-b04/site
~~~

Leave that terminal running and open another terminal.

## Tasks

1. Scan only the local training port:

~~~bash
nmap -p 8398-8402 127.0.0.1
~~~

2. Identify which port is open.
3. Manually validate it with:

~~~bash
curl http://127.0.0.1:8400/
~~~

4. Recover the flag from the service.
5. Explain why Nmap discovery should be followed by manual validation.

## Deliverable

Submit the flag, Nmap output, and curl command.

## Cleanup

Stop the Python server with `Ctrl+C`, then:

~~~bash
rm -rf ~/cyberclub/extra-beginner-b04
~~~
