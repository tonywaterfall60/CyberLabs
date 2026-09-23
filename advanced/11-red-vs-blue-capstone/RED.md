# Red Team Objectives

Target:

```text
http://127.0.0.1:8600
```

## Objectives

1. Map normal user behavior.
2. Capture requests with Burp or curl.
3. Identify the object identifier used by the document API.
4. Validate whether one user can access another user's document.
5. If configured, retrieve the private runtime flag.
6. Record:
   - session/user
   - request
   - modified value
   - response
   - impact
7. Recommend a server-side fix.

## Rules

Only the local capstone target is authorized.
