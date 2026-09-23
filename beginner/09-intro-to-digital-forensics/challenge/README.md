# Challenge — Small Evidence Investigation

Run:

```bash
./setup.sh
```

Evidence is created in:

```text
~/cyberclub/forensics-challenge/evidence
```

## Kali Tools

Use at least three:

- `file`
- `stat`
- `sha256sum`
- `strings`
- `exiftool`

## Rules

Do not modify the evidence directory until you have recorded the original hashes. Modify only the working copy when instructed.

## Tasks

1. List every evidence item.
2. Use `file` to identify the actual type of each item.
3. Identify the file whose extension is misleading.
4. Use `strings` on the misleading file and record any useful printable text.
5. Record the SHA-256 hash of every evidence item.
6. Use `stat` on `meeting-notes.txt`.
7. Use `exiftool` on at least two evidence files.
8. Compare `meeting-notes.txt` and `working-copy.txt` using hashes.
9. Modify only `working-copy.txt`.
10. Recalculate its hash.
11. Explain what the changed hash demonstrates.

## Suggested Commands

```bash
cd ~/cyberclub/forensics-challenge/evidence
file *
strings photo.jpg
sha256sum *
stat meeting-notes.txt
exiftool meeting-notes.txt
exiftool photo.jpg
```

## Deliverable

```text
Filename:
Detected type:
Size:
SHA-256:
Interesting strings:
Filesystem metadata:
Embedded metadata:
Observation:
```

## Cleanup

```bash
./reset.sh
```
