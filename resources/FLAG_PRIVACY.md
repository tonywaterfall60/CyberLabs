# Challenge Flag Privacy

CyberLabs challenge flags use the format:

~~~text
SRU{...}
~~~

## Public Repository Rule

The student-facing repository must **never contain a filled-in challenge flag**.

Public challenge code may contain:

- an environment-variable name,
- a placeholder such as `FLAG_NOT_CONFIGURED`,
- challenge logic that reveals an instructor-injected value at runtime,
- instructions describing the flag format,

but not the real event value.

## Private Source of Truth

Actual event values are stored in the private instructor repository:

~~~text
CyberLabs-Instructor/flags/PRIVATE_FLAGS.env
~~~

The instructor repository is the canonical source used by event infrastructure and the website dashboard.

## Dashboard Verification

The CyberLabs website/dashboard is the **only flag verifier**.

Students submit discovered `SRU{...}` values to the dashboard. The dashboard compares submissions against the private instructor flag set and awards challenge/leaderboard credit.

The public repository must not contain local scripts that verify answers and print flags. This keeps validation logic centralized and prevents public challenge files from duplicating the dashboard.

## Runtime Injection

Flag-bearing labs receive their flag values from the private instructor configuration at event/runtime setup.

Public challenge code may read environment variables such as:

~~~text
FLAG_VALUE
LINUX_FLAG_VALUE
WEB_FLAG_VALUE
REV_FLAG_VALUE
PWN_FLAG_VALUE
RED_FLAG_VALUE
~~~

If no private value is supplied, a challenge may return:

~~~text
FLAG_NOT_CONFIGURED
~~~

A lab should expose or reveal the injected flag only through the intended challenge artifact, service, evidence path, or milestone.

## Why This Matters

A flag committed to a public Git repository should be treated as exposed even if it is later deleted.

Git history, forks, caches, and clones may retain it.

Central dashboard verification also means leaderboard scoring does not depend on local student-side validation.

## Local-Lab Limitation

When a private flag is injected into a challenge running on a student's own VM, a sufficiently advanced student may be able to inspect the local process/container environment.

If the event requires the flag to remain secret from the host operating system as well, run that challenge on an instructor-controlled cyber-range host and allow students to interact only with the service.

## Maintainer Rule

Before committing a challenge:

1. search the public files for the intended private value,
2. confirm that no filled-in `SRU{...}` value is present,
3. confirm that no local answer/flag verifier is being used in place of the dashboard,
4. verify that only the intended runtime variable/hook remains public.
