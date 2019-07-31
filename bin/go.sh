#!/usr/bin/env bash
set -e
source utils.sh
VERSION="1.12.7"
OS="linux"
ARCH="amd64"
GOSTR="go$VERSION.$OS-$ARCH"
BUILDDIR=$(realpath ../build)
echo -e "\n$(green)installing $GOSTR to $(blue)/usr/local$(reset)\n"
pushd $BUILDDIR
  wget https://dl.google.com/go/$GOSTR.tar.gz
  tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
popd
echo -e "\n$(green)done installing go$VERSION.$OS-$ARCH$(reset)\n"
