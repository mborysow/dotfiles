#!/bin/bash
set -euo pipefail

echo "Installing atuin..."

if curl --proto '=https' --tlsv1.2 -sSfL https://setup.atuin.sh | bash; then
    echo ""
    echo "Atuin installed successfully!"
    echo ""
    echo "First-time setup (open a new shell first):"
    echo "  atuin register -u <username> -e <email>"
    echo "  atuin import zsh"
    echo ""
    echo "Then encrypt and store your key in chezmoi:"
    echo "  chezmoi add --encrypt ~/.local/share/atuin/key"
    echo ""
    echo "On subsequent machines:"
    echo "  atuin login -u <username>"
    echo "  atuin import zsh"
    echo "  atuin sync"
else
    echo "ERROR: Failed to install atuin."
    exit 1
fi
