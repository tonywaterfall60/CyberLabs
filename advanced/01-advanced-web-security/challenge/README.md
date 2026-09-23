# Challenge — Object Authorization Review

Start:

```bash
docker compose up --build -d
```

Target:

```text
http://127.0.0.1:8500
```

## Scenario

The application has two fictional users:

- alice
- bob

Use the login links to establish a session.

## Tasks

1. Log in as alice.
2. Establish the normal request used to view Alice's report.
3. Send the request to Burp Repeater.
4. Change only the report object identifier.
5. Determine whether Alice can access Bob's report.
6. Repeat the test in the opposite direction.
7. Identify which server-side authorization control is missing.
8. Recommend a fix.
9. Identify what should be logged when unusual object IDs are requested.

## Scope

Only:

```text
127.0.0.1:8500
```

## Private Flag

If the event lead configured a private flag, successful access to the protected training object will include it.

The real value is not stored in this repository.

## Cleanup

```bash
docker compose down
```
