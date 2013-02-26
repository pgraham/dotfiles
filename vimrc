autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufRead *.php inoremap # X#

call pathogen#infect()
syntax on
filetype plugin indent on

set shiftwidth=2
set tabstop=2
set expandtab

set t_Co=256
set background=dark
colorscheme twilight256
