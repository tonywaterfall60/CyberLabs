# Hints — Live Linux Privilege Escalation

Read one hint at a time.

1. `sudo -l` reveals what commands your current account is allowed to run as another user.
2. The allowed command is `find`. `find` can do more than locate files.
3. Investigate `find`'s `-exec` action; it can run another program.
4. A program started by a root-owned `sudo find` process can inherit that root privilege inside this container. Choose a shell as the program to execute. See your instructor if you need a demonstration.

The goal is to understand the trust boundary and how to harden sudo, not just memorize a command.
