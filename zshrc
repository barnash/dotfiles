#source $HOME/antigen.zsh
#antigen init .antigenrc

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
alias dklogs='docker-compose logs -t -f --tail=10'


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
alias dkstop="docker-compose -f ${BOB_DIR}/docker-compose.yml stop"
alias dkstart="docker-compose -f ${BOB_DIR}/docker-compose.yml start"
alias dkrestart="docker-compose -f ${BOB_DIR}/docker-compose.yml restart"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#eval "$(rbenv init -)"
