from collections import Counter
import sys

if len(sys.argv) != 2:
    print("Usage: python3 parser.py auth.log")
    raise SystemExit(1)

path = sys.argv[1]
failed_users = Counter()
failed_sources = Counter()
success_count = 0

with open(path, encoding="utf-8") as f:
    for line in f:
        fields = line.strip().split()
        if not fields:
            continue
        status = fields[1]
        data = {}
        for field in fields[2:]:
            if "=" in field:
                k, v = field.split("=", 1)
                data[k] = v
        # TODO: update counters based on status and parsed fields.

print("Failed logins by user:", failed_users)
print("Failed logins by source:", failed_sources)
print("Successful logins:", success_count)

# TODO: print the source with the highest failed-login count.
