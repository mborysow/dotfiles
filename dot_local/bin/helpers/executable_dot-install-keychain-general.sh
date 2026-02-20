#!/bin/bash
set -euo pipefail

echo "Installing keychain..."

if command -v apt >/dev/null 2>&1; then
    sudo apt install -y keychain
elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y keychain
elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -S --noconfirm keychain
else
    echo "ERROR: No supported package manager found (apt, dnf, pacman)."
    exit 1
fi

echo "keychain installed successfully."
