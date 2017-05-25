set nocompatible
"set shell=/usr/local/bin/bash

filetype off

augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" Vundle manages itself
Plugin 'gmarik/vundle'

Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree.git'
" Plugin 'bronson/vim-trailing-whitespace'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'flazz/vim-colorschemes'
" Plugin 'valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

call vundle#end()

" Retain buffers until quit
set hidden

" No bells!
set visualbell

" Fast scrolling
set ttyfast

" Path/file expansion in colon-mode.
" set wildmode=longest:full,list:full,list:longest
" set wildchar=<TAB>

" Line numbers are nice
set ruler
set relativenumber
set number

" Backspace for normal people
set backspace=indent,eol,start

" Always show status
set laststatus=2

" Brace face
"set showmatch
"set matchtime=3

" Split down and right
"set splitbelow
"set splitright

" Read filetype stuff
filetype plugin on
filetype indent on

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Resize splits when the window is resized
au VimResized * :wincmd =

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
" set expandtab

" Be smart when using tabs ;)
set autoindent
set smarttab

" 1 tab == 2 spaces
set shiftwidth=4
set tabstop=4

" Search shows all results
set incsearch
set showmatch
set hlsearch

" Tree style listing on Explore
let g:netrw_liststyle=3

" We have computers with pretty big
" hard drives, so let's keep these
set history=1000
set undofile
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

" Colors
syntax enable
set background=dark
colorscheme gruvbox

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Key commands {{{

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

noremap th :tabprev<CR>
noremap tl :tabnext<CR>
noremap tn :tabnew<CR>

let mapleader = ","
let g:mapleader = ","

" Vertical split
nnoremap <leader>w <C-w>v<C-w>l
" Horizontal split
nnoremap <leader>h <C-w>s<C-w>l

" Buffer commands
nmap <c-b> :bprevious<CR>
nmap <c-n> :bnext<CR>
nmap bb :bw<CR>

" Switch between files with ,,
nnoremap <leader><leader> <c-^>

"" Ignore rules

set wildignore+=*/tmp/*,*.so,*.swp,*.zip              " MacOSX/Linux
set wildignore+=*/node_modules/*,*/bower_components/* " Node.js
set wildignore+=*/vendor/*,*/dist/*,/target/*         " Meh

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" Airline
let g:airline#extensions#tabline#enabled = 1
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
