# Beginner 09 — Intro to Digital Forensics

**Time:** 75–90 minutes  
**Prerequisites:** Beginner 02, 04, and 08  
**Environment:** Local practice files

## Learning Objectives

Members should be able to:

- explain the purpose of digital forensics
- inspect file metadata and hashes
- recognize that extensions do not define file contents
- preserve evidence before analysis
- document observations

## Safety / Ethics

Use only instructor-provided or personally created files.

Do not inspect another person's private files or device without authorization.

## Setup

```bash
mkdir -p ~/cyberclub/forensics-lab
cd ~/cyberclub/forensics-lab

echo "Meeting moved to 7 PM." > note.txt
cp note.txt evidence-copy.txt
printf 'This is a training artifact.\n' > mystery.dat
```

## Task 1 — Record File Information

```bash
ls -l
file note.txt
file mystery.dat
```

## Task 2 — Calculate Hashes

```bash
sha256sum note.txt
sha256sum evidence-copy.txt
```

Do the matching hashes support the conclusion that the files are identical?

## Task 3 — Modify the Copy

```bash
echo "Additional line" >> evidence-copy.txt
sha256sum note.txt
sha256sum evidence-copy.txt
```

Compare again.

## Task 4 — Metadata

Linux:

```bash
stat note.txt
```

Record the size and timestamps.

## Task 5 — Evidence Notes

Create:

```text
File:
Size:
Type:
SHA-256:
Observed timestamps:
Notes:
```

## Challenge

Explain why an investigator should hash evidence before and after analysis.

## Cleanup

```bash
rm -rf ~/cyberclub/forensics-lab
```
