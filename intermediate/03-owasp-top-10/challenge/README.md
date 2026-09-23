# Challenge — Web Risk Classification

Classify each fictional finding and recommend a mitigation.

## Finding 1

An authenticated student changes `/grades/1201` to `/grades/1202` and sees another student's record.

## Finding 2

A search feature directly constructs a database query from user-provided text without parameterization.

## Finding 3

A production application still has verbose debugging enabled and reveals stack traces and environment details.

## Finding 4

Administrative accounts do not require MFA and allow unlimited password attempts.

## Finding 5

A critical administrative action succeeds, but the application creates no audit event identifying who performed it.

## Finding 6

A dependency is several years out of date and has published security fixes that have not been applied.

## Deliverable

For each:

```text
Category/theme:
Why:
Impact:
Mitigation:
Useful logging/detection:
```

## Bonus

Choose two findings and explain how they could combine into greater risk.
