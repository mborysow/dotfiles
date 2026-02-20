#!/bin/bash
set -euo pipefail

case "$(uname -s)" in
    Darwin)
        if command -v brew >/dev/null 2>&1; then
            CMD="brew install zellij"
        elif command -v port >/dev/null 2>&1; then
            CMD="sudo port install zellij"
        else
            echo "ERROR: No supported package manager found (brew, port)."
            exit 1
        fi
        ;;
    Linux)
        if command -v apt >/dev/null 2>&1; then
            CMD="sudo apt install -y zellij"
        elif command -v dnf >/dev/null 2>&1; then
            CMD="sudo dnf install -y zellij"
        elif command -v pacman >/dev/null 2>&1; then
            CMD="sudo pacman -S --noconfirm zellij"
        elif command -v brew >/dev/null 2>&1; then
            CMD="brew install zellij"
        elif command -v cargo >/dev/null 2>&1; then
            CMD="cargo install --locked zellij"
        else
            echo "ERROR: No supported package manager found (apt, dnf, pacman, brew, cargo)."
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
echo "zellij installed successfully."
