# Challenge — Review an Insecure Container Definition

Files:

- `Dockerfile.insecure`
- `compose.insecure.yml`

## Tasks

1. Identify hard-coded secret material.
2. Identify whether the container runs as root.
3. Identify risky runtime settings.
4. Identify unnecessary host exposure.
5. Identify image/versioning concerns.
6. Build the image if desired and inspect:

```bash
docker history cyberlabs-container-audit
docker inspect cyberlabs-container-audit
```

7. Write a safer configuration plan.

## Safety

Do **not** run `compose.insecure.yml`.

It intentionally demonstrates settings that should be reviewed rather than executed.
