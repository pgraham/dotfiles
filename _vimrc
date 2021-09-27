" Vim RC for windows

call plug#begin()

Plug 'https://github.com/rafi/awesome-vim-colorschemes'

Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'Raimondi/delimitMate'
Plug 'b4winckler/vim-angry'
Plug 'kana/vim-textobj-user' | Plug 'inside/vim-textobj-jsxattr'

Plug 'https://github.com/vim-airline/vim-airline'	
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'embear/vim-localvimrc'

Plug 'leafgarland/typescript-vim'
Plug 'zigford/vim-powershell'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set encoding=utf-8

set hidden
set modelines=0
set backspace=indent,eol,start

let mapleader = ","

" Status line config
if (has('statusline'))
  set laststatus=2
endif

" Display misc.
set scrolloff=3
set showmode
set ttyfast

if exists('&relativenumber')
  set relativenumber
endif

set cmdheight=2
set updatetime=750
set shortmess+=c
set signcolumn=number

" Don't clutter directory tree with undo files
set undofile
set undodir=~/.vim/undo

" Don't use a swapfile, interfering with watchify
set noswapfile
set nobackup
set nowritebackup

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

" COC Configuration
"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-cssmodules',
  \ 'coc-git',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-tsserver'
  \ ]
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-@> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `: CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" Auto complete brackets and quotes
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

" local-vimrc setup
let g:localvimrc_persistent = 2

" ale setup
let g:ale_sign_column_always = 1

nmap <leader>j <Plug>(ale_next_wrap)
nmap <leader>k <Plug>(ale_previous_wrap)

autocmd VimEnter *
	\  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\|   PlugInstall --sync | q
	\| endif
