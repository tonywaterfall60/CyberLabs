# Challenge — Container Security Audit and Hardening Review

## Challenge Snapshot

| Item | Details |
|---|---|
| Difficulty | Advanced |
| Estimated time | 90–120 minutes |
| Environment | Kali + Docker + static Dockerfile/Compose review |
| Authorized scope | Files and locally built audit image in this challenge |
| Goal | Identify build/image/runtime/host-boundary risks and compare hardening controls |
## Authorized Scope

Review only the provided challenge definitions and the locally built training image.

Do **not** run `compose.insecure.yml`.

## Setup

The event lead loads the private flag registry and prepares ignored runtime artifacts:

~~~bash
chmod +x prepare-flags.sh
./prepare-flags.sh
~~~

No insecure runtime should be started. Building the standalone image for inspection is allowed.

## Objectives / Tasks

### Files

~~~text
Dockerfile.insecure
compose.insecure.yml
Dockerfile.hardened.example
compose.hardened.example.yml
AUDIT_WORKSHEET.md
~~~

### Safety

Do **not** run `compose.insecure.yml`.

It intentionally includes host-level settings that are unsafe for a training workstation.

### Phase 1 — Build-Time Review

Inspect `Dockerfile.insecure`.

Identify:

- floating base tag,
- embedded secret material,
- default root execution,
- image/layer persistence concerns,
- unnecessary metadata/exposure.

### Phase 2 — Safe Image Inspection

Building the image itself is safe:

~~~bash
docker build -f Dockerfile.insecure -t cyberlabs-container-audit .
docker history --no-trunc cyberlabs-container-audit
docker inspect cyberlabs-container-audit
~~~

Determine whether embedded values are visible in image configuration/history.

### Phase 3 — Static Runtime Review

Review `compose.insecure.yml` only as text.

Identify the impact of:

~~~text
privileged: true
network_mode: host
/:/host
plaintext ADMIN_PASSWORD
~~~

Explain how each changes the container/host trust boundary.

After identifying the build/image/runtime/host-boundary risks and validating the most dangerous trust-boundary settings, inspect `runtime/risk-note.txt` and record the first dashboard flag.

### Phase 4 — Hardened Comparison

Compare against the provided hardened examples.

Create a table:

~~~text
Risk | Insecure setting | Hardened setting | Why it matters | Residual risk
~~~

### Phase 5 — Runtime-Control Reasoning

For each hardened setting explain whether it primarily affects:

~~~text
build
image
runtime
host boundary
~~~

### Phase 6 — Scanner Validation

If Trivy is available:

~~~bash
trivy image cyberlabs-container-audit
~~~

Pick two scanner findings and manually verify whether they are relevant to this image/use case.

Do not equate CVE count with risk.

After comparing the insecure and hardened definitions and explaining which risks disappear versus remain, inspect `runtime/hardening-note.txt` and record the second dashboard flag.

### Phase 7 — Residual Risk

Even after hardening, discuss:

- application vulnerabilities,
- base-image maintenance,
- Docker daemon/host security,
- secret lifecycle,
- logging/monitoring.

## Deliverable

Submit both discovered flags to the CyberLabs dashboard. Complete `AUDIT_WORKSHEET.md` plus:

~~~text
Top 3 findings:
Evidence from image history/inspect:
Most dangerous runtime setting:
Why:

Hardened comparison:
Scanner validation:
Residual risks:
~~~

## Cleanup

~~~bash
docker image rm cyberlabs-container-audit 2>/dev/null || true
rm -rf runtime
~~~