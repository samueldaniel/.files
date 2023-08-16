#!/usr/bin/env bash

in_repo_dir=$1
on_disk_dir=$2

function bootstrap() {
  rsync \
    --exclude ".DS_Store" \
    --exclude ".git/" \
    --exclude "README.md" \
    --exclude "bin/" \
    --exclude "data/" \
    -avh \
    --no-perms \
    $in_repo_dir \
    $on_disk_dir;
}

./bin/diff.sh $in_repo_dir $on_disk_dir

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
  bootstrap;
fi;
unset bootstrap;
