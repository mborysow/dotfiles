#!/bin/bash

if [ -f "${HOME}/.config/chezmoi/ignore-nvim-deps-check" ]; then
    exit 0
fi

if [ -f "${HOME}/.config/chezmoi/ignore-nvim-check" ]; then
    exit 0
fi

missing=()
command -v gcc >/dev/null 2>&1 || missing+=("gcc")
command -v make >/dev/null 2>&1 || missing+=("make")
command -v unzip >/dev/null 2>&1 || missing+=("unzip")

if [ "$(uname -s)" = "Linux" ]; then
    command -v xclip >/dev/null 2>&1 || command -v xsel >/dev/null 2>&1 || missing+=("xclip/xsel")
fi

if [ ${#missing[@]} -gt 0 ]; then
    echo "WARNING: Missing nvim build deps: ${missing[*]}. Run ~/.local/bin/dot-install-nvim-deps.sh to install."
fi
