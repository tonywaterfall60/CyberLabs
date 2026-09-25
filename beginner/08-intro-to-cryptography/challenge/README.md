# Challenge — Encoding, Hashing, and Integrity Case

**Difficulty:** Beginner  
**Estimated time:** 40–55 minutes

## Scenario

You received several small files from a training evidence package. Some values are encoded, some are hashes, and some files should be identical.

Your job is to classify each operation correctly and verify integrity using basic Kali tools.

## Setup

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/crypto-challenge
ls -l
~~~

## Phase 1 — Base64

Inspect and decode:

~~~text
message.b64
operator-note.b64
~~~

Use:

~~~bash
base64 -d message.b64
base64 -d operator-note.b64
~~~

Answer:

- Is Base64 reversible?
- Does decoding require a secret key?
- Is Base64 encryption?

## Phase 2 — File Integrity

Hash:

~~~text
original.txt
copy.txt
modified.txt
~~~

Use:

~~~bash
sha256sum original.txt copy.txt modified.txt
~~~

Determine which files are identical without relying only on filenames.

## Phase 3 — Verify a Known Digest

Inspect:

~~~text
known.sha256
~~~

Calculate the SHA-256 of `evidence.txt` and compare it with the provided digest.

Answer:

~~~text
Integrity verified? yes/no
Evidence:
~~~

## Phase 4 — Hash Identification

Create:

~~~bash
sha256sum evidence.txt | awk '{print $1}' > sample.hash
hashid sample.hash
~~~

Record the likely types reported.

Explain why hashid is making a format guess rather than recovering the original input.

## Phase 5 — Modify and Recheck

Append a line to `copy.txt`:

~~~bash
echo 'student change' >> copy.txt
~~~

Hash it again.

Explain why even a small content change produces a different digest.

## Phase 6 — Classify the Concepts

Classify each as encoding, hashing, symmetric encryption, or asymmetric encryption:

~~~text
Base64
SHA-256
AES
RSA
~~~

Then answer:

~~~text
Which are reversible?
Which require a key?
Which are intended for integrity checks?
~~~

## Deliverable

~~~text
Decoded message:
Decoded operator note:
Base64 classification:

original.txt SHA-256:
copy.txt SHA-256 before change:
modified.txt SHA-256:
Files initially identical:

evidence.txt SHA-256:
Known digest matches:
hashid result:

copy.txt SHA-256 after change:
Integrity explanation:

Base64:
SHA-256:
AES:
RSA:
~~~

## Cleanup

~~~bash
./reset.sh
~~~