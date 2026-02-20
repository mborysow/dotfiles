#!/bin/bash
set -euo pipefail

CMD='curl -fsSL https://claude.ai/install.sh | bash'

echo "Will run: $CMD"
printf "Proceed? [y/N] "
read -r reply
if [ "$reply" != "y" ] && [ "$reply" != "Y" ]; then
    echo "Aborted."
    exit 1
fi

eval "$CMD"
