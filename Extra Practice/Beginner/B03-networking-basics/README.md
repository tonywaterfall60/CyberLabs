# B03 — Networking Basics

## Goal

Reinforce IP addresses, DNS, ports, and TCP/UDP before using heavier network tools.

## Setup

~~~bash
chmod +x setup.sh
./setup.sh
cd ~/cyberclub/extra-beginner-b03
~~~

## Tasks

Read `network-notes.txt` and answer:

1. What is the host's IP address?
2. What port is listed?
3. Is the listed transport TCP or UDP?
4. What does DNS normally translate?
5. Which transport protocol provides reliable ordered delivery?
6. Record the flag in the evidence file.

Then inspect your own machine with:

~~~bash
ip addr
ip route
ss -tuln
~~~

Do not scan other systems.

## Deliverable

Submit the flag and short answers to the five networking questions.

## Cleanup

~~~bash
rm -rf ~/cyberclub/extra-beginner-b03
~~~
