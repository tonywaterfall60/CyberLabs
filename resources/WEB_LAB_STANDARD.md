# CyberLabs Web Lab UI Standard

All student-facing web challenges should look like parts of the same training platform.

## Visual Identity

Use a consistent dark technical layout:

- dark navy page background
- centered content container
- top navigation bar
- small "CyberLabs" brand label
- level badge: Beginner / Intermediate / Advanced
- cards for routes, status, or training data
- monospace styling for paths, headers, IDs, and commands
- restrained accent color
- readable spacing and contrast

## Standard Page Structure

Each page should contain:

1. CyberLabs header
2. level + challenge name
3. short explanation of the page
4. navigation to normal app routes
5. one or more cards containing realistic training content
6. footer stating that the service is an authorized local training environment

## Content Principles

Pages should feel like small real applications rather than blank proof-of-concept pages.

Good training content includes:

- account/dashboard cards
- service status tables
- recent activity
- search forms
- API status
- report/document lists
- admin notices
- inventory records

Do not add unnecessary complexity that distracts from the lab objective.

## Consistency vs. Difficulty

The visual shell should stay consistent while the security behavior becomes more advanced:

### Beginner
Students learn:
- routes
- status codes
- headers
- robots.txt
- proxy basics

### Intermediate
Students learn:
- cookies
- parameters
- hidden routes
- content discovery
- Burp Repeater
- attack-surface mapping

### Advanced
Students learn:
- sessions
- authorization boundaries
- object access
- evidence collection
- defensive telemetry

## Route Design

Prefer predictable route naming:

- /
- /about
- /status or /api/status
- /search
- /dashboard
- /admin
- /api/...

Use robots.txt only when it supports the teaching objective.

## Training Banner

Every application should visibly state that it is a local authorized training service.

## Headers

Use challenge-specific headers consistently, for example:

~~~text
X-CyberLabs-Level: beginner
X-CyberLabs-Lab: web-basics
~~~

## Flag Privacy

Never place a filled-in flag in public HTML or source.

Flag-bearing apps should use runtime instructor injection as documented in:

~~~text
resources/FLAG_PRIVACY.md
~~~
