call pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible
set modelines=0

" Colour config
set t_Co=256
set background=dark
colorscheme twilight256

" Status line config
if (has('statusline'))
  set laststatus=2

  set statusline=%<%f\                           " Filename
  set statusline+=%w%h%m%r                       " Options
  set statusline+=%{fugitive#statusline()}       " Git
  set statusline+=\ [%{&ff}/%Y]                  " Filetype
  set statusline+=\ %#warningmsg#
  set statusline+=\ %{SyntasticStatuslineFlag()} " Syntastic
  set statusline+=%*
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%        " Right aligned file nav info

  let g:syntastic_enable_signs=1
endif

" Tab config
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

" A couple of mappings to complement ZZ and ZQ
nnoremap ZA :wqa<cr>
nnoremap ZO :only

let mapleader = ","
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

inoremap <expr> <CR> delimitMate#WithinEmptyPair() ?
             \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
             \ "<CR>"

"let s:autoCloseStack = []
"let autoCloseBrace = "/\}\<cr>"
"let autoCloseParen = "/\\)\<cr>"
"let autoCloseBracket = "/\]\<cr>"

"function PushAutoClose(cmd)
"  call insert(s:autoCloseStack, a:cmd)
"endfunction

"function PopAutoClose()
"  if empty(s:autoCloseStack)
"    return '$'
"  else
"    return remove(s:autoCloseStack, 0)
"  endif
"endfunction

"inoremap { {}<esc>:call PushAutoClose("f}")<cr>i
"inoremap ( ()<esc>:call PushAutoClose("f)")<cr>i
"inoremap [ []<esc>:call PushAutoClose("f]")<cr>i
"inoremap " ""<esc>:call PushAutoClose('f"')<cr>i
"inoremap ' ''<esc>:call PushAutoClose("f'")<cr>i

"inoremap {<cr> {<cr>}<esc>:call PushAutoClose(autoCloseBrace)<cr>ko
"inoremap (<cr> (<cr>)<esc>:call PushAutoClose(autoCloseParen)<cr>ko
"inoremap [<cr> [<cr>]<esc>:call PushAutoClose(autoCloseBracket)<cr>ko

" Add mappings to delete the closing brace if the opening brace is deleted
" immediately
"inoremap {<BS> <Nop>
"inoremap (<BS> <Nop>
"inoremap [<BS> <Nop>
"inoremap "<BS> <Nop>
"inoremap '<BS> <Nop>

" Add mappings to _not_ to autocomplete when closing charater is typed
" immediately after opening character
"inoremap {} {}
"inoremap () ()
"inoremap [] []
"inoremap "" ""
"inoremap '' ''

" Jump past next auto-closed bracket/quote
"imap <C-j> <esc>:exec "normal " . PopAutoClose()<cr>:noh<cr>a

" Insert blank line without entering insert mode.  Stay on current line
nnoremap <cr> o<esc>

" Insert linebreak under cursor without entering insert mode
nnoremap <leader>nl i<cr><esc>l

" Map C-n to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" Automatically save files when focus is lost
au FocusLost * :wa

" Apply psql syntax highlighting to pgsql files
au BufNewFile,BufRead *.pgsql setf psql

" Remove jump to start of line for lines starting with #
autocmd BufRead *.php inoremap # X#

" Automatically open a NERDTree if Vim is open with no argument
autocmd vimenter * if !argc() | NERDTree | endif

" Automatically remove trailing whitespace on buffer close
autocmd BufLeave *.php :%s/\s\+$//e
