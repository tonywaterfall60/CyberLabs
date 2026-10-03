# B12 — Beginner Skills Challenge

## Goal

Combine several Beginner skills in one short independent exercise.

## Setup

~~~bash
chmod +x setup.sh
./setup.sh
cd ~/cyberclub/extra-beginner-b12
~~~

Optionally start the local web service:

~~~bash
python3 -m http.server 8600 --bind 127.0.0.1 --directory ~/cyberclub/extra-beginner-b12/web
~~~

## Tasks

Complete as many as possible without looking back at earlier lab instructions.

### Linux / CLI

- list all files under the challenge directory,
- count failed logins,
- identify the successful session.

### Networking / Service Validation

If the local service is running:

~~~bash
nmap -p 8598-8602 127.0.0.1
curl http://127.0.0.1:8600/
~~~

Explain why both commands are useful.

### Integrity

Verify `evidence/message.txt` against `evidence/message.sha256`.

### Encoding

Decode `evidence/final.b64` to recover the final flag.

## Deliverable

Submit the flag and the commands used for each section.

## Reflection

Which skill felt easiest? Which one still requires notes?

That answer helps decide what to review before Intermediate.
