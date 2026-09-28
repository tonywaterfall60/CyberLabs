# Docker Setup

The canonical CyberLabs Docker installation, permissions, troubleshooting, and cleanup guide is:

[../resources/DOCKER_SETUP.md](../resources/DOCKER_SETUP.md)

Use that guide rather than maintaining separate Docker instructions in this directory.

## Quick Verification

~~~bash
docker --version
docker compose version
docker ps
~~~

## Standard Lab Pattern

~~~bash
docker compose up --build -d
docker compose ps
~~~

When finished:

~~~bash
docker compose down
~~~

Always follow the individual lab README when its startup or cleanup differs.

Do not expose intentionally vulnerable training services beyond the scope defined by the lab.
