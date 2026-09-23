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

```bash
cd challenge
./setup.sh
cat README.md
```

Use at least three Kali tools during the challenge.

## Cleanup

```bash
rm -rf ~/cyberclub/forensics-lab
cd challenge
./reset.sh
```

## Next Event

[Beginner 10 — Beginner CTF](../10-beginner-ctf/)
