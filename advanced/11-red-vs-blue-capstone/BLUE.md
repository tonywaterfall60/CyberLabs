# Blue Team Objectives

Log:

~~~text
runtime/app.log
~~~

## Objectives

1. Baseline login and normal document access.
2. Identify any event where:
~~~text
event = document_access
cross_user = true
result = allowed
~~~

3. Correlate the log `request_id` with Red's `X-Request-ID`.
4. Build a timeline from login through cross-user access.
5. Run the provided reference detector:
~~~bash
python3 detect_cross_user.py runtime/app.log
~~~

6. Write equivalent detection logic in plain English.
7. Identify possible legitimate delegated/admin access that would require context in a real system.
8. Recommend response, remediation, and additional telemetry.

## Suggested Tools

~~~bash
tail -f runtime/app.log
jq . runtime/app.log
grep cross_user runtime/app.log
python3 detect_cross_user.py runtime/app.log
~~~

## Evidence Template

~~~text
Alerting event:
Request ID:
User:
Document ID:
Owner:
Remote:
User-Agent:
Timeline:

Detection logic:
False-positive context:
Triage questions:
Recommended response:
Root-cause remediation:
~~~

## Debrief

Explain which Red action produced which observable log event and which fields made correlation possible.