# Intermediate 10 — Python for Cybersecurity

**Difficulty:** Intermediate  
**Estimated time:** 90 minutes  
**Prerequisites:** Intermediate 08  
**Environment:** Python 3

## Learning Objectives

Members should be able to:

- read files in Python
- parse structured text
- count events
- use dictionaries/lists
- accept command-line arguments
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

## Deliverable

Your script should report:

- failed logins by user
- failed logins by source
- successful logins
- most frequent suspicious source

## Next Event

[Intermediate 11 — Intro to Reverse Engineering](../11-intro-to-reverse-engineering/)
