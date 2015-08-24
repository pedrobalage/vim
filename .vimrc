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
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set shiftround              " rounds indent to a multiple of shiftwidth
set autoindent              " always set autoindenting on
set nosmartindent           " dont use smart indent 

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
" Markdown
" ==========================================================


" ==========================================================
" NERDTree
" ==========================================================
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ==========================================================
" Task list
" ==========================================================
map <leader>td <Plug>TaskList

" ==========================================================
" Pyflakes
" ==========================================================
let g:pyflakes_use_quickfix = 0

" ==========================================================
" Vim-slime
" ==========================================================
let g:slime_python_ipython = 1
let g:slime_target = "screen"
let g:slime_paste_file = "$HOME/.slime_paste"




