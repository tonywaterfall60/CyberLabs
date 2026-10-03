# B07 — Encoding and Hashing

## Goal

Practice the difference between encoding and hashing.

## Setup

~~~bash
chmod +x setup.sh
./setup.sh
cd ~/cyberclub/extra-beginner-b07
~~~

## Tasks

1. Decode the Base64 file:

~~~bash
base64 -d message.b64
~~~

2. Verify the evidence hash:

~~~bash
sha256sum evidence.txt
cat evidence.sha256
~~~

3. Change a copy of the file and hash it again.
4. Explain why Base64 is not encryption.
5. Explain why a hash is not normally reversible.

## Deliverable

Submit the decoded flag and both hash observations.
