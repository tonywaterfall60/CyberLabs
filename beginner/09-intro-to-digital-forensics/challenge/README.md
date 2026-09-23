# Challenge — Small Evidence Investigation

Run:

```bash
./setup.sh
```

Evidence is created in:

```text
~/cyberclub/forensics-challenge/evidence
```

## Rules

Do not modify the evidence directory until you have recorded hashes. Work from the provided working copy where instructed.

## Tasks

1. List every evidence item.
2. Use `file` to identify the actual type of each item.
3. Identify the file whose extension is misleading.
4. Record the SHA-256 hash of every evidence item.
5. Record the size and timestamps of `meeting-notes.txt`.
6. Compare `meeting-notes.txt` and `working-copy.txt` using hashes.
7. Modify only `working-copy.txt`.
8. Recalculate its hash.
9. Explain what the changed hash demonstrates.
10. Create a short evidence note using:
   - filename
   - detected type
   - size
   - SHA-256
   - observation

## Cleanup

```bash
./reset.sh
```
