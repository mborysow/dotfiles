#!/bin/bash

if [ -f "${HOME}/.config/chezmoi/ignore-neovim-check" ]; then
    exit 0
fi

if [ -f "${HOME}/.config/chezmoi/ignore-nvim-check" ]; then
    exit 0
fi

if ! command -v nvim >/dev/null 2>&1; then
    echo "WARNING: neovim is not installed. Run ~/.local/bin/dot-install-neovim.sh to install."
fi
