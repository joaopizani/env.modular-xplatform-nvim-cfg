#!/usr/bin/env bash

DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd)"


git -C "${DIR}" submodule update --init --recursive --remote

VIMPLUGURL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
curl -fLo "${DIR}/runtime/bundle/plug.vim" --create-dirs "${VIMPLUGURL}"

ln -s -f "${DIR}/_nvimrc"  "${HOME}/_nvimrc"

vim +PlugInstall +qall

