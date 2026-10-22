# CyberLabs — Live Linux Privilege Escalation (Intermediate 25)

**Time:** 60–90 minutes | **Tools:** Kali Linux, Docker Compose, SSH | **Goal:** From `student` to root **inside the lab container**, then retrieve `/root/root.txt`.

This lab follows [Intermediate 05 — Linux Privilege Escalation Foundations](../05-linux-privilege-escalation/) and is intended for the in-person PowerPoint → Kali → challenge workflow.

## Scope and safety

This is an intentionally vulnerable **local Docker container**. Connect **only** to `127.0.0.1:2222` on your own Kali VM. Never publish it to a LAN, expose it on a public server, or use its configuration for production. Docker root is **not host root**. Do not mount the Docker socket, use `--privileged`, add host bind mounts, or attach this challenge to other networks. The challenge uses a purposely weak password and sudo policy for learning.

You need Docker Engine + Compose plugin working on Kali. Check:

```bash
docker info
docker compose version
```

If `docker info` says permission denied, ask the instructor to help configure your Docker access. Membership in the `docker` group grants powerful host control.

## Launch on your own Kali

If you already cloned CyberLabs:

```bash
cd ~/CyberLabs
git pull
cd intermediate/25-live-linux-privilege-escalation
bash start.sh
```

If you have not cloned it:

```bash
git clone https://github.com/tonywaterfall60/CyberLabs.git
cd CyberLabs/intermediate/25-live-linux-privilege-escalation
bash start.sh
```

Connect in **another terminal**:

```bash
ssh -p 2222 student@127.0.0.1
```

Password: `cyberlabs`. The first SSH connection may ask you to accept a new host key. If you reset/rebuild and SSH warns of a changed key, first confirm you're still connecting to your own local lab, then remove the old key with `ssh-keygen -R '[127.0.0.1]:2222'`.

## Learning tasks (do these in order)

1. **Identify your user.** Run `whoami`, `id`, `pwd`. Explain UID 0, your groups, and why `student` cannot normally read `/root/root.txt`.
2. **Enumerate safely.** Run `ls -ld /root`, `ls -l /opt/training`, `sudo -l`. Record the *exact* command allowed via sudo and why permission matters.
3. **Form a hypothesis.** Which root-authorized utility can execute a secondary command? Consult `man find` or `find --help` for execution options. Explain why granting unrestricted sudo access to a general-purpose utility is dangerous.
4. **Escalate within the lab.** Demonstrate a root shell using only the intentionally misconfigured sudo capability. Prove with `whoami` and `id`.
5. **Capture your flag.** Read `/root/root.txt` **from your root session**, copy the `SRU{...}` flag, and submit it in the club dashboard **if your instructor configured dashboard validation for this lab**.
6. **Explain the fix.** Suggest a least-privilege sudo policy that prevents the issue. Explain why an unrestricted command is different from a narrow fixed operation.

**Deliverable:** Enumeration notes, the misconfiguration, command used, root proof, remediation, and a flag. Do not write up Docker-host bypasses as a solution.

## Hint ladder

Use [HINTS.md](HINTS.md) only when needed.

## Stop and reset

```bash
docker compose down       # stop while keeping your current generated flag in .env
bash reset.sh             # stop and remove .env
bash start.sh             # rebuild/start with a fresh generated flag
```

**Flag note:** By default each student receives a different locally generated flag, which the existing dashboard will **not** automatically recognize. Instructors can provision a known event flag with `LAB_FLAG='SRU{YOUR_APPROVED_EVENT_FLAG}' bash start.sh` on the first launch (before `.env` exists); follow instructor-only guidance. Generated `.env` is ignored by Git. Since each student controls their local Docker host, the security boundary and flag are educational rather than tamperproof.

## Troubleshooting

- **Port 2222 busy:** stop other lab containers using that port with `docker ps`; avoid changing the localhost-only binding.
- **Connection refused:** check `docker compose ps` and `docker compose logs`.
- **Docker daemon error:** instructor may need `sudo systemctl enable --now docker` on Kali.
- **SSH key changed after reset:** use `ssh-keygen -R '[127.0.0.1]:2222'` after verifying this is your own instance.
- **Start from repo path:** `cd` to the lab folder before using `docker compose` directly.
