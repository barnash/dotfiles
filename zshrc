#source $HOME/antigen.zsh
#antigen init .antigenrc

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

fpath=($HOME/.zsh-completions $fpath)

export EDITOR=vim

# Locale
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# Aliases
alias ls='ls --color -F'
alias tojson='python -mjson.tool'
alias nptul="lsof -nP -i4TCP | grep LISTEN"
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d ' ' -f2"
alias dkps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.RunningFor}}\t{{.Status}}\t{{.Ports}}"'
alias dklogs='docker compose logs -t -f --tail=10'


# Check git managed directories
function checkgitdir() {
    directory=$(cd $1; pwd)
    result=$(git --git-dir $directory/.git --work-tree $directory status --porcelain 2>/dev/null | wc -l | awk '{print $1}')
    if [ "$result" != "0" ]; then
        red="\x1B[31m"
        nc="\x1B[0m"
        echo -e "git directory ${red}${directory}${nc} is dirty"
    fi
}

checkgitdir "$HOME/work/dotfiles"
checkgitdir "/etc"

if [ -f ~/.zshrc_private ]; then
    source ~/.zshrc_private
fi

# Aliases using private
alias dkstop="docker compose -f ${BOB_DIR}/docker-compose.yml stop"
alias dkstart="docker compose -f ${BOB_DIR}/docker-compose.yml start"
alias dkrestart="docker compose -f ${BOB_DIR}/docker-compose.yml restart"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#eval "$(rbenv init -)"

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
