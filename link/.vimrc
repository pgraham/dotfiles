" Automatic vim-plug install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-scripts/ScrollColors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tim Pope
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'

" Text objects, motions
Plug 'Raimondi/delimitMate'
Plug 'b4winckler/vim-angry'
Plug 'kana/vim-textobj-user'
Plug 'inside/vim-textobj-jsxattr'
Plug 'kana/vim-textobj-line'
Plug 'bkad/CamelCaseMotion'
Plug 'andrewradev/sideways.vim'

" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'zigford/vim-powershell'
Plug 'yuezk/vim-js'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ap/vim-css-color'
Plug 'yggdroot/indentLine'
call plug#end()

set modelines=0
set backspace=indent,eol,start

let mapleader = ","
let maplocalleader = "\\"
nnoremap <leader>W :w<cr>

" (E)dit (V)imrc & (S)ource (V)imrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Colour config
if (has('termguicolors'))
  set termguicolors
  colorscheme gruvbox
endif
" hi Comment       ctermbg=NONE ctermfg=59     guibg=NONE     guifg=#9398A4  cterm=italic    gui=italic

" Don't clutter directory tree with undo files
set undofile
set undodir=~/.vim/undo

" Don't use a swapfile, interfering with watchify
set noswapfile
set nobackup
set nowritebackup

" coc.nvim setup
set encoding=utf-8
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=number

" Indentation config. This is just the default, plugin will autodetect using
" current file or other files in the same directory.
"
" Mappings>
"  -  :Tabs <width>  -->  Use tabs for indentation with a specified width
"
set shiftwidth=2
set tabstop=2
set softtabstop=2
set cino==0

function! SetNoIndent()
  setl noai nocin nosi inde=
endfunction
com! NoIndent call SetNoIndent()

" Auto complete brackets and quotes
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

function! SetTabs(width)
  let &shiftwidth=a:width
  let &tabstop=a:width
  set noexpandtab
endfunction
com! -bar -nargs=* Tabs call SetTabs(<f-args>)

" Show whitespace characters
set list
set listchars=tab:→\ ,eol:¬,trail:∙

" Display misc.
set scrolloff=3
set showmode
set ttyfast

if exists('&relativenumber')
  set relativenumber
endif

" COC Configuration
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-cssmodules',
  \ 'coc-git',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-tsserver'
  \ ]

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Make <CR> auto-select the first completion item
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

nmap <silent> <leader>j <Plug>(coc-diagnostic-next)
nmap <silent> <leader>k <Plug>(coc-diagnostic-prev)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Tab navigation.
"
" Mappings>
"  -  <leader>h  -->  Previous tab
"  -  <leader>l  -->  Next tab
"
nnoremap <leader>h gT
nnoremap <leader>l gt
ca tn tabnew

" Search config. Search results are automatically highlighted. Searches use
" normal regular expressions.
"
" Mappings>
"  -  ,<space>  -->  Un-highlight search matches
"  -  ,f        -->  Search for word under the cursor
"  -  ,F        -->  Ack search for the word under the cursor in files of the
"                    same type
"  -  ,m        -->  Start a replace match, same as :%s/
"  -  ,s        -->  Search/replace for word under the cursor, replace text
"                    needs to be entered
"
set ignorecase
set smartcase
set gdefault
set hlsearch
nnoremap / /\v
vnoremap / /\v
nnoremap <leader>, /
nnoremap <leader>f /\v<C-r><C-w><cr>
nnoremap <leader>F :Ack --&ft <C-r><C-w>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>m :%s/
nnoremap <leader>s :%s/\<<C-r><C-w>\>//c<left><left>

" Search for Git conflicts
nnoremap <leader>cf /\v\<\<\<<cr>

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

" Rename file for current buffer in file system. NOTE: fs op, not git
function! MoveFile(newspec)
  let old = expand('%')
  if (old == a:newspec)
    return 0
  endif
  exe 'sav' fnameescape(a:newspec)
  call delete(old)
endfunction
command! -nargs=1 -complete=file -bar MoveFile call MoveFile('<args>')

command! Nowrap setlocal textwidth=0
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

" Easier keys for quickly moving up and down files
nnoremap J <c-d>
nnoremap K <c-u>
nnoremap <leader>J J
nnoremap <leader>K K

" Install camelcasemotion mappings
call camelcasemotion#CreateMotionMappings('<leader>')

" Select pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Replace current line with buffer - line-wise op
" After op, replaced line will be in buffer
nnoremap <leader>rp pkdd

" Prevent accidentally pressing F1 from opening help. Open help with :help
inoremap <F1> <esc>
nnoremap <F1> <esc>
vnoremap <F1> <esc>

" Quickly exit insert mode
inoremap jk <esc>:w<cr>

" Map semicolon to colon to avoid extra <shift> press to enter cmdline mode.
" Original semicolon functionality is preserved by mapping to colon
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" Map sideways.vim commands to key patterns
nnoremap <leader>al :SidewaysLeft<cr>
nnoremap <leader>ar :SidewaysRight<cr>

" Insert blank line without entering insert mode.  Stay on current line
nnoremap <cr> o<esc>:w<cr>

" Insert line break without entering insert mode
"
"    <leader>nl    Insert line break under cursor
"    <leader>Nl    Insert line break after cursor
nnoremap <leader>nl i<cr><esc>l
nnoremap <leader>Nl a<cr><esc>l

" Insert space without entering insert mode
"
"    <leader>sp    Insert space under cursor
"    <leader>Sp    Insert space after cursro
nnoremap <leader>sp i<space><esc>
nnoremap <leader>Sp a<space><esc>

" Map some fugitive commands
nnoremap <leader>gst :Gstatus<cr>
nnoremap <leader>gco :Gcommit<cr>

function! ExecuteNpmTest()
  !npm test
endfunction
command! NpmTest call ExecuteNpmTest()


" Abbreviations
" -----------------------------

function! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunction

iabbrev @@ philip.robert.graham@gmail.com

iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev teh the

autocmd FileType javascript :iabbrev <buffer> fnc function
autocmd FileType javascript :iabbrev <buffer> afnc function (<c-r>=Eatchar('\m\s\<bar>/')<cr>
autocmd FileType javascript :iabbrev <buffer> nfnc function ()
autocmd FileType javascript :iabbrev <buffer> Prm new Promise((resolve, reject) => {<cr>});<c-r>=Eatchar('\m\s\<bar>/')<cr>

" White space fix commands
com! -bar Trim %s/\s\+$//e
com! -bar Retab %retab!
com! -bar FixWhiteSp Trim <bar> Tabs 4 <bar> Retab <bar> Tabs 2

" Autocommands
" ---------------------------------
if has("autocmd")

  " Automatically save files when focus is lost
  au FocusLost * :wa

  " Apply psql syntax highlighting to pgsql files
  au BufNewFile,BufRead *.pgsql setf psql

  " Apply markdown highlighting for *.md files
  au BufNewFile,BufReadPost *.md set filetype=markdown

  " Apply JSON syntax to .babelrc files
  au BufNewFile,BufRead .babelrc setf json

  " Apply Shell syntax to ~/.bash_local
  au BufNewFile,BufRead .bash_local setf sh

  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
