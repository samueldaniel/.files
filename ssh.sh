#!/usr/bin/env bash
set -e
if [ "$USER" != "root" ]; then
  echo "run this as root!"
  exit 1
fi
SSHD_CONFIG="/etc/ssh/sshd_config"
mv $SSHD_CONFIG "$SSHD_CONFIG.bak"

DOTFILES=$(pwd)
ln -sf "$DOTFILES/sshd_config" $SSHD_CONFIG
systemctl restart sshd
