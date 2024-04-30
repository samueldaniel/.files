#!/usr/bin/env bash

in_repo_dir=$1
on_disk_dir=$2

for in_repo_fpath in $(find $in_repo_dir -type f); do
  #macos_override=$(echo $in_repo_fpath | sed "s,default,macos,")
  #if [[ ! -f $macos_override ]]; then
  on_disk_fpath=$(echo $in_repo_fpath | sed "s,$in_repo_dir,$on_disk_dir,")
  stat $on_disk_fpath >/dev/null 2>&1
  stat_ret=$?
  if [[ "1" -eq "${stat_ret}" ]]; then
    # file does not exist
    echo "${on_disk_fpath} does not exist."
    read -p "Do you want to add this file? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      cp $in_repo_fpath $on_disk_fpath
    fi;
    echo
  else
    echo "${on_disk_fpath} exists. Diffing..."
    diff_out=$(diff -rub $on_disk_fpath $in_repo_fpath)
    if [[ -n "${diff_out}" ]]; then
      echo "${diff_out}"
      read -p "Do you want to update this file? (y/n) " -n 1;
      echo "";
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        cp $in_repo_fpath $on_disk_fpath
      fi;
      echo
    else
      echo "${on_disk_fpath} does not differ from repo"
    fi;
  fi;
  #else
  #  echo "macOS override exists: $macos_override"
  #  on_disk_fpath=$(echo $macos_override | sed "s,$in_repo_dir,$on_disk_dir,")
  #  diff_out=$(diff -rub $on_disk_fpath $macos_override)
  #  if [[ -n "${diff_out}" ]]; then
  #    echo "${diff_out}"
  #    read -p "Do you want to override this file? (y/n) " -n 1;
  #    echo "";
  #    if [[ $REPLY =~ ^[Yy]$ ]]; then
  #      cp $macos_override $on_disk_fpath
  #    fi;
  #    echo
  #  fi
  #fi
done
