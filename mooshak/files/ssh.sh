#!/bin/sh
cd /opt/mooshak/
ssh-keygen -A
exec /usr/sbin/sshd -D -e "$@"
