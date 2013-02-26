autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufRead *.php inoremap # X#

call pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible

set modelines=0

set t_Co=256
set background=dark
colorscheme twilight256

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

set scrolloff=3
set showmode
set ttyfast
set relativenumber

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
nnoremap <tab> %

set wrap
set textwidth=80
set formatoptions=tcqrn1
set colorcolumn=81

set list
set listchars=tab:▸\ ,eol:¬

nnoremap j gj
nnoremap k gk
nnoremap $ g$

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap ; :

au FocusLost * :wa          " Automatically save files when focus is lost

nnoremap <leader>q gqip
