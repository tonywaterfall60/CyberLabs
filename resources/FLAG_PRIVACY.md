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
- instructions describing the flag format,

but not the real event value.

## Private Source of Truth

Actual event values are stored in the private instructor repository:

~~~text
CyberLabs-Instructor/flags/PRIVATE_FLAGS.env
~~~

## Runtime Injection

Flag-bearing challenges read values from environment variables such as:

~~~text
FLAG_VALUE
LINUX_FLAG_VALUE
WEB_FLAG_VALUE
REV_FLAG_VALUE
PWN_FLAG_VALUE
RED_FLAG_VALUE
~~~

If no private value is supplied, the challenge returns:

~~~text
FLAG_NOT_CONFIGURED
~~~

## Why This Matters

A flag committed to a public Git repository should be treated as exposed even if it is later deleted.

Git history, forks, caches, and clones may retain it.

## Local-Lab Limitation

When a private flag is injected into a challenge running on a student's own VM, a sufficiently advanced student may be able to inspect the local process/container environment.

If the event requires the flag to remain secret from the host operating system as well, run that challenge on an instructor-controlled cyber-range host and allow students to interact only with the service.

## Maintainer Rule

Before committing a challenge, search the files for the intended private value and ensure only the runtime variable/hook is present.
