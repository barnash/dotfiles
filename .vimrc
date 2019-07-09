set expandtab
set tabstop=2
set expandtab
set shiftwidth=2
set bg=dark
set hls
syntax enable

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set wildmode=longest,list,full
set wildmenu

set backspace=2 " make backspace work like most other apps

set hidden

autocmd BufNewFile,BufRead Jenkinsfile set syntax=groovy

" Enable spell check for git commits. 
autocmd FileType gitcommit setlocal spell
