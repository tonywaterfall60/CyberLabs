# Challenge — Authentication Log Analysis

Run:

```bash
./setup.sh
```

The generated log is located at:

```text
~/cyberclub/cli-challenge/auth.log
```

## Rules

Solve the questions with command-line pipelines. Do not manually count entries.

## Questions

1. How many `FAILED_LOGIN` events occurred?
2. Which username appears most often in failed logins?
3. How many successful logins occurred?
4. Save all failed-login events into `failed.txt`.
5. Create `failed-count.txt` containing only the number of failed events.
6. Display only the source IPs from failed-login events.
7. Sort the failed-login source IPs.

## Deliverable

Submit the commands you used and the answers.

## Cleanup

```bash
./reset.sh
```
