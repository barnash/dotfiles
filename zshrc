source $HOME/antigen.zsh
antigen init .antigenrc

export EDITOR=vim

# Aliases
alias tojson='python -mjson.tool'
alias nptul="lsof -nP -i4TCP | grep LISTEN"
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d ' ' -f2"

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
