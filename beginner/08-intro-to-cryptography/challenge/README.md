# Challenge — Encoding, Hashing, and Integrity

Run:

```bash
./setup.sh
```

Challenge files are created in:

```text
~/cyberclub/crypto-challenge
```

## Kali Tools

Use:

- `base64`
- `sha256sum`
- `hashid`

## Tasks

1. Decode `message.b64`.
2. Decide whether Base64 is encoding, hashing, or encryption.
3. Calculate the SHA-256 hash of `original.txt`.
4. Calculate the SHA-256 hash of `copy.txt`.
5. Determine whether the files are initially identical.
6. Save one SHA-256 digest to a file named `sample.hash`.
7. Run `hashid sample.hash`.
8. Record the likely hash type(s) reported.
9. Append any line to `copy.txt`.
10. Hash both files again.
11. Explain why the hashes changed.
12. Classify:
    - SHA-256
    - AES
    - RSA
    - Base64

## Suggested Commands

```bash
cd ~/cyberclub/crypto-challenge
base64 -d message.b64
sha256sum original.txt
sha256sum copy.txt
sha256sum original.txt | awk '{print $1}' > sample.hash
hashid sample.hash
```

## Discussion

`hashid` can suggest likely formats based on the digest's appearance, but that is not proof of how the value was generated.

## Deliverable

```text
Decoded message:
Base64 category:
Original SHA-256:
Copy SHA-256 before change:
hashid result:
Copy SHA-256 after change:
Classification answers:
Integrity explanation:
```

## Cleanup

```bash
./reset.sh
```
