# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Let's be a simple human
export EDITOR=micro

# For GPG
export GPG_TTY=$(tty)

# Fancy terminal stuff, some of this is probably installed via Brew, so make sure it's sourced on zprofile
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Load aliases from separate file
. ~/.zsh_aliases

# Load environment specific aliases if any exist
[ -f ~/.custom_aliases.zsh ] && source ~/.custom_aliases.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
