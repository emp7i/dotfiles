# Export Terminfo to remote server (ghostty specific)
function terminfo() {
  infocmp -x xterm-ghostty | ssh -i ~/Downloads/prod.pem $1 -- tic -x -
}

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/empti/.docker/completions $fpath)
autoload -Uz compinit
compinit

#FNM (A version manager for Node.js)
eval "$(fnm env --use-on-cd --shell zsh)"

#Google Gemini Setup
export GOOGLE_CLOUD_PROJECT="<GCP PROJECT ID>"

#mv - use GNU Coreutils version of mv instead of outdated MacOS one
alias mv=gmv

#Primetrace DB Passwords Output - only works inside db-grants dir
alias db-psw='tg output --json all_db_passwords | jq'

#krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

#asciinema
alias record='asciinema rec recording.cast'
alias play='asciinema play'

#syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#speedtest-cli
alias speed='speedtest-cli --share'

#nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#kutumb-aws-mfa function
function kutumb-aws-mfa() {
  zsh ~/Downloads/kutumb-mfa-with-otp.sh default $1
  export AWS_PROFILE=default-mfa && export AWS_REGION=ap-south-1
}
export AWS_PROFILE=default-mfa

#zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#bat
alias cat=bat

#eza
alias ls='eza --long --header --icons --git --reverse --sort=modified'

#fzf
source <(fzf --zsh)

#terraform and terragrunt aliases
alias tg=terragrunt
alias tf=terraform
alias fmt='terraform fmt --recursive'

#kubecolor/kubectl
alias k=kubecolor
source <(kubectl completion zsh)
compdef kubecolor=kubectl

#git
alias gcm='git checkout main'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gpull='git pull'
alias gpush='git push'
alias gbd='git branch -D'
alias gb='git branch'
alias gsts='git status'
alias stash='git stash'
alias pop='git stash pop'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#wget2
alias wget=wget2

#kubectx & kubens
alias kx=kubectx
alias kn=kubens

#thefuck
eval $(thefuck --alias)
alias f=fuck

#starship
eval "$(starship init zsh)"

#zoxide
eval "$(zoxide init zsh)"
alias cd=z

#mysql-client
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
