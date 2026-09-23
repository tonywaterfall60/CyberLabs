# Beginner 09 — Intro to Digital Forensics

**Difficulty:** Beginner  
**Estimated time:** 75–90 minutes  
**Prerequisites:** Beginner 02, 04, 08  
**Environment:** Linux/WSL command line

## Why This Event Exists

Digital forensics focuses on preserving, examining, and documenting digital evidence. This event introduces evidence handling, hashes, file types, metadata, timestamps, and documentation without requiring specialized forensic suites.

## Learning Objectives

Members should be able to:

- explain why evidence preservation matters
- calculate and compare hashes
- inspect basic file metadata
- distinguish filename extensions from actual file types
- document observations
- explain why analysts often work from copies

## Evidence Principles

A beginner-friendly workflow:

```text
Identify
  ↓
Preserve
  ↓
Hash
  ↓
Work from copy
  ↓
Examine
  ↓
Document
  ↓
Re-hash / verify
```

## Guided Lab

Create files:

```bash
mkdir -p ~/cyberclub/forensics-lab
cd ~/cyberclub/forensics-lab

echo "Meeting moved to 7 PM." > note.txt
cp note.txt evidence-copy.txt
printf 'Training artifact\n' > mystery.jpg
```

### Task 1 — File Type

```bash
file note.txt
file mystery.jpg
```

Discuss why an extension alone is not proof of content type.

### Task 2 — Hashes

```bash
sha256sum note.txt
sha256sum evidence-copy.txt
```

Modify the copy:

```bash
echo "Additional line" >> evidence-copy.txt
```

Hash again.

### Task 3 — Metadata

```bash
stat note.txt
```

Record:

- size
- owner
- permissions
- timestamps

### Task 4 — Documentation

Use:

```text
Evidence item:
Observed filename:
Detected file type:
Size:
SHA-256:
Timestamps:
Actions performed:
Notes:
```

## Challenge

```bash
cd challenge
./setup.sh
cat README.md
```

The challenge creates a small evidence directory containing several files, one misleading extension, and an integrity question.

## Cleanup

```bash
rm -rf ~/cyberclub/forensics-lab
cd challenge
./reset.sh
```

## Next Event

[Beginner 10 — Beginner CTF](../10-beginner-ctf/)
