#!/usr/bin/env bash

function bootstrap() {
  rsync \
    --exclude ".DS_Store" \
    --exclude ".git/" \
    --exclude "README.md" \
    --exclude "bin/" \
    --exclude "data/" \
    -avh \
    --no-perms \
    $HOME/.files/home/ \
    $HOME;
}

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  bootstrap;
fi;
unset bootstrap;
