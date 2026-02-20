#!/bin/bash
set -euo pipefail

CMD='curl --proto =https --tlsv1.2 -sSfL https://setup.atuin.sh | bash'

echo "Will run: $CMD"
printf "Proceed? [y/N] "
read -r reply
if [ "$reply" != "y" ] && [ "$reply" != "Y" ]; then
    echo "Aborted."
    exit 1
fi

if eval "$CMD"; then
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
