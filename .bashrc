# Prompt
BLACK="\[\e[0;30m\]"
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
BLUE="\[\e[0;34m\]"
MAGENTA="\[\e[0;35m\]"
CYAN="\[\e[0;36m\]"
LIGHT="\[\e[0;37m\]"
NC="\[\e[0m\]"


PS1="<${BLUE}\u${NC}@${GREEN}\h${NC}:\W${NC}> \$ "

export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR=vim

# Open file limit for grunt
ulimit -n 2560

# Aliases
alias ls='ls -G'
alias ll='ls -l'
alias lt='ls -ltr'
alias sl='source ~/.bashrc'
alias vibrc='vim ~/.bashrc'
alias wget='curl -O'
alias grep='grep --color'
alias stylecode="highlight -O rtf $1 -K 24 --style darkness"
alias null="cat > /dev/null"
alias rmds="find . -name .DS_Store | xargs rm"

# Virtualenv
#function va_active() { source "$HOME/.virtualenvs/$1/bin/active"; }
#alias activate='va_activate'
#complete -W "`ls $HOME/.virtualenvs`" activate
#source /usr/local/bin/virtualenv-3.4
export PIP_REQUIRE_VIRTUALENV=true
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# json format
alias tojson='python -mjson.tool'

# Network utils
alias nptul="lsof -nP -i4TCP | grep LISTEN"
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d ' ' -f2"

# Completion
source ~/.git-completion.bash
source ~/.dotfiles/tmux_completion
source ~/.bash_completion

# nginx
alias nginx='sudo nginx'
alias nginxboot='nginx -s stop; nginx'
alias vinginx='vim /usr/local/etc/nginx/nginx.conf'

# Fix shell stuff LC stuff
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
HISTCONTROL=ignoreboth

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

checkgitdir "$HOME/.dotfiles"
checkgitdir "/usr/local/etc/nginx"
checkgitdir "/etc"

if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi

export PATH="$PATH:/usr/local/sbin:/Users/iftachbar/work/rounds/tmux-cssh/"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/iftachbar/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/iftachbar/google-cloud-sdk/completion.bash.inc'

# big panda
source ~/.nvm/nvm.sh
source ~/.bigpandalogin

#source ~/.profile

# added by travis gem
[ -f /Users/iftachbar/.travis/travis.sh ] && source /Users/iftachbar/.travis/travis.sh
