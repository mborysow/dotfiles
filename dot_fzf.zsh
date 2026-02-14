# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/.oh-my-zsh/custom/plugins/fzf/bin* ]]; then
  export PATH="$PATH:$HOME/.oh-my-zsh/custom/plugins/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == *$HOME/.oh-my-zsh/custom/plugins/fzf/man* && -d "$HOME/.oh-my-zsh/custom/plugins/fzf/man" ]]; then
  export MANPATH="$MANPATH:$HOME/.oh-my-zsh/custom/plugins/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.oh-my-zsh/custom/plugins/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.oh-my-zsh/custom/plugins/fzf/shell/key-bindings.zsh"

bindkey -s '^p' 'vim $(fzf)\n'

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
