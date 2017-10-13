"------------------
"  Init
"------------------
set nocompatible
filetype off

" Reload vimrc when edited
augroup reload_vimrc
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END



"------------------
"  Plugins
"------------------

" Plugin manager vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" Plugins
Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
" Plugin 'tpope/vim-fugitive'
" Plugin 'valloric/YouCompleteMe'
" Plugin 'ntpeters/vim-better-whitespace'

call vundle#end()



"------------------
"  General
"------------------

" Colors
syntax enable
set background=dark
colorscheme gruvbox

" Enable clipboard
"set clipboard=unnamed

" Enable mouse
set mouse=a

" Retain buffers until quit
set hidden

" No bells
set visualbell

" Scrolling
set ttyfast
set scrolloff=3

" Path/file expansion in colon-mode.
set wildmode=longest:full,list:full,list:longest
set wildchar=<TAB>

" Line numbers
set ruler
set relativenumber
set number

" Backspace
set backspace=indent,eol,start

" Always show status
set laststatus=2

set showcmd

" Brace face
set showmatch
set matchtime=3

" Time out on key codes but not mappings.
set notimeout
set ttimeout
set ttimeoutlen=10

" Resize splits when the window is resized
au VimResized * :wincmd =

let mapleader = ","
let g:mapleader = ","

set foldenable " Turn on folding
set foldmethod=marker " Fold on the marker
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds



"------------------
"  Files/types
"------------------

" Read filetype stuff
filetype plugin on
filetype indent on

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Tabs
"set expandtab
set autoindent
set smarttab
set shiftwidth=4
set tabstop=4
set list
set listchars=tab:\|\ ,trail:·,extends:›,precedes:‹

" Tree style listing on Explore
" let g:netrw_liststyle=3

" Long history
set history=1000
set undofile
set undodir=~/.vim/undo     " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/



"------------------
"  Search
"------------------

" Search shows all results
set incsearch
set showmatch
set hlsearch

set ignorecase
set smartcase

"" Ignore rules
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/node_modules/*,*/bower_components/*
set wildignore+=*/build/*

" bind K to search word under cursor
nnoremap K :Ack "\b<C-R><C-W>\b"<CR>:cw<CR>



"------------------
"  Navigation
"------------------

" Move between rows not lines
noremap j gj
noremap k gk

"-- Tabs --------
noremap th :tabprev<CR>
noremap tl :tabnext<CR>
noremap tn :tabnew<CR>


"-- Splits ------
" Split down and right
set splitbelow
set splitright

" Vertical split
nnoremap <leader>w <C-w>v<C-w>l

" Horizontal split
nnoremap <leader>h <C-w>s<C-w>l


"-- Buffers -----
" Buffer commands
nmap <c-b> :bprevious<CR>
nmap <c-n> :bnext<CR>
nmap bb :bw<CR>


" Switch between files with ,,
nnoremap <leader><leader> <c-^>



"------------------
"  Plugin Configs
"------------------

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

" Statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme="dark"
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extension#syntastic#enabled = 1
let g:airline_theme='bubblegum'
let g:airline_mode_map = {'n':'N','i':'I'}
let g:airline_section_y = airline#section#create([''])
