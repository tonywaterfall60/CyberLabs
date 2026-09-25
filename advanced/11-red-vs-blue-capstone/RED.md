# Red Team Objectives

Target:

~~~text
http://127.0.0.1:8600
~~~

## Objectives

1. Map normal user behavior.
2. Establish Alice and Bob baselines.
3. Capture one normal document API request.
4. Record the normal object ID and response request ID.
5. Change **only** the object identifier to the other known document.
6. Send one controlled cross-user request.
7. Record the exact request, response, `X-Request-ID`, and impact.
8. If configured, record the private runtime flag as proof of completion.
9. Recommend the server-side authorization fix.

## Evidence Template

~~~text
Authenticated user:
Normal object ID:
Baseline request:
Baseline response:

Modified field:
Modified request:
Observed response:
X-Request-ID:
Impact:
Confidence:
~~~

## Rules

- Only the local capstone target is authorized.
- Do not enumerate arbitrary document IDs.
- Do not brute force, fuzz, or use automated attack scanners.
- Change one variable at a time.