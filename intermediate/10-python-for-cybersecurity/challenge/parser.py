from collections import Counter, defaultdict
import sys

if len(sys.argv) != 3:
    print("Usage: python3 parser.py auth.log app.log")
    raise SystemExit(1)

auth_path = sys.argv[1]
app_path = sys.argv[2]

failed_users = Counter()
failed_sources = Counter()
successes = []
actions_by_session = defaultdict(list)

def parse_kv_fields(fields):
    data = {}
    for field in fields:
        if "=" in field:
            key, value = field.split("=", 1)
            data[key] = value
    return data

# TODO 1:
# Parse auth_path.
# Count FAIL events by user/source.
# Save SUCCESS events with timestamp, user, src, session.

# TODO 2:
# Parse app_path.
# Group application events by session.

# TODO 3:
# Print the most common failed source if one exists.

# TODO 4:
# For each successful session, print related application actions.

print("Failed logins by user:", failed_users)
print("Failed logins by source:", failed_sources)
print("Successful logins:", successes)
print("Application actions by session:", dict(actions_by_session))