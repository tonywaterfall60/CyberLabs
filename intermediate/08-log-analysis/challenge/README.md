# Challenge — Authentication Incident

Run:

```bash
./setup.sh
```

Logs are created under:

```text
~/cyberclub/log-analysis
```

## Tasks

1. Count failed logins by user.
2. Count failed logins by source IP.
3. Identify whether any account later logs in successfully from the same suspicious source.
4. Correlate the successful login with `app.log`.
5. Build a timestamp-ordered timeline.
6. Identify the event that deserves the highest priority.
7. Recommend two additional logs or data sources you would request.

## Rules

Use command-line analysis. Do not manually count every line.

## Cleanup

```bash
./reset.sh
```
