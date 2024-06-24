#!/bin/sh
#ssh-keygen -A
exec /usr/sbin/sshd -D -e "$@" 2>&1 |  tee -a /var/log/ssh.log
