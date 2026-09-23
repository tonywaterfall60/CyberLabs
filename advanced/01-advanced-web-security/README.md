# Advanced 01 — Advanced Web Security

**Time:** 90 minutes  
**Scope:** Instructor-provided local application only

## Objectives
Members will practice:
- creating a structured web application threat model
- identifying trust boundaries
- analyzing authentication and authorization assumptions
- validating findings inside an authorized lab
- writing mitigation guidance

## Exercise
```text
Browser
   |
Web Application
   |
API
   |
Database
```

For each boundary, identify:
- trusted input assumptions
- authentication controls
- authorization controls
- sensitive data
- likely logging points
- defensive validation opportunities

## Deliverable
Prepare a concise finding with:
1. Title
2. Affected component
3. Preconditions
4. Observation
5. Security impact
6. Reproduction notes within the lab
7. Recommended remediation
8. Detection/logging ideas

Do not test systems outside the instructor-provided environment.
