#!/usr/bin/env bash
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  pushd $HOME
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    ./nvim.appimage --appimage-extract
    ./squashfs-root/AppRun --version
  popd
else
  echo "Unknown OSTYPE: ${OSTYPE}"
fi

