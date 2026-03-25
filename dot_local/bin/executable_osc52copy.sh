#!/bin/bash
# ~/.local/bin/osc52copy
buf=$(cat)
encoded=$(printf '%s' "$buf" | base64 | tr -d '\n')
printf '\033]52;c;%s\a' "$encoded" > /dev/tty
