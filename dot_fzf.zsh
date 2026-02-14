# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/borysow/.oh-my-zsh/custom/plugins/fzf/bin* ]]; then
  export PATH="$PATH:/Users/borysow/.oh-my-zsh/custom/plugins/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/borysow/.oh-my-zsh/custom/plugins/fzf/man* && -d "/Users/borysow/.oh-my-zsh/custom/plugins/fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/borysow/.oh-my-zsh/custom/plugins/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/borysow/.oh-my-zsh/custom/plugins/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/borysow/.oh-my-zsh/custom/plugins/fzf/shell/key-bindings.zsh"

bindkey -s '^p' 'vim $(fzf)\n'

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
