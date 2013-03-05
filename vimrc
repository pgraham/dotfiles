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

if has('relativenumber')
  set relativenumber
endif

let mapleader = ","
nnoremap <leader>s :w<cr>
nnoremap <leader>x :wq<cr>


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

nnoremap <leader>q gqip

set wrap
set textwidth=80
set formatoptions=tcqrn1
if has('colorcolumn')
  set colorcolumn=81
endif

set list
set listchars=tab:▸\ ,eol:¬

nnoremap j gj
nnoremap k gk
nnoremap $ g$
nnoremap 0 g0

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap ;; <ESC>
nnoremap ; :

" Automatically save files when focus is lost
au FocusLost * :wa

" Apply Javascript syntax highlighting to JSON files
autocmd BufNewFile,BufRead *.json set ft=javascript 

" Apply psql syntax highlighting to pgsql files
au BufNewFile,BufRead *.pgsql setf psql

" Remove jump to start of line for lines starting with #
autocmd BufRead *.php inoremap # X#

