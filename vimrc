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

if exists('&relativenumber')
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

set list
set listchars=tab:▸\ ,eol:¬

set wrap
set textwidth=80
set formatoptions=tcqrn1
if exists('&colorcolumn')
  set colorcolumn=81
endif

let mapleader = ","
nnoremap <leader>s :w<cr>
nnoremap <leader>x :wq<cr>
nnoremap <leader><space> :noh<cr>
" Reflow a paragraph of text based on wrapping rules
nnoremap <leader>q gqip

nnoremap / /\v
vnoremap / /\v
nnoremap <tab> %

nnoremap j gj
nnoremap k gk
nnoremap $ g$
nnoremap 0 g0

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jj <ESC>:w<cr>
nnoremap ; :

" Auto complete brackets and quotes

let s:autoCloseStack = []
let autoCloseBrace = "/\}\<CR>"
let autoCloseParen = "/\\)\<CR>"
let autoCloseBracket = "/\]\<CR>"

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

function LeaveAutoClose()
  let leaveAutoCloseCmd = PopAutoClose()
  execute "normal " . PopAutoClose()
endfunction

inoremap { {}<Esc>:call PushAutoClose("f}")<CR>i
inoremap ( ()<Esc>:call PushAutoClose("f)")<CR>i
inoremap [ []<Esc>:call PushAutoClose("f]")<CR>i
inoremap " ""<Esc>:call PushAutoClose('f"')<CR>i
inoremap ' ''<Esc>:call PushAutoClose("f'")<CR>i

inoremap {<CR> {<CR>}<Esc>:call PushAutoClose(autoCloseBrace)<CR>ko
inoremap (<CR> (<CR>)<Esc>:call PushAutoClose(autoCloseParen)<CR>ko
inoremap [<CR> [<CR>]<Esc>:call PushAutoClose(autoCloseBracket)<CR>ko

inoremap {<BS> <Nop>
inoremap (<BS> <Nop>
inoremap [<BS> <Nop>
inoremap "<BS> <Nop>
inoremap '<BS> <Nop>

" Jump past next auto-closed bracket/quote
imap <C-j> <Esc>:exec "normal " . PopAutoClose()<CR>a

" Insert blank line without entering insert mode.  Stay on current line
nnoremap <CR> o<Esc>

" Automatically save files when focus is lost
au FocusLost * :wa

" Apply Javascript syntax highlighting to JSON files
autocmd BufNewFile,BufRead *.json set ft=javascript 

" Apply psql syntax highlighting to pgsql files
au BufNewFile,BufRead *.pgsql setf psql

" Remove jump to start of line for lines starting with #
autocmd BufRead *.php inoremap # X#

