# Intermediate 10 — Python for Cybersecurity

**Difficulty:** Intermediate  
**Estimated time:** 90 minutes  
**Prerequisites:** Intermediate 08  
**Environment:** Python 3

## Learning Objectives

Members should be able to:

- read multiple local files in Python
- parse key=value structured text
- write reusable parsing functions
- count and group events
- correlate events by session/user
- use dictionaries, lists, Counter, and defaultdict
- accept command-line arguments
- tolerate imperfect input
- produce useful analyst output
- explain when automation is preferable to manual analysis

## Guided Example

```python
from collections import Counter

users = Counter()

with open("auth.log") as f:
    for line in f:
        if "FAIL" in line:
            for field in line.split():
                if field.startswith("user="):
                    users[field.split("=",1)[1]] += 1

print(users)
```

## Challenge

Complete the starter parser in `challenge/parser.py`.

The parser now works across:

```text
auth.log
app.log
```

and must correlate successful authentication sessions with later application actions.

The objective is not simply to make the script run. Students should be able to explain the data model and why each structure was chosen.

## Deliverable

Your script should report:

- failed logins by user
- failed logins by source
- successful logins
- most frequent suspicious source

## Next Event

[Intermediate 11 — Intro to Reverse Engineering](../11-intro-to-reverse-engineering/)
