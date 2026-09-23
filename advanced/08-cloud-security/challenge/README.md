# Challenge — Fictional Cloud Configuration Review

Files:

- `iam-policy.json`
- `bucket.json`
- `security-groups.json`

## Tasks

1. Identify IAM wildcard permissions.
2. Identify whether storage is publicly exposed.
3. Identify overly broad inbound network rules.
4. Rank findings by likely impact.
5. Recommend least-privilege changes.
6. Use `jq` to extract evidence.
7. Identify one additional cloud log/control you would request.

## Suggested Tools

```bash
jq
grep
python3
```

## Rule

Do not use real cloud credentials for this event.
