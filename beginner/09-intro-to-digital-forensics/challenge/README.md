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

Explain what a successful check means. Then inspect the evidence directory with hidden files included and record the preservation flag from the hidden preservation note.

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

One of the printable strings in `archive.bin` contains the analysis flag. Record it, then explain why printable strings are clues, not proof of the entire file's purpose.

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

Submit both recovered flags to the CyberLabs dashboard and include:

1. verified manifest result,
2. misleading-extension finding,
3. hash comparison before/after modification,
4. at least three tool outputs,
5. one paragraph distinguishing observation from interpretation.

## Cleanup

~~~bash
./reset.sh
~~~

## Bonus — Autopsy Disk Image Investigation (20–30 minutes)

This optional exercise is separate from the five original evidence files. Setup also
creates real **ext2 filesystem images** and accompanying SHA-256 manifests in
`~/cyberclub/forensics-challenge/`:

- `demo-filesystem.img` — the instructor-led walkthrough
- `extra-filesystem.img` — the independent student challenge

Prerequisites on Kali:

~~~bash
sudo apt update
sudo apt install -y autopsy sleuthkit e2fsprogs
~~~

You may use the command-line Sleuth Kit even if the Autopsy web browser is unavailable.

### Instructor-guided demonstration

From the generated evidence directory:

~~~bash
sha256sum -c demo-filesystem.img.sha256
file demo-filesystem.img
fsstat demo-filesystem.img | head -35
fls -r -p demo-filesystem.img
~~~

Find the inode number for `casefiles/meeting-notes.txt` in `fls` output, then:

~~~bash
icat demo-filesystem.img INODE_NUMBER
~~~

Replace `INODE_NUMBER` with the actual number printed by `fls`.

Start the legacy Kali Autopsy Forensic Browser from another terminal:

~~~bash
mkdir -p ~/cyberclub/autopsy-cases
autopsy -d ~/cyberclub/autopsy-cases
~~~

Leave the terminal running. In Firefox inside Kali, visit
`http://localhost:9999/autopsy`. Create a new case, add a host, add an image,
and enter the **absolute path** to `demo-filesystem.img`. Select the image as
a disk/partition filesystem image as appropriate for the interface; choose
**no partition splitting** since this is a filesystem image, not a whole disk.
Browse the `casefiles` directory and inspect the meeting notes and login log.

If the legacy interface reports `Can't open log: autopsy.log`, check that
the chosen evidence locker exists and is writable and try the explicit `-d`
path above; if necessary, use `fls`/`icat` while fixing its configuration.

### Independent student extra challenge

1. Verify `extra-filesystem.img.sha256` before analysis.
2. Open `extra-filesystem.img` as a **separate image** in Autopsy.
3. Identify the suspicious source IP from the included log.
4. Find the hidden review note in the filesystem and recover the analysis flag.
5. Cross-check the finding with `fls -r -p` and `icat`.
6. Document the image hash, file path, inode number, and exact tool evidence.

Hint: some file browsers conceal dotfiles; use a listing that shows them.
Do not execute anything recovered from an evidence image.

### Cleanup

The reset script is stored in the **repository's challenge directory**, not
inside the generated evidence directory. From the repository's
`beginner/09-intro-to-digital-forensics/challenge/` folder, run:

~~~bash
./reset.sh
~~~

This deletes only `~/cyberclub/forensics-challenge`; Autopsy case metadata in
`~/cyberclub/autopsy-cases` is retained unless you remove it yourself.
