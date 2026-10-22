#!/usr/bin/env bash
set -euo pipefail
: "${LAB_FLAG:?Start the lab using ./start.sh to configure LAB_FLAG}"
umask 077
printf '%s\n' "$LAB_FLAG" > /root/root.txt
chown root:root /root/root.txt
chmod 600 /root/root.txt
unset LAB_FLAG
exec /usr/sbin/sshd -D -e
