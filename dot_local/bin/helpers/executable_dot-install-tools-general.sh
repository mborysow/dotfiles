#!/bin/bash
set -euo pipefail

echo "Installing CLI tools (rg, fzf, bat, eza, fd, age)..."

case "$(uname -s)" in
    Darwin)
        if command -v port >/dev/null 2>&1; then
            sudo port install ripgrep fzf bat eza age fd
        elif command -v brew >/dev/null 2>&1; then
            brew install ripgrep fzf bat eza age fd
        else
            echo "ERROR: No supported package manager found (port, brew)."
            exit 1
        fi
        ;;
    Linux)
        if command -v apt >/dev/null 2>&1; then
            sudo apt install -y ripgrep fzf bat eza fd-find age
            # Create symlinks for Debian/Ubuntu naming differences
            if [ -x /usr/bin/batcat ] && [ ! -e "${HOME}/.local/bin/bat" ]; then
                mkdir -p "${HOME}/.local/bin"
                ln -s /usr/bin/batcat "${HOME}/.local/bin/bat"
                echo "Created symlink: ~/.local/bin/bat -> /usr/bin/batcat"
            fi
            if [ -x /usr/bin/fdfind ] && [ ! -e "${HOME}/.local/bin/fd" ]; then
                mkdir -p "${HOME}/.local/bin"
                ln -s /usr/bin/fdfind "${HOME}/.local/bin/fd"
                echo "Created symlink: ~/.local/bin/fd -> /usr/bin/fdfind"
            fi
        elif command -v dnf >/dev/null 2>&1; then
            sudo dnf install -y ripgrep fzf bat-cat eza fd-find age
        elif command -v pacman >/dev/null 2>&1; then
            sudo pacman -S --noconfirm ripgrep fzf bat eza fd age
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

echo "CLI tools installed successfully."
