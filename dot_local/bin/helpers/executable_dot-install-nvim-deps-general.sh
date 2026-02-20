#!/bin/bash
set -euo pipefail

echo "Installing neovim build dependencies..."

case "$(uname -s)" in
    Darwin)
        if command -v brew >/dev/null 2>&1; then
            brew install gcc make unzip
        elif command -v port >/dev/null 2>&1; then
            sudo port install gcc make unzip
        else
            echo "ERROR: No supported package manager found (brew, port)."
            exit 1
        fi
        ;;
    Linux)
        if command -v apt >/dev/null 2>&1; then
            sudo apt install -y gcc make unzip xclip
        elif command -v dnf >/dev/null 2>&1; then
            sudo dnf install -y gcc make unzip xclip
        elif command -v pacman >/dev/null 2>&1; then
            sudo pacman -S --noconfirm gcc make unzip xclip
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

echo "Neovim build dependencies installed successfully."
