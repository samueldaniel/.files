#!/usr/bin/env bash

in_repo_dir=$1
on_disk_dir=$2

for in_repo_fpath in $(find $in_repo_dir -type f); do
  macos_override=$(echo $in_repo_fpath | sed "s,default,macos,")
  if [[ ! -f $macos_override ]]; then
    echo "This system has the default file: $in_repo_fpath"
    on_disk_fpath=$(echo $in_repo_fpath | sed "s,$in_repo_dir,$on_disk_dir,")
    diff_out=$(diff -rub $on_disk_fpath $in_repo_fpath)
    if [[ -n "${diff_out}" ]]; then
      echo "${diff_out}"
      read -p "Do you want to override this file? (y/n) " -n 1;
      echo "";
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        cp $in_repo_fpath $on_disk_fpath
      fi;
      echo
    fi
  else
    echo "macOS override exists: $macos_override"
    on_disk_fpath=$(echo $macos_override | sed "s,$in_repo_dir,$on_disk_dir,")
    diff_out=$(diff -rub $on_disk_fpath $macos_override)
    if [[ -n "${diff_out}" ]]; then
      echo "${diff_out}"
      read -p "Do you want to override this file? (y/n) " -n 1;
      echo "";
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        cp $macos_override $on_disk_fpath
      fi;
      echo
    fi
  fi
done
