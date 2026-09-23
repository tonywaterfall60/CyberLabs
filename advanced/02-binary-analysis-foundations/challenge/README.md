# Challenge — Characterize the Crash

Build:

```bash
./build.sh
```

Analyze:

```text
vuln-bin
```

## Tasks

1. Identify architecture and linking.
2. Run `checksec`.
3. Identify the unsafe input operation.
4. Reproduce a crash with oversized input.
5. Inspect the crash in GDB.
6. Determine whether instruction-pointer control has been demonstrated or only a crash.
7. Identify two source-level fixes.
8. Identify two compiler/runtime mitigations.

## Scope

Only the provided local toy binary.

Do not reuse the workflow against unrelated software.

## Flag

No student-visible flag is stored in this challenge.
