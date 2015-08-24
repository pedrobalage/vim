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

" ==========================================================
" Tabs, Spaces and Identation
" ==========================================================
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set tabstop=8               " <tab> inserts 4 spaces 
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
" Window splits
" ==========================================================
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" ==========================================================
" Task list
" ==========================================================
map <leader>td <Plug>TaskList

" ==========================================================
" Pyflakes
" ==========================================================
let g:pyflakes_use_quickfix = 0

nnoremap <F3> :NERDTreeToggle<cr>
" ==========================================================
" Window splits
" ==========================================================

" Python mode setting
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_warnings = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options_colorcolumn = 0
let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_rope = 0

" vim-slime settings
let g:slime_python_ipython = 1
let g:slime_target = "screen"
let g:slime_paste_file = "$HOME/.slime_paste"

" Folding


" sudo write this
" for when we forget to use sudo to open/edit a file
cmap W! w !sudo tee % >/dev/null
cmap w!! w !sudo tee % >/dev/null

" ctrl-jklm  changes to that spli
" Window Splits
" Vertical Split : Ctrl+w + v
" Horizontal Split: Ctrl+w + s
" Close current windows: Ctrl+w + q
"
"tabs
noremap <C-H> <Esc>:tabp<CR>
noremap <C-L> <Esc>:tabn<CR>

" don't bell or blink
set noerrorbells
set vb t_vb=



