set nocompatible
filetype off

" Get bash aliases into vim
let $BASH_ENV = "~/configuration/bash_aliases"

au VimResized * :wincmd =              " Resize splits when the window is resized

" App Settings
set termguicolors
filetype plugin on                  " Read filetype stuff
filetype indent on                  " Match file indents
set encoding=utf8                   " Set utf8 as standard encoding
set ffs=unix,dos,mac                " Use Unix as the standard file type
set history=1000                    " Long history
set undofile                        " Enable persistent undo
set undolevels=1000                 " How many undos
set undoreload=10000                " Number of lines to save for undo
set undodir=~/.vim/undo//           " Where to save undo histories
set backupdir=~/.vim/backup//       " Backup directory
set directory=~/.vim/swap//         " Swap directory
set autoread                        " Update file when changed outside of vim
set hidden                          " Retain buffers until quit
set visualbell                      " No bells
set ttyfast                         " Faster scrolling
set splitbelow                      " Window splitting behavior
set splitright                      " Window splitting behavior
set shortmess+=aAIsT                " Less initial messaging
set clipboard=unnamed               " Enable clipboard
set foldmethod=syntax               " Enable folding by indent
set nofoldenable                    " Folds open by default
set lazyredraw                      " Don't render everything

" UI Settings
set number                          " Line numbers
set noshowmode                      " Only have the mode in the statusline
set showcmd                         " Show commands
set showmatch                       " Highlight matching brace
set incsearch                       " Highlight search as you type
set hlsearch                        " Highlight search results
set laststatus=2                    " Always show status
set list                            " Show invisible characters
set listchars=tab:\|\ ,trail:·,extends:›,precedes:‹ " Show vertical line for tabs
set fillchars+=vert:│               " Make the split line solid
set signcolumn=yes                  " Always leave space for git/lint column

" Behavior Settings
set mouse=a                         " Enable mouse
set scrolloff=3                     " Keep cursor away from the top/bottom
set nowrap                          " No line wrapping
set backspace=indent,eol,start      " Backspace
set matchtime=3                     " Brace highlight time
set notimeout                       " Time out on key codes but not mappings.
set ttimeout                        " Terminal keycode timeount
set ttimeoutlen=10                  " Terminal timeout length
set updatetime=300
set expandtab                       " Use spaces
set autoindent                      " Auto indent
set nojoinspaces                    " One space after punctuation
set softtabstop=4                   " Tab size
set shiftwidth=4                    " Tab size
set tabstop=4                       " Tab size
set smarttab                        " Smart tab size
set ignorecase                      " Ignore case when searching
set smartcase                       " Smart case-sensitivity
set wildmenu                        " Path/file expansion in colon-mode
set wildmode=longest:full,list:full,list:longest
set wildchar=<TAB>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/node_modules/*,*/bower_components/*
set wildignore+=*/build/*

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Add saving with sudo
command! W w !sudo tee % >/dev/null
" Macro over selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" GIT
" List git status
nnoremap <Leader>gs :GitFiles?<CR>
" List commit log
nnoremap <Leader>gl :Commits<CR>
" List commit log for current buffer
nnoremap <Leader>gt :BCommits<CR>
" Git blame
nnoremap <Leader>gb :Git blame<CR>
" Git diff
nnoremap <Leader>gd :Git difftool<CR>
" Git mergetool
nnoremap <Leader>gm :Git mergetool<CR>
" Add files and start commit
nnoremap <Leader>gc :!gaa<CR>:Gcommit<CR>
" Add all files
nnoremap <Leader>ga :!gaa<CR>

" Splits
" Side to side split
nnoremap <leader>sh <C-w>v<C-w>l
" Top/bottom split
nnoremap <leader>sv <C-w>s<C-w>l
" Close split
nnoremap <leader>sc <C-w>c
" Swap splits
nnoremap <leader>ss <C-w>r

" Comment lines with ctrl + / (vim-commentary)
nmap <C-_> gcc
vmap <C-_> gc

" Un-undo with shift + u
nnoremap U :redo<CR>

" Reload buffers
nnoremap <leader>r :bufdo e<CR>

" React
let g:jsx_ext_required = 0

" Autocomplete
set completeopt=menu,menuone,noselect
set shortmess+=c
