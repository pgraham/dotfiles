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

set scrolloff=3
set showmode
set ttyfast

if exists('&relativenumber')
  set relativenumber
endif

set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch

set list
set listchars=tab:→\ ,eol:¬

set wrap
set textwidth=80
set formatoptions=tcqrn1
if exists('&colorcolumn')
  set colorcolumn=81
endif

let mapleader = ","
nnoremap <leader>s :w<cr>
nnoremap <leader>xx :wq<cr>
nnoremap <leader>xa :wqa<cr>
nnoremap <leader>xo :only<cr>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>m :%s/
" Reflow a paragraph of text based on wrapping rules
nnoremap <leader>q gqip

nnoremap / /\v
vnoremap / /\v
nnoremap <tab> %
vnoremap <tab> %

nnoremap j gj
nnoremap k gk
nnoremap $ g$
nnoremap 0 g0

inoremap <F1> <esc>
nnoremap <F1> <esc>
vnoremap <F1> <esc>
inoremap jj <esc>:w<cr>
nnoremap ; :

" Auto complete brackets and quotes

let s:autoCloseStack = []
let autoCloseBrace = "/\}\<cr>"
let autoCloseParen = "/\\)\<cr>"
let autoCloseBracket = "/\]\<cr>"

function PushAutoClose(cmd)
  call insert(s:autoCloseStack, a:cmd)
endfunction

function PopAutoClose()
  if empty(s:autoCloseStack)
    return '$'
  else
    return remove(s:autoCloseStack, 0)
  endif
endfunction

inoremap { {}<esc>:call PushAutoClose("f}")<cr>i
inoremap ( ()<esc>:call PushAutoClose("f)")<cr>i
inoremap [ []<esc>:call PushAutoClose("f]")<cr>i
inoremap " ""<esc>:call PushAutoClose('f"')<cr>i
inoremap ' ''<esc>:call PushAutoClose("f'")<cr>i

inoremap {<cr> {<cr>}<esc>:call PushAutoClose(autoCloseBrace)<cr>ko
inoremap (<cr> (<cr>)<esc>:call PushAutoClose(autoCloseParen)<cr>ko
inoremap [<cr> [<cr>]<esc>:call PushAutoClose(autoCloseBracket)<cr>ko

" Add mappings to delete the closing brace if the opening brace is deleted
" immediately
inoremap {<BS> <Nop>
inoremap (<BS> <Nop>
inoremap [<BS> <Nop>
inoremap "<BS> <Nop>
inoremap '<BS> <Nop>

" Add mappings to _not_ to autocomplete when closing charater is typed
" immediately after opening character
inoremap {} {}
inoremap () ()
inoremap [] []
inoremap "" ""
inoremap '' ''

" Jump past next auto-closed bracket/quote
imap <C-j> <esc>:exec "normal " . PopAutoClose()<cr>:noh<cr>a

" Insert blank line without entering insert mode.  Stay on current line
noremap <cr> o<esc>
nnoremap OM i<cr><esc>l
nnoremap <leader>nl i<cr><esc>l

" Automatically save files when focus is lost
au FocusLost * :wa

" Apply Javascript syntax highlighting to JSON files
autocmd BufNewFile,BufRead *.json set ft=javascript 

" Apply psql syntax highlighting to pgsql files
au BufNewFile,BufRead *.pgsql setf psql

" Remove jump to start of line for lines starting with #
autocmd BufRead *.php inoremap # X#

