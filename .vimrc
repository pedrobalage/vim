" ==========================================================
" Pathogen
" ==========================================================
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on

" ==========================================================
" Basic Settings
" ==========================================================
set ruler                   " show the cursor position all the time
set number                  " Display line numbers
set numberwidth=1           " using only 1 column (and 1 space) while possible
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set cursorline              " have a line indicate the cursor location
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set noerrorbells
set vb t_vb=

" ==========================================================
" Tabs, Spaces and Identation
" ==========================================================
set shiftwidth=4          " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4             " a hard TAB displays as 4 columns
set expandtab             " insert spaces when hitting TABs
set softtabstop=4         " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround            " round indent to multiple of 'shiftwidth'
set autoindent            " align the new line indent with the previous line

" ==========================================================
" Searching and Patterns
" ==========================================================
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex
set showmatch               " Briefly jump to a paren once it's balanced

" ==========================================================
" Folding
" ==========================================================
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

" save fold states
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

" ==========================================================
" Python things
" ==========================================================
" remove trailing whitespaces
autocmd BufWritePre *.py :%s/\s\+$//e

" ==========================================================
" Vim things
" ==========================================================
" set the same clipboard across vim instances
set clipboard=unnamed
" remap the leader key
let mapleader=","

" ==========================================================
" Sudo write
" ==========================================================
cmap W! w !sudo tee % >/dev/null
cmap w!! w !sudo tee % >/dev/null


" ==========================================================
" Windows and tabs
" ==========================================================
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

noremap <C-H> <Esc>:tabp<CR>
noremap <C-L> <Esc>:tabn<CR>

" ==========================================================
" NERDTree
" ==========================================================
map <C-n> :NERDTreeTabsToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ==========================================================
" jedi-vim
" ==========================================================
let g:jedi#use_splits_not_buffers = "bottom"

" ==========================================================
" Syntastic
" ==========================================================
let g:syntastic_python_flake8_args = "--ignore=E501,C901 --max-complexity 10"
" fix ambigous use between Errors and Explorer. Set E to solve for Explorer 
cmap E<CR> Ex<CR>

" ==========================================================
" Vim-slime
" ==========================================================
let g:slime_python_ipython = 1
let g:slime_target = "screen"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"sessionname": "ipython", "windowname": "0"}
let g:slime_dont_ask_default = 1

" ==========================================================
" VirtualEnv
" ==========================================================

" Vim for ubuntu 16.04 is compiled with python3
python3 << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" ==========================================================
" DiffSaved
" ==========================================================

" tells vim not to automatically reload changed files
    set noautoread 

function! DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

" sets up mappings to function
com! DiffSaved call DiffWithSaved()
noremap <F8> :DiffSaved<CR>

noremap <F7> :!autopep8 --in-place %<CR>




