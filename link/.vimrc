call pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible
set modelines=0

let mapleader = ","

" Colour config
set t_Co=256
set background=dark
colorscheme twilight256

" Don't clutter directory tree with undo files
set undodir=~/.vim/undo

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

" Indentation config. This is just the default, plugin will autodetect using
" current file or other files in the same directory.
"
" Mappings>
"  -  :Tabs <width>  -->  Use tabs for indentation with a specified width
"
set shiftwidth=2
set tabstop=2
set softtabstop=2

function SetNoIndent()
  setl noai nocin nosi inde=
endfunction
com NoIndent call SetNoIndent()

" Indent case: and default: statements inside switch statements
:let g:PHP_vintage_case_default_indent = 1

" Auto complete brackets and quotes
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

" Syntastic settings
let g:syntastic_javascript_checkers = ['jsxhint']

function SetTabs(width)
  let &shiftwidth=a:width
  let &tabstop=a:width
  set noexpandtab
endfunction
com -nargs=* Tabs call SetTabs(<f-args>)

" Show whitespace characters
set list
set listchars=tab:→\ ,eol:¬

" Display misc.
set scrolloff=3
set showmode
set ttyfast

if exists('&relativenumber')
  set relativenumber
endif

" Tab navigation.
"
" Mappings>
"  -  <shift>h  -->  Previous tab
"  -  <shift>l  -->  Next tab
"
nnoremap <S-h> gT
nnoremap <S-l> gt
ca tn tabnew

" Search config. Search results are automatically highlighted. Searches use
" normal regular expressions.
"
" Mappings>
"  -  ,<space>  -->  Un-highlight search matches
"  -  ,m        -->  Start a replace match, same as :%s/
"
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <leader>m :%s/

" Text width & wrapping. Defaults to wrapping after 80 characters.
"
" Mappings>
"  -  :Nowrap  -->  Turn off wrapping.
"  -  ,q       -->  Reflow a paragraph of text.
"
set wrap
set textwidth=80
set formatoptions=tcqrn1
if exists('&colorcolumn')
  set colorcolumn=81
endif

command Nowrap set textwidth=0
nnoremap <leader>q gqip

" A couple of mappings to complement ZZ and ZQ
"
"  -  ZA  -->  Quit all
"  -  ZO  -->  Quit others
"
nnoremap ZA :wqa<cr>
nnoremap ZO :tabo<cr>

" Use <tab> to jump between matching delimiters
nnoremap <tab> %
vnoremap <tab> %

" Make movement keys respect softwrapping by default
nnoremap j gj
nnoremap k gk
nnoremap $ g$
nnoremap 0 g0

nnoremap gj j
nnoremap gk k
nnoremap g$ $
nnoremap g0 0

" Prevent accidentally pressing F1 from opening help. Open help with :help
inoremap <F1> <esc>
nnoremap <F1> <esc>
vnoremap <F1> <esc>

" Quickly exit insert mode
inoremap jj <esc>:w<cr>

" Map semicolon to colon to avoid extra <shift> press to entre cmdline mode.
" Originally semicolon functionality is pressed by mapping to colon
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" Map sideways.vim commands to key patterns
nnoremap <leader>al :SidewaysLeft<cr>
nnoremap <leader>ar :SidewaysRight<cr>

" Insert blank line without entering insert mode.  Stay on current line
nnoremap <cr> o<esc>:w<cr>

" Insert linebreak under cursor without entering insert mode
nnoremap <leader>nl i<cr><esc>l

" Map C-n to open NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Automatically open a NERDTree if Vim is open with no argument
autocmd vimenter * if !argc() | NERDTree | endif

" Automatically save files when focus is lost
au FocusLost * :wa

" Apply psql syntax highlighting to pgsql files
au BufNewFile,BufRead *.pgsql setf psql

" Apply php syntax highlighting to php.tmpl files
au BufNewFile,BufRead *.php.tmpl setf php

" Remove jump to start of line for lines starting with # for php template files
autocmd BufRead *.php.tmpl inoremap # X#

" Automatically remove trailing whitespace on buffer close
autocmd BufLeave *.php :%s/\s\+$//e

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
