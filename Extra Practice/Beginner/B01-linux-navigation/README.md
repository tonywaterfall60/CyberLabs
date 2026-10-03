# B01 — Linux Navigation

## Goal

Practice basic Linux navigation until moving around the filesystem feels normal.

## Setup

~~~bash
chmod +x setup.sh
./setup.sh
cd ~/cyberclub/extra-beginner-b01
~~~

## Tasks

1. Print your current directory with `pwd`.
2. List normal files with `ls`.
3. List hidden files with `ls -la`.
4. Move into `projects/archive`.
5. Use `cat` to read `evidence.txt`.
6. Use `ls -l` to explain the file permissions.
7. Find the hidden completion note and record its flag.

## Commands to Practice

~~~bash
pwd
ls
ls -la
cd
cat
find
file
~~~

## Deliverable

Submit the flag to the CyberLabs dashboard and explain:

- what `.` means,
- what `..` means,
- how hidden Linux files are named,
- what the permission string on `evidence.txt` means.

## Cleanup

~~~bash
rm -rf ~/cyberclub/extra-beginner-b01
~~~
