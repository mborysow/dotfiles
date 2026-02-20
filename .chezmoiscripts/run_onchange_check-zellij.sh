#!/bin/bash

if [ -f "${HOME}/.config/chezmoi/ignore-zellij-check" ]; then
    exit 0
fi

if ! command -v zellij >/dev/null 2>&1; then
    echo "WARNING: zellij is not installed. Run ~/.local/bin/dot-install-zellij.sh to install."
fi
