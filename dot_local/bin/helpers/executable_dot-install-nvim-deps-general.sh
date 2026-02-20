#!/bin/bash
set -euo pipefail

case "$(uname -s)" in
    Darwin)
        if command -v brew >/dev/null 2>&1; then
            CMD="brew install gcc make unzip"
        elif command -v port >/dev/null 2>&1; then
            CMD="sudo port install gcc make unzip"
        else
            echo "ERROR: No supported package manager found (brew, port)."
            exit 1
        fi
        ;;
    Linux)
        if command -v apt >/dev/null 2>&1; then
            CMD="sudo apt install -y gcc make unzip xclip"
        elif command -v dnf >/dev/null 2>&1; then
            CMD="sudo dnf install -y gcc make unzip xclip"
        elif command -v pacman >/dev/null 2>&1; then
            CMD="sudo pacman -S --noconfirm gcc make unzip xclip"
        else
            echo "ERROR: No supported package manager found (apt, dnf, pacman)."
            exit 1
        fi
        ;;
    *)
        echo "ERROR: Unsupported OS: $(uname -s)"
        exit 1
        ;;
esac

echo "Will run: $CMD"
printf "Proceed? [y/N] "
read -r reply
if [ "$reply" != "y" ] && [ "$reply" != "Y" ]; then
    echo "Aborted."
    exit 1
fi

$CMD
echo "Neovim build dependencies installed successfully."
