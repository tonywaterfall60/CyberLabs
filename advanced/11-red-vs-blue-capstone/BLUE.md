# Blue Team Objectives

Log:

```text
runtime/app.log
```

## Objectives

1. Identify login activity.
2. Identify document-access events.
3. Find any event where:
   ```text
   cross_user = true
   ```
4. Build a timeline from login through suspicious access.
5. Write detection logic for cross-user document access.
6. Recommend additional fields/telemetry.
7. Recommend remediation.

## Suggested Tools

```bash
jq
grep
python3
```

## Debrief

Explain which red-team action produced which observable log event.
