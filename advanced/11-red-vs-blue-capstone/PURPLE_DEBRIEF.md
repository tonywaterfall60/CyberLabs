# Purple-Team Debrief

Complete this together after Red and Blue finish independently.

## Correlation

| Red action | Application decision | Request ID | Blue telemetry |
|---|---|---|---|
| | | | |

## Detection Quality

~~~text
What field made the event easiest to detect?
What field made Red/Blue correlation easiest?
What useful field was missing?
Could legitimate delegated access look similar?
How should that context be represented?
~~~

## Prevention

Write the correct server-side authorization decision in pseudocode.

## Detection After Remediation

After the bug is fixed, what should the logs show for a cross-user request?

How would the detection change from:

~~~text
cross_user == true AND result == allowed
~~~

to monitoring blocked authorization attempts?

## Lessons Learned

~~~text
Red learned:
Blue learned:
Logging improvement:
Application improvement:
Detection improvement:
Residual risk:
~~~