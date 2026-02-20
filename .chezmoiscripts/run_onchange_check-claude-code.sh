#!/bin/bash

if [ -f "${HOME}/.config/chezmoi/ignore-claude-code-check" ]; then
    exit 0
fi

if ! command -v claude >/dev/null 2>&1; then
    echo "WARNING: Claude Code is not installed. Run ~/.local/bin/dot-install-claude-code.sh to install."
fi
