# Challenge — Small Evidence Investigation

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Beginner |
| Estimated time | 45–60 minutes |
| Environment | Kali / Linux terminal |
| Authorized scope | Generated forensics-challenge evidence package only |
| Goal | Preserve, identify, hash, and interpret a small evidence set |
## Scenario

You received a small evidence package from a fictional workstation review.

Your job is to preserve the evidence, identify misleading filenames, inspect metadata, compare hashes, and document what you can actually support from the files.

## Authorized Scope

Limit analysis to:

~~~text
~/cyberclub/forensics-challenge/
~~~

Do not substitute real personal files or production evidence.

## Setup

~~~bash
chmod +x setup.sh reset.sh
./setup.sh
cd ~/cyberclub/forensics-challenge
~~~

## Objectives / Tasks

### Evidence Layout

~~~text
forensics-challenge/
├── evidence/
│   ├── meeting-notes.txt
│   ├── working-copy.txt
│   ├── photo.jpg
│   ├── auth.log
│   └── archive.bin
└── evidence-manifest.sha256
~~~

### Rules

- Do not modify anything in `evidence/` until original hashes are recorded.
- Work from `working-copy.txt` when instructed.
- Record the commands you use.
- Do not claim a file is what its extension says; verify it.

### Phase 1 — Inventory and Integrity

List the evidence:

~~~bash
find evidence -maxdepth 1 -type f -printf '%f\n'
~~~

Verify the provided manifest:

~~~bash
sha256sum -c evidence-manifest.sha256
~~~

Explain what a successful check means.

### Phase 2 — File Type

Use:

~~~bash
file evidence/*
~~~

Identify any file whose extension is misleading.

### Phase 3 — Metadata

Use `stat` on at least two files.

Record:

~~~text
Size
Permissions
Modification time
Owner
~~~

Then use `exiftool` on at least two items and compare what information it provides.

### Phase 4 — Strings

Use `strings` on:

~~~text
photo.jpg
archive.bin
~~~

Record useful printable text.

Explain why printable strings are clues, not proof of the entire file's purpose.

### Phase 5 — Working Copy

Compare:

~~~bash
sha256sum evidence/meeting-notes.txt evidence/working-copy.txt
~~~

Then modify only:

~~~text
evidence/working-copy.txt
~~~

Recalculate its hash.

Explain what the changed digest demonstrates.

### Phase 6 — Evidence Worksheet

For each item complete:

~~~text
Filename:
Detected type:
Size:
SHA-256:
Interesting strings:
Filesystem metadata:
Embedded metadata:
Observation:
Confidence:
~~~

## Deliverable

Include:

1. verified manifest result,
2. misleading-extension finding,
3. hash comparison before/after modification,
4. at least three tool outputs,
5. one paragraph distinguishing observation from interpretation.

## Cleanup

~~~bash
./reset.sh
~~~