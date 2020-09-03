call pathogen#infect()
set modelines=0
set backspace=indent,eol,start

let mapleader = ","
let maplocalleader = "\\"
nnoremap <leader>W :w<cr>

" (E)dit (V)imrc & (S)ource (V)imrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Colour config
set t_Co=256
set background=dark
if (has('termguicolors'))
  set termguicolors
  let ayucolor="dark"
  colorscheme ayu
else
  let g:spacegray_underline_search = 1
  let g:spacegray_use_italics = 1
  colorscheme spacegray
endif
hi Comment       ctermbg=NONE ctermfg=59     guibg=NONE     guifg=#9398A4  cterm=italic    gui=italic

" Don't clutter directory tree with undo files
set undofile
set undodir=~/.vim/undo

" Don't use a swapfile, interfering with watchify
set noswapfile

" Status line config
if (has('statusline'))
  set laststatus=2

  set statusline=%<%f\                           " Filename
  set statusline+=%w%h%m%r                       " Options
  set statusline+=%{fugitive#statusline()}       " Git
  set statusline+=\ [%{&ff}/%Y]                  " Filetype
  set statusline+=\ %#warningmsg#
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
set cino==0

function! SetNoIndent()
  setl noai nocin nosi inde=
endfunction
com! NoIndent call SetNoIndent()

" Indent case: and default: statements inside switch statements
:let g:PHP_vintage_case_default_indent = 1

" Auto complete brackets and quotes
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

let g:NERDSpaceDelims = 1

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

" Map C-n to open NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

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
autocmd FileType javascript :iabbrev <buffer> rjscls <esc>;TemplateHere react-class.jsx<cr>bcr-o

" White space fix commands
com! -bar Trim %s/\s\+$//e
com! -bar Retab %retab!
com! -bar FixWhiteSp Trim <bar> Tabs 4 <bar> Retab <bar> Tabs 2

" General syntax fixes
com! -bar SpAftComma %s/,\(\S\)/, \1/ce

" Css code style fix commands
com! -bar SpAftColon %s/:\(\S.\+;\)/: \1/ce
com! -bar SpB4DecBlk %s/\(\w\){/\1 {/ce

com! Cssfix FixWhiteSp <bar> SpAftComma <bar> SpAftColon <bar> SpB4DecBlk

" Javascript code style fix commands
com! -bar SpAftCtrl %s/\(function\|if\|for\|switch\)(/\1 (/ce
com! -bar SpB4Blk %s/){/) {/ce
com! -bar SpB4Else %s/}else/} else/ce
com! -bar SpAftElse %s/else{/else {/ce
com! -bar SpAroundElse SpB4Else <bar> SpAftElse
com! -bar SpAftPropName %s/:\(\S\)/: \1/ce
com! -bar SpB4Obj %s/{\(\S\)/{ \1/ce
com! -bar SpAftObj %s/\(\S\)}/\1 }/ce
com! -bar SpAroundObj SpB4Obj <bar> SpAftObj
com! -bar SpB4Ar %s/\[\(\S\)/[ \1/ce
com! -bar SpAftAr %s/\(\S\)]/\1 ]/ce
com! -bar SpAroundAr SpB4Ar <bar> SpAftAr

com! Jsfix FixWhiteSp <bar> SpAftCtrl <bar> SpB4Blk <bar> SpAroundElse <bar> SpAftComma <bar> SpAftPropName <bar> SpAroundObj <bar> SpAroundAr <bar> noh

" local-vimrc setup
let g:localvimrc_persistent = 2

" vim-templates setup
let g:templates_directory = "~/.dotfiles/vim-templates"
let g:templates_no_builtin_templates = 1

" ale setup
let g:ale_sign_column_always = 1

nmap <leader>j <Plug>(ale_next_wrap)
nmap <leader>k <Plug>(ale_previous_wrap)

" Autocommands
" ---------------------------------
if has("autocmd")

  " Automatically open a NERDTree if Vim is open with no argument
  au vimenter * if !argc() | NERDTree | endif

  " Automatically save files when focus is lost
  au FocusLost * :wa

  " Apply psql syntax highlighting to pgsql files
  au BufNewFile,BufRead *.pgsql setf psql

  " Apply markdown highlighting for *.md files
  au BufNewFile,BufReadPost *.md set filetype=markdown

  " Apply php syntax highlighting to php.tmpl files
  au BufNewFile,BufRead *.php.tmpl setf php

  " Apply JSON syntax to .babelrc files
  au BufNewFile,BufRead .babelrc setf json

  " Apply Shell syntax to ~/.bash_local
  au BufNewFile,BufRead .bash_local setf sh

  " Remove jump to start of line for lines starting with # for php template files
  au BufRead *.php.tmpl inoremap # X#

  " Automatically remove trailing whitespace on buffer close
  au BufLeave *.php :%s/\s\+$//e

  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
