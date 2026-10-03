# B08 — File Forensics

## Goal

Practice inspecting a file without opening it in an application first.

## Setup

~~~bash
chmod +x setup.sh
./setup.sh
cd ~/cyberclub/extra-beginner-b08
~~~

## Tasks

Use:

~~~bash
file mystery.dat
stat mystery.dat
strings mystery.dat
sha256sum mystery.dat
~~~

Record:

1. the file type reported by `file`,
2. file size,
3. timestamps,
4. SHA-256 hash,
5. printable strings,
6. the flag.

## Deliverable

Submit the flag and a short evidence record containing the hash and metadata.

## Rule

Do not modify the original evidence file while analyzing it.
