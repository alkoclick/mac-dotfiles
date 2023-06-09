# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Let's be a simple human
export EDITOR=micro

# For GPG
export GPG_TTY=$(tty)

# Fancy terminal stuff, some of this is probably installed via Brew, so make sure it's sourced on zprofile
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

# For the Toolbox App
export PATH="$PATH:/Users/alex/Library/Application Support/JetBrains/Toolbox/scripts"

# Load aliases from separate file
. ~/.zsh_aliases

# Load environment specific aliases if any exist
[ -f ~/.custom_aliases.zsh ] && source ~/.custom_aliases.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# AWS IP lookup function
aws_lookup_ip() {
  if [ $# -lt 1 ]
  then
    echo "Usage: $funcstack[1] <IP or list of IPs separated by commas>"
    return
  fi

  QUERY_FMT="NetworkInterfaces[*].{ Type: InterfaceType, Description: Description, AZ: AvailabilityZone, PublicIP: Association.PublicIp, PrivateIP: PrivateIpAddress}"
  aws ec2 describe-network-interfaces --output table --query $QUERY_FMT --max-items 500 --filters "Name=addresses.private-ip-address,Values=$1"
  aws ec2 describe-network-interfaces --output table --query $QUERY_FMT --max-items 500 --filters "Name=association.public-ip,Values=$1"
}

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
