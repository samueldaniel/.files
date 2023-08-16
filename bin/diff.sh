#!/usr/bin/env bash

in_repo_dir=$1
on_disk_dir=$2

for in_repo_fpath in $(find $in_repo_dir -type f); do
  on_disk_fpath=$(echo $in_repo_fpath | sed "s,$in_repo_dir,$on_disk_dir,")
  diff_out=$(diff -rub $on_disk_fpath $in_repo_fpath)
  if [[ -n "${diff_out}" ]]; then
    echo "${diff_out}"
  fi
done
