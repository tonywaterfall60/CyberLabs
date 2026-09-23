# Local Virtual Networking

For beginner and intermediate VM labs, use an isolated host-only network.

Suggested subnet:
```text
192.168.56.0/24
```

Example:
```text
Kali / Student VM     192.168.56.10
Ubuntu Target         192.168.56.20
Optional Windows VM   192.168.56.30
```

## Rules
- Do not use bridged networking for deliberately vulnerable targets.
- Keep the target isolated from campus systems.
- Use NAT only when a lab specifically requires package downloads.
- Return the target to host-only/internal networking before security testing.

## Quick Test
```bash
ping 192.168.56.20
```
