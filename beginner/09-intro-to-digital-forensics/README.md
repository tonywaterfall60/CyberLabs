# Beginner 09 — Intro to Digital Forensics

**Difficulty:** Beginner  
**Estimated time:** 75–90 minutes  
**Prerequisites:** Beginner 02, 04, 08  
**Environment:** Kali Linux command line

## Why This Event Exists

Digital forensics focuses on preserving, examining, and documenting digital evidence. Kali includes several useful file-inspection tools that let beginners start analyzing evidence without a full forensic suite.

## Learning Objectives

Members should be able to:

- explain why evidence preservation matters
- calculate and compare hashes
- inspect file metadata
- distinguish filename extensions from actual file types
- use `file`, `stat`, `strings`, and `exiftool`
- document observations
- explain why analysts often work from copies

## Kali Tools Introduced

| Tool | Purpose |
|---|---|
| file | identify likely file type |
| stat | filesystem metadata |
| sha256sum | integrity hash |
| strings | printable text extraction |
| exiftool | embedded metadata inspection |

## Evidence Workflow

```text
Identify
  ↓
Preserve
  ↓
Hash
  ↓
Work from copy
  ↓
Inspect type/metadata
  ↓
Document
  ↓
Verify integrity
```

## Guided Lab

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

Discuss why extensions can be misleading.

### Task 2 — Strings

```bash
strings mystery.jpg
```

Explain what `strings` can reveal and what it cannot prove.

### Task 3 — Filesystem Metadata

```bash
stat note.txt
```

### Task 4 — Embedded Metadata

```bash
exiftool note.txt
exiftool mystery.jpg
```

Discuss the difference between filesystem metadata and file-embedded metadata.

### Task 5 — Hashes

```bash
sha256sum note.txt
sha256sum evidence-copy.txt
```

Modify only the copy:

```bash
echo "Additional line" >> evidence-copy.txt
```

Hash again.

## Beginner Evidence Method

Use the same order for each item:

~~~text
Do not alter the evidence
        ↓
Record / verify a hash
        ↓
Identify actual file type
        ↓
Inspect metadata
        ↓
Inspect strings/content safely
        ↓
Document observations
        ↓
Separate observation from interpretation
~~~

A filename, extension, or printable string is only one piece of evidence.

## Documentation Template

```text
Evidence item:
Observed filename:
Detected type:
Size:
SHA-256:
Filesystem metadata:
Embedded metadata:
Interesting strings:
Actions performed:
Notes:
```

## Challenge

~~~bash
cd challenge
./setup.sh
cat README.md
~~~

The expanded challenge now creates a small evidence package plus an integrity manifest.

Students:

- verify original hashes,
- identify misleading extensions,
- inspect filesystem and embedded metadata,
- extract printable strings,
- compare a working copy,
- modify only the copy,
- document observation vs. interpretation.

Use at least three Kali tools, but explain what question each tool answered.

## Cleanup

```bash
rm -rf ~/cyberclub/forensics-lab
cd challenge
./reset.sh
```

## Next Event

[Beginner 10 — Beginner CTF](../10-beginner-ctf/)
