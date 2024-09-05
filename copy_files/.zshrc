# Let's be a simple human
export EDITOR=micro

# For GPG
export GPG_TTY=$(tty)

# Fancy terminal stuff, some of this is probably installed via Brew, so make sure it's sourced on zprofile
eval "$(starship init zsh)"

# For the Toolbox App
export PATH="$PATH:/Users/alex/Library/Application Support/JetBrains/Toolbox/scripts"

# Support completions for stuff
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Load aliases from separate file
. ~/.zsh_aliases

# Load environment specific aliases if any exist
[ -f ~/.custom_aliases.zsh ] && source ~/.custom_aliases.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Smarter cd courtesy of zoxide, has to be after compinit is called
eval "$(zoxide init --cmd cd zsh)"

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

# Extending the token lifetime for AWS tokens generated by granted automatically
# export GRANTED_ENABLE_AUTO_REASSUME=true
# Also allow the assume command to actually work
alias assume="source assume"

# Mac-specific configs
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export GODEBUG=asyncpreemptoff=1
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"
