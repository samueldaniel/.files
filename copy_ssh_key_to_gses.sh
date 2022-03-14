#!/usr/bin/env bash
for host in $(cat $HOME/.ssh/config | awk '$0 !~ /Host \*/' | awk '/^[Host]/' | awk '{print $2}'); do
  set -x
  ssh-copy-id -i $HOME/.ssh/id_ed25519 sam@$host
  set +x
done
