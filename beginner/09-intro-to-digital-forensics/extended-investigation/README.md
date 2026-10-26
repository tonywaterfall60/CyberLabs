# Lab 09 Extension — Sleuth Kit & Autopsy

**Difficulty:** Beginner | **Duration:** 75–100 minutes | **Required:** Kali Linux, Sleuth Kit | **Optional:** Autopsy Desktop

This extension follows the existing [Lab 09 fundamentals](../README.md). It uses an instructor-provided synthetic FAT16 image named `case09_usb.img`. **Ask the instructor for the image and its SHA256SUMS.txt manifest before starting.** These are deliberately distributed separately, because the disk image embeds live challenge flags.

## Mission
You are investigating an image of a removable drive. Preserve evidence, inspect the filesystem, recover a deleted document, construct an evidence-based event timeline, and submit two `SRU{...}` flags.

Only inspect the provided synthetic evidence. Do not modify the original image or access other devices.

## Install and prepare

```bash
sudo apt update
sudo apt install -y sleuthkit file binutils
mkdir -p ~/cyberlabs09/{work,output}
cp /path/to/case09_usb.img ~/cyberlabs09/work/
cd ~/cyberlabs09/work
sha256sum case09_usb.img
```

Compare the SHA256 to the instructor-provided manifest. Keep your original image unchanged and extract results only to `~/cyberlabs09/output/`.

The case is a raw FAT16 **filesystem image**, not a partitioned disk. You do not need `-o`; `mmls` may find no partition table.

## Phase 1 — Identify and preserve (10 minutes)

```bash
file case09_usb.img
fsstat -f fat case09_usb.img
```

Record its file size, SHA256, filesystem type and volume label. Explain what hashing establishes and what it does not.

## Phase 2 — Examine allocated and deleted files (15 minutes)

```bash
fls -f fat -l case09_usb.img
fls -f fat -r -d case09_usb.img
```

Identify entries that are allocated versus deleted. Record the metadata address reported by `fls` for `NOTES.TXT` and the deleted document. FAT deletion may replace the first character of a filename.

```bash
istat -f fat case09_usb.img <metadata_address>
```

Compare filename, timestamps and metadata.

## Phase 3 — Recovery (20 minutes)

```bash
icat -f fat case09_usb.img <metadata_address> > ~/cyberlabs09/output/recovered.txt
cat ~/cyberlabs09/output/recovered.txt
strings -a case09_usb.img | grep -i amber
```

Locate one marker in an allocated file, recover the deleted document for another, and note when raw strings do not establish the file from which they came. Submit both markers as flags. If `icat` cannot recover deleted content, inspect residual strings and report the limitation.

## Phase 4 — Construct a timeline (15 minutes)

Use the `fls` addresses of `REPORT.TXT`, `NOTES.TXT` and `EXPORT.CSV` with `icat` and `istat`. Build a four-event sequence from file contents and timestamps. Explain what you can support, what remains uncertain, and why deletion alone does not prove intent.

## Phase 5 — Optional GUI analysis with Autopsy (20–25 minutes)

Install Autopsy Desktop on a supported workstation (official site: https://www.autopsy.com/download/). The Linux `autopsy` package may be the older web-based interface, not the contemporary desktop GUI.

1. Create a case named `CyberLabs-09`.
2. Add Data Source → Disk Image or VM File → `case09_usb.img`.
3. Choose appropriate modules for file types, keyword search and hashes.
4. Browse allocated/deleted files, search keyword `amber`, and examine metadata.
5. Compare GUI findings against `fls`, `istat`, and `icat`.

## Deliverables

- Both `SRU{...}` flags submitted to the club dashboard.
- A 150–250 word case report with hash, filesystem, relevant artifacts, a four-event chronology, uncertainty, and the tools used.
- Optional: screenshots of Autopsy's file metadata and keyword results.

**Stretch:** recover a deleted marker another way; hash a GUI-exported file and compare to `icat` output; explain unallocated-space overwrites.

## Troubleshooting

- Missing `fls`: install `sleuthkit`.
- Empty `mmls`: normal for this superfloppy-style image.
- Missing data source in Autopsy: use Disk Image / VM File.
- Hash mismatch: stop and contact the instructor for a clean copy.
