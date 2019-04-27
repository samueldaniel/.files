#!/usr/bin/env bash
set -e
adduser fox
adduser fox sudo
usermod -a -G docker fox
