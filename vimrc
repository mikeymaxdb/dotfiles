set nocompatible
filetype off

" Reload vimrc when edited
augroup reload_vimrc
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" Auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" FZF location
set rtp+=/usr/local/opt/fzf

au VimResized * :wincmd =           " Resize splits when the window is resized

" Plugin manager vim-plug
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'            " Plugin manager
Plug 'itchyny/lightline.vim'        " Statusline
Plug 'flazz/vim-colorschemes'       " Syntax highlighting colors
Plug 'airblade/vim-gitgutter'       " Gitgutter
Plug 'yggdroot/indentline'          " Vertical line for space indents
Plug 'tpope/vim-fugitive'           " Fancy git features
Plug 'junegunn/fzf.vim'             " Fast file searching
Plug 'mattn/emmet-vim'              " Quick html
Plug 'w0rp/ale'                     " Linting
Plug 'sheerun/vim-polyglot'         " Many language packs
Plug 'mgee/lightline-bufferline'    " Show buffers in the tabline
Plug 'terryma/vim-multiple-cursors' " Editing mutliple locations at once
Plug 'tpope/vim-surround'           " Quickly surround with quotes

call plug#end()

"------------------
"  General
"------------------
let mapleader = ","                 " Remap leader to ','
let g:mapleader = ","               " Remap leader to ','

syntax enable                       " Color code
set background=dark                 " Using dark background
colorscheme gruvbox                 " Fav colorscheme
filetype plugin on                  " Read filetype stuff
filetype indent on                  " Match file indents
set encoding=utf8                   " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac                " Use Unix as the standard file type
set history=1000                    " Long history
set undofile                        " Enable persistent undo
set undodir=~/.vim/undo//           " Where to save undo histories
set undolevels=1000                 " How many undos
set undoreload=10000                " Number of lines to save for undo
set backupdir=~/.vim/backup//       " Backup directory
set directory=~/.vim/swap//         " Swap directory
set autoread                        " update file when changed outside of vim

set splitbelow                      " Window splitting behavior
set splitright                      " Window splitting behavior
set shortmess+=aAIsT                " Less initial messaging
set clipboard=unnamed               " Enable clipboard
set mouse=a                         " Enable mouse
set hidden                          " Retain buffers until quit
set visualbell                      " No bells
set ttyfast                         " Faster scrolling
set scrolloff=3                     " Keep cursor away from the top/bottom
set ruler                           " Line numbers
set relativenumber                  " Relative line numbers
set number                          " Show current line number
set nowrap                          " No line wrapping
set backspace=indent,eol,start      " Backspace
set laststatus=2                    " Always show status
set showtabline=2                   " Always show the tab/buffer line
set noshowmode                      " Only have the mode in the statusline
set showcmd                         " Show commands
set showmatch                       " Highlight matching brace
set matchtime=3                     " Brace highlight time
set notimeout                       " Time out on key codes but not mappings.
set ttimeout                        " Terminal keycode timeount
set ttimeoutlen=10                  " Terminal timeout length
set expandtab                       " Use spaces
set nojoinspaces                    " One space after punctuation
set autoindent                      " Auto indent
set softtabstop=4                   " Tab size
set shiftwidth=4                    " Tab size
set tabstop=4                       " Tab size
set list                            " Show invisible characters
set listchars=tab:\|\ ,trail:·,extends:›,precedes:‹ " Show vertical line for tabs
set incsearch                       " Highlight search as you type
set hlsearch                        " Highlight search results
set ignorecase                      " Ignore case when searching
set smartcase                       " Smart case-sensitivity
set wildmenu                        " Path/file expansion in colon-mode
set wildmode=longest:full,list:full,list:longest
set wildchar=<TAB>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/node_modules/*,*/bower_components/*
set wildignore+=*/build/*

" Add saving with sudo
command! W w !sudo tee % >/dev/null
" Quick Save
noremap <Leader>/ :update<CR>
" Clear search highlight on enter
nnoremap <CR> :noh<CR><CR>
" Start FZF with ctrl+P
nnoremap <C-p> :Files<Cr>
" Search file contents
nnoremap <C-g> :Rg<Cr>
" bind K to search word under cursor
nnoremap K :Rg <C-R><C-W><CR>

" Vertical split
nnoremap <leader>w <C-w>v<C-w>l
" Horizontal split
nnoremap <leader>h <C-w>s<C-w>l

" Previous buffer
nmap <c-b> :bprevious<CR>
" Next buffer
nmap <c-n> :bnext<CR>
" Close buffer
nmap bb :bw<CR>
" List buffers for selection
map <leader>b :ls<CR>:b
" Switch between files with backspace
nnoremap <bs> <c-^>

" React
let g:jsx_ext_required = 0

" Emmet
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" Lightline
let g:lightline = {
\   'colorscheme': 'wombat',
\   'active': {
\     'left':[ [ 'mode', 'paste' ],
\              [ 'gitbranch' ],
\              [ 'readonly', 'filename', 'modified' ]
\     ],
\     'right': [ [ 'lineinfo' ], 
\              [ 'percent' ],
\              [  'filetype']
\      ]
\   },
\   'component': {
\     'lineinfo': '%3l:%-2v',
\   },
\   'component_function': {
\     'gitbranch': 'fugitive#head',
\   }
\}
let g:lightline.mode_map = {
\ 'n' : 'N',
\ 'i' : 'I',
\ 'R' : 'REPLACE',
\ 'v' : 'V',
\ 'V' : 'V-LINE',
\ "\<C-v>": 'V-BLOCK',
\ 'c' : 'N',
\ 's' : 'SELECT',
\ 'S' : 'S-LINE',
\ "\<C-s>": 'S-BLOCK',
\ 't': 'TERMINAL',
\ }
" Bufferline
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline.tabline          = {'left': [['buffers']], 'right': [[]]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
