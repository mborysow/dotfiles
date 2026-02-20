#!/bin/bash
set -euo pipefail

if command -v apt >/dev/null 2>&1; then
    CMD="sudo apt install -y keychain"
elif command -v dnf >/dev/null 2>&1; then
    CMD="sudo dnf install -y keychain"
elif command -v pacman >/dev/null 2>&1; then
    CMD="sudo pacman -S --noconfirm keychain"
else
    echo "ERROR: No supported package manager found (apt, dnf, pacman)."
    exit 1
fi

echo "Will run: $CMD"
printf "Proceed? [y/N] "
read -r reply
if [ "$reply" != "y" ] && [ "$reply" != "Y" ]; then
    echo "Aborted."
    exit 1
fi

$CMD
echo "keychain installed successfully."
