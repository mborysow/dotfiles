#!/bin/bash

if [ "$(uname -s)" != "Linux" ]; then exit 0; fi

if [ -f "${HOME}/.config/chezmoi/ignore-keychain-check" ]; then
    exit 0
fi

if ! command -v keychain >/dev/null 2>&1; then
    echo "WARNING: keychain is not installed. Run ~/.local/bin/dot-install-keychain.sh to install."
fi
