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


" ==========================================================
" Python things
" ==========================================================
set textwidth=79  " lines longer than 79 columns will be broken

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
" jedi-vim and supertab
" ==========================================================
let g:SuperTabDefaultCompletionType = "context"
let g:jedi#popup_on_dot = 0

" ==========================================================
" Syntastic
" ==========================================================
let g:syntastic_python_flake8_args = "--ignore=E501 --max-complexity 10"

" ==========================================================
" Vim-slime
" ==========================================================
let g:slime_python_ipython = 1
let g:slime_target = "screen"
let g:slime_paste_file = "$HOME/.slime_paste"

" ==========================================================
" VirtualEnv
" ==========================================================
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

