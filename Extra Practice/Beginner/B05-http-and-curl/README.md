# B05 — HTTP and curl

## Goal

Practice basic HTTP requests and learn what curl can show you.

## Setup

~~~bash
chmod +x setup.sh
./setup.sh
python3 -m http.server 8500 --bind 127.0.0.1 --directory ~/cyberclub/extra-beginner-b05/site
~~~

Use another terminal for the tasks.

## Tasks

Run:

~~~bash
curl http://127.0.0.1:8500/
curl -i http://127.0.0.1:8500/
curl -I http://127.0.0.1:8500/
curl -v http://127.0.0.1:8500/
~~~

Identify:

1. the HTTP status code,
2. the response headers,
3. the response body,
4. the difference between `-i`, `-I`, and `-v`,
5. the flag in the response body.

## Deliverable

Submit the flag and explain what a request header and response header are.

## Cleanup

Stop the server with `Ctrl+C`, then remove the workspace.
