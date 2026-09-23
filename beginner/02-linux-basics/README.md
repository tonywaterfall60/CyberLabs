# Beginner 02 — Linux Basics

**Time:** 75–90 minutes  
**Environment:** Linux VM, WSL, or club-provided Linux system

## Objectives
Members will practice:
- navigating directories
- reading files
- searching text
- permissions
- processes
- basic networking commands

## Lab
```bash
mkdir -p ~/cyberclub/linux-lab
cd ~/cyberclub/linux-lab
echo "web01 192.168.56.20" > hosts.txt
echo "analyst:x:1001" > users.txt
echo "INFO login successful" > app.log
echo "WARNING repeated login attempts" >> app.log
```

## Tasks
1. Display the current directory.
2. List all files with details.
3. Display `hosts.txt`.
4. Search `app.log` for `WARNING`.
5. Copy `app.log` to `app-backup.log`.
6. Display file permissions.
7. Use `ps` to view running processes.
8. Use `ip addr` to identify your interfaces.

## Challenge
Without opening `app.log` in a text editor, display only lines containing `login`.

## Cleanup
```bash
rm -rf ~/cyberclub/linux-lab
```
