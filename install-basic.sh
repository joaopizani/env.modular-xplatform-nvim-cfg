#!/usr/bin/env bash

DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd)"


cd "${DIR}"
git submodule update --init --recursive --remote
cd -

ln -s -f "${DIR}/_nvimrc"  "${HOME}/_nvimrc"

vim +PlugInstall +qall

