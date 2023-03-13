#!/usr/bin/env bash

for in_repo in $(find $HOME/.files/home -type f); do
  in_home=$(echo $in_repo | sed 's/\.files\/home\///g')
  diff_out=$(diff -rub $in_home $in_repo)
  if [[ -n "${diff_out}" ]]; then
    echo "${diff_out}"
  fi
done
