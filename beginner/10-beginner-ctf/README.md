# Beginner 10 — Beginner CTF

**Time:** 90–120 minutes  
**Prerequisites:** Beginner 01–09  
**Environment:** Local member workstation and instructor-provided lab targets

## Purpose

This capstone challenge night combines the skills learned throughout the Beginner track.

Members may work individually or in small teams.

## Rules

- Use only the provided challenge files and local lab targets.
- Do not scan or test systems outside the event scope.
- Ask for hints when needed; the goal is learning, not gatekeeping.

## Challenge 1 — Linux Search

Create the challenge:

```bash
mkdir -p ~/cyberclub/beginner-ctf/logs
printf "INFO startup\nINFO user login\nFLAG{grep_is_your_friend}\nINFO shutdown\n" > ~/cyberclub/beginner-ctf/logs/system.log
```

Goal: find the flag using command-line search tools.

## Challenge 2 — Networking

Given:

```text
Host: 192.168.56.20
Services: SSH and HTTP
```

Answer:

1. Which common ports would you expect?
2. Which protocol would a browser normally use?
3. What tool from the Beginner track could identify open ports on the authorized host?

## Challenge 3 — Packet Analysis

Using a capture generated during the Wireshark event, identify:

- one DNS query
- one TCP conversation
- one source and destination IP

## Challenge 4 — Cryptography

Decode:

```text
RkxBR3tiYXNlNjRfaXNfZW5jb2Rpbmd9
```

Hint: this is an encoding challenge.

## Challenge 5 — Forensics

```bash
echo "FLAG{hashes_show_change}" > original.txt
cp original.txt copy.txt
```

1. Hash both files.
2. Modify `copy.txt`.
3. Hash them again.
4. Explain what changed.

## Challenge 6 — Web Concepts

Given a normal user who can open an administrator-only page, identify whether the primary problem is:

- authentication
- authorization
- DNS
- encryption

## Suggested Scoring

| Challenge | Points |
|---|---:|
| Linux | 10 |
| Networking | 10 |
| Wireshark | 15 |
| Crypto | 10 |
| Forensics | 15 |
| Web | 10 |
| Written explanations | 30 |

Total: **100 points**

## Completion

Finishing the CTF prepares a member for the Beginner → Intermediate mock interview.

## Cleanup

```bash
rm -rf ~/cyberclub/beginner-ctf
rm -f original.txt copy.txt
```
