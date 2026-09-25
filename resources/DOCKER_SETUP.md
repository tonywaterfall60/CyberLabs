# Docker Setup for Kali Linux

CyberLabs uses Docker for many of the local web, networking, packet-analysis, CTF, and Advanced challenges.

Docker is **not guaranteed to be installed in a normal Kali Linux VM**, so complete this setup before attending a Docker-based CyberLabs event.

> **Important Kali note:** Do **not** install the package named `docker`. On Kali, the container engine package is named `docker.io`.

---

## What CyberLabs Expects

After setup, these commands should work:

~~~bash
docker --version
docker compose version
docker ps
~~~

CyberLabs uses the modern Compose v2 syntax:

~~~bash
docker compose up -d
docker compose down
~~~

not the older:

~~~text
docker-compose
~~~

---

# Quick Install

For a current Kali Rolling VM:

~~~bash
sudo apt update
sudo apt install -y docker.io docker-compose
~~~

Start Docker now and enable it at boot:

~~~bash
sudo systemctl enable docker --now
~~~

Check the service:

~~~bash
sudo systemctl status docker
~~~

Press `q` to exit the status screen.

---

# Verify Docker

Check the Docker client:

~~~bash
docker --version
~~~

Check Docker Compose:

~~~bash
docker compose version
~~~

Check that the daemon is reachable:

~~~bash
sudo docker ps
~~~

You should see a table even if no containers are running.

---

# Run the Docker Test Container

Run Docker's standard test image:

~~~bash
sudo docker run --rm hello-world
~~~

The first run may download the image.

A successful result confirms that:

1. the Docker client works,
2. the Docker daemon is running,
3. the VM can pull an image,
4. containers can start.

---

# Use Docker Without sudo

By default, your normal Kali user may receive an error such as:

~~~text
permission denied while trying to connect to the Docker daemon socket
~~~

Example:

~~~text
permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock
~~~

Add your current user to the `docker` group:

~~~bash
sudo usermod -aG docker $USER
~~~

Then **log out of Kali and log back in**.

A full VM reboot also works:

~~~bash
sudo reboot
~~~

After logging back in, verify:

~~~bash
groups
~~~

You should see:

~~~text
docker
~~~

Then test without sudo:

~~~bash
docker ps
~~~

## Optional: Refresh the Group in the Current Terminal

Instead of logging out, this may work:

~~~bash
newgrp docker
~~~

However, logging out and back in is the cleanest approach for club members.

---

# Security Note About the docker Group

Membership in the `docker` group gives a user very powerful access to the local machine.

For practical purposes, Docker group access can allow actions comparable to root-level control of the host.

CyberLabs uses this setup because members are working inside their own disposable Kali training VMs.

Do not casually add users to the Docker group on shared or production systems.

---

# First CyberLabs Docker Test

After cloning CyberLabs:

~~~bash
git clone https://github.com/tonywaterfall60/CyberLabs.git
cd CyberLabs
~~~

A simple Docker-based lab to test is:

~~~bash
cd beginner/06-intro-to-nmap/challenge
docker compose up -d
~~~

Check the containers:

~~~bash
docker compose ps
~~~

Then verify the local services:

~~~bash
curl http://127.0.0.1:8080/
curl http://127.0.0.1:8088/
~~~

When finished:

~~~bash
docker compose down
~~~

---

# Standard CyberLabs Docker Workflow

Most Docker-based events use this pattern.

## 1. Enter the Challenge

~~~bash
cd CyberLabs
git pull
cd <track>/<event>/challenge
~~~

Example:

~~~bash
cd intermediate/02-web-enumeration/challenge
~~~

## 2. Read the Instructions

~~~bash
cat README.md
~~~

## 3. Start the Challenge

If the lab includes a Dockerfile:

~~~bash
docker compose up --build -d
~~~

If it only uses existing images:

~~~bash
docker compose up -d
~~~

## 4. Check Status

~~~bash
docker compose ps
~~~

## 5. View Logs if Needed

~~~bash
docker compose logs
~~~

Follow logs live:

~~~bash
docker compose logs -f
~~~

Press:

~~~text
Ctrl+C
~~~

to stop following the logs.

## 6. Stop the Challenge

~~~bash
docker compose down
~~~

Always stop a previous challenge before starting another one if they use overlapping ports.

---

# Useful Docker Commands

## Running Containers

~~~bash
docker ps
~~~

## All Containers

~~~bash
docker ps -a
~~~

## Downloaded Images

~~~bash
docker images
~~~

## Container Logs

~~~bash
docker logs <container-name>
~~~

## Compose Services

~~~bash
docker compose ps
~~~

## Stop a Compose Lab

~~~bash
docker compose down
~~~

## Rebuild After a Challenge Update

~~~bash
docker compose down
docker compose up --build -d
~~~

## Force a Fresh Build

~~~bash
docker compose build --no-cache
docker compose up -d
~~~

Use this only when normal rebuilding is not picking up expected changes.

---

# Common CyberLabs Errors

## Error: permission denied on /var/run/docker.sock

Example:

~~~text
permission denied while trying to connect to the Docker daemon socket
~~~

### Cause

Your account does not currently have permission to use the Docker socket.

### Fix

~~~bash
sudo usermod -aG docker $USER
sudo reboot
~~~

After reboot:

~~~bash
docker ps
~~~

---

## Error: Cannot connect to the Docker daemon

Example:

~~~text
Cannot connect to the Docker daemon at unix:///var/run/docker.sock
~~~

### Check Docker

~~~bash
sudo systemctl status docker
~~~

Start it:

~~~bash
sudo systemctl start docker
~~~

Enable it at boot:

~~~bash
sudo systemctl enable docker
~~~

Or do both:

~~~bash
sudo systemctl enable docker --now
~~~

---

## Error: docker compose is not a docker command

Check:

~~~bash
docker compose version
~~~

If Compose is missing:

~~~bash
sudo apt update
sudo apt install -y docker-compose
~~~

Then retry:

~~~bash
docker compose version
~~~

CyberLabs expects Compose v2 and the command:

~~~text
docker compose
~~~

---

## Error: port is already allocated

Example:

~~~text
Bind for 127.0.0.1:8200 failed: port is already allocated
~~~

Find what is using the port:

~~~bash
ss -tulpn
~~~

Check Docker containers:

~~~bash
docker ps
~~~

A previous CyberLabs challenge may still be running.

Return to that challenge directory and run:

~~~bash
docker compose down
~~~

If you do not know which Compose project started it:

~~~bash
docker ps
~~~

Identify the old training container before stopping it.

Do not randomly kill unrelated services.

---

## Error: container exits immediately

Check:

~~~bash
docker compose ps
docker compose logs
~~~

If the challenge builds its own image:

~~~bash
docker compose up --build
~~~

Running without `-d` temporarily lets you see startup errors directly.

Press `Ctrl+C` when finished troubleshooting.

---

## Error: image pull fails

Check Internet access:

~~~bash
ping -c 2 1.1.1.1
~~~

Check DNS:

~~~bash
dig docker.io
~~~

Then retry:

~~~bash
docker compose pull
docker compose up -d
~~~

Some campus or corporate networks may restrict registry access.

If that happens during a club meeting, notify the event lead instead of changing the challenge to an unrelated public target.

---

## Error: build seems to use old files

Try:

~~~bash
docker compose down
docker compose up --build -d
~~~

If the problem persists:

~~~bash
docker compose build --no-cache
docker compose up -d
~~~

Also confirm you pulled the newest CyberLabs version:

~~~bash
git pull
~~~

---

# Check Which Ports a Challenge Uses

Before starting a lab, inspect:

~~~bash
cat docker-compose.yml
~~~

or:

~~~bash
docker compose config
~~~

CyberLabs normally binds vulnerable/training services only to loopback:

~~~text
127.0.0.1
~~~

Example:

~~~yaml
ports:
  - "127.0.0.1:8200:5000"
~~~

This means the challenge is exposed to the local Kali VM rather than every device on the surrounding network.

Do not change a loopback binding to:

~~~text
0.0.0.0
~~~

unless an instructor specifically designed the lab that way.

---

# Docker and Kali VM Resources

Docker runs inside your Kali VM, so the VM must have enough resources for both Kali and the containers.

A practical starting point for CyberLabs is:

~~~text
CPU:       2 or more virtual CPUs
RAM:       4 GB minimum
           8 GB preferred for heavier Advanced labs
Disk:      30+ GB recommended
Network:   NAT is normally sufficient
~~~

If Kali becomes extremely slow while containers are running, check VM CPU, memory, and free disk space.

Disk space:

~~~bash
df -h
~~~

Docker disk usage:

~~~bash
docker system df
~~~

---

# Cleaning Up Docker

Normal CyberLabs cleanup should use:

~~~bash
docker compose down
~~~

Do **not** routinely run destructive global cleanup commands during club labs.

For example, avoid blindly running:

~~~text
docker system prune -a
~~~

because it can remove images, stopped containers, networks, and cached resources from unrelated work.

If disk space becomes a problem, inspect usage first:

~~~bash
docker system df
docker ps -a
docker images
~~~

Then remove only resources you understand.

---

# Before Every Docker-Based Club Event

Run:

~~~bash
cd ~/CyberLabs
git pull
docker --version
docker compose version
docker ps
~~~

Then enter the event challenge directory.

Example:

~~~bash
cd intermediate/02-web-enumeration/challenge
cat README.md
docker compose up --build -d
docker compose ps
~~~

At the end:

~~~bash
docker compose down
~~~

---

# Quick Troubleshooting Checklist

If a lab does not start, check these in order:

~~~text
1. Am I in the correct challenge directory?
2. Did I run git pull?
3. Is Docker installed?
4. Is Docker running?
5. Does my user have Docker permission?
6. Is Docker Compose available?
7. Is the required port already in use?
8. What does docker compose ps show?
9. What does docker compose logs show?
10. Did the image/build fail?
~~~

Commands:

~~~bash
pwd
git status
docker --version
docker compose version
systemctl status docker
groups
docker ps
docker compose ps
docker compose logs
ss -tulpn
~~~

---

# Optional: Docker CE Instead of Kali's docker.io

CyberLabs recommends the Kali repository version for simplicity:

~~~bash
sudo apt install -y docker.io docker-compose
~~~

Advanced users may instead install Docker CE from Docker's Debian repository.

If you choose Docker CE, follow the current official Docker Debian instructions rather than mixing packages from multiple installation methods.

For normal CyberLabs use, Docker CE is not required.

---

# Summary

For most Kali CyberLabs VMs, initial setup is:

~~~bash
sudo apt update
sudo apt install -y docker.io docker-compose
sudo systemctl enable docker --now
sudo usermod -aG docker $USER
sudo reboot
~~~

After reboot:

~~~bash
docker --version
docker compose version
docker ps
~~~

If all three work, your Kali VM is ready for Docker-based CyberLabs challenges.
