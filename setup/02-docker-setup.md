# Docker Setup

Docker is used for lightweight web and service labs.

## Verify
```bash
docker --version
docker compose version
```

## Start a Lab
```bash
docker compose up -d
```

## Check Status
```bash
docker compose ps
```

## Stop a Lab
```bash
docker compose down
```

## Full Reset
```bash
docker compose down -v
```

Only bind intentionally vulnerable services to localhost unless a lab explicitly requires another arrangement.
