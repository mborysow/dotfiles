#!/bin/bash
set -euo pipefail

WORK_HELPER="${HOME}/.local/bin/helpers/dot-install-claude-code-work.sh"
GENERAL_HELPER="${HOME}/.local/bin/helpers/dot-install-claude-code-general.sh"

if [ -x "$WORK_HELPER" ]; then
    echo "Work environment detected. Running work installer..."
    exec "$WORK_HELPER"
elif [ -x "$GENERAL_HELPER" ]; then
    exec "$GENERAL_HELPER"
else
    echo "ERROR: No installer helper found in ~/.local/bin/helpers/"
    exit 1
fi
