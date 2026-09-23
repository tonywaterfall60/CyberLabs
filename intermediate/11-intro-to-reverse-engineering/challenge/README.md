# Challenge — Analyze the Toy Binary

Build:

```bash
./build.sh
```

Then analyze `training-bin`.

## Tasks

1. Identify file type and architecture.
2. Inspect printable strings.
3. Identify imported library functions.
4. Run the program normally.
5. Determine what input causes the success path.
6. Identify one compiler/runtime protection visible from your tools.
7. Explain the difference between discovering behavior and exploiting behavior.

## Suggested Tools

```bash
file
strings
readelf
objdump
gdb
```

## Flag

The success path prints:

```text
SRU{}
```

Replace the middle later in the instructor copy if desired.
