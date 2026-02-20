#!/bin/bash

if [ -f "${HOME}/.config/chezmoi/ignore-tools-check" ]; then
    exit 0
fi

missing=()
command -v rg >/dev/null 2>&1 || missing+=("rg")
command -v fzf >/dev/null 2>&1 || missing+=("fzf")
command -v bat >/dev/null 2>&1 || command -v batcat >/dev/null 2>&1 || missing+=("bat")
command -v eza >/dev/null 2>&1 || missing+=("eza")
command -v fd >/dev/null 2>&1 || command -v fdfind >/dev/null 2>&1 || missing+=("fd")
command -v age >/dev/null 2>&1 || missing+=("age")

if [ ${#missing[@]} -gt 0 ]; then
    echo "WARNING: Missing tools: ${missing[*]}. Run ~/.local/bin/dot-install-tools.sh to install."
fi
