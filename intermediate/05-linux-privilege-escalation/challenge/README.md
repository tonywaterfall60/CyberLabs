# Challenge — Linux Privilege Audit

**Difficulty:** Intermediate  
**Estimated time:** 75–105 minutes

## Scenario

You received a static snapshot from a fictional Linux server. Your job is to identify privilege-boundary weaknesses without modifying any real system configuration.

## Setup

~~~bash
./setup.sh
cd ~/cyberclub/linux-privesc-audit
~~~

## Analysis Method

For every possible issue ask:

~~~text
What runs with higher privilege?
What can a lower-privileged user influence?
What evidence proves that relationship?
What additional validation would be needed?
What fixes the root cause?
~~~

## Tasks

1. Review identity/group context.
2. Review sudo policy excerpts.
3. Review scheduled tasks.
4. Compare permissions on scripts run by root.
5. Review plaintext configuration secrets.
6. Review SUID inventory and distinguish normal privileged binaries from evidence that needs more context.
7. Prioritize the findings.

## Required Finding Format

~~~text
Finding:
Evidence:
Higher-privileged execution:
Lower-user influence:
Potential impact:
Validation still needed:
Remediation:
Priority:
~~~

## Important

This is an audit challenge, not an exploitation walkthrough.

A useful rule is:

~~~text
privileged execution + lower-user control = high-value review area
~~~

but that relationship still needs evidence.

## Deliverable

Identify at least five conditions worth discussing, then rank the top three.

Also provide one example of something that is privileged but **not automatically a vulnerability**.

## Cleanup

~~~bash
./reset.sh
~~~