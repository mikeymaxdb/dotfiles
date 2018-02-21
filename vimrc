set nocompatible
filetype off

" Reload vimrc when edited
augroup reload_vimrc
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" Plugin manager vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" Plugins
Plugin 'gmarik/vundle'              " Plugin manager
Plugin 'bling/vim-airline'          " Statusline
Plugin 'scrooloose/nerdtree.git'    " Folder tree
Plugin 'flazz/vim-colorschemes'     " Syntax highlighting colors
Plugin 'scrooloose/syntastic'       " Check syntax
Plugin 'leafgarland/typescript-vim' " Support typescript
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'     " Gitgutter
Plugin 'ctrlpvim/ctrlp.vim'         " Filename search
Plugin 'mileszs/ack.vim'            " File contents search
Plugin 'yggdroot/indentline'        " Vertical line for space indents
Plugin 'pangloss/vim-javascript'    " JS syntax highlighting
Plugin 'mxw/vim-jsx'                " Syntax highlighting for React
Plugin 'tpope/vim-fugitive'         " Fancy git features
Plugin 'valloric/YouCompleteMe'     " Code completion
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mattn/emmet-vim'            " Quick html
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'

call vundle#end()

"------------------
"  General
"------------------
syntax enable                       " Color code
set background=dark                 " Using dark background
colorscheme gruvbox                 " Fav colorscheme

set shortmess+=aAIsT                " Less initial messaging
set clipboard=unnamed               " Enable clipboard
set mouse=a                         " Enable mouse
set hidden                          " Retain buffers until quit
set visualbell                      " No bells

set ttyfast                         " Faster scrolling
set scrolloff=3                     " Keep cursor away from the top/bottom
set wildmenu                        " Path/file expansion in colon-mode
set wildmode=longest:full,list:full,list:longest
set wildchar=<TAB>

set ruler                           " Line numbers
set relativenumber                  " Relative line numbers
set number                          " Show current line number
set nowrap                          " No line wrapping
set backspace=indent,eol,start      " Backspace
set laststatus=2                    " Always show status
set showcmd                         " Show commands
set showmatch                       " Highlight matching brace
set matchtime=3                     " Brace highlight time

set notimeout                       " Time out on key codes but not mappings.
set ttimeout
set ttimeoutlen=10

au VimResized * :wincmd =           " Resize splits when the window is resized

let mapleader = ","                 " Remap leader to ','
let g:mapleader = ","               " Remap leader to ','

"  Files/types

filetype plugin on                  " Read filetype stuff
filetype indent on                  " Match file indents
" Add saving with sudo
command! W w !sudo tee % >/dev/null
" Quick Save
noremap <Leader>/ :update<CR>
set encoding=utf8                   " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac                " Use Unix as the standard file type

set expandtab                       " Use spaces
set nojoinspaces                    " One space after punctuation
set autoindent                      " Auto indent
set softtabstop=4                   " Tab size
set shiftwidth=4                    " Tab size
set tabstop=4                       " TAB size
set list                            " Show invisible characters
set listchars=tab:\|\ ,trail:·,extends:›,precedes:‹ " Show vertical line for tabs

set history=1000                    " Long history
set undofile
set undodir=~/.vim/undo             " where to save undo histories
set undolevels=1000                 " How many undos
set undoreload=10000                " Number of lines to save for undo
set backupdir=~/.vim/backup/        " Backup dir
set directory=~/.vim/backup/
set autoread                        " update file when changed outside of vim

"  Search

" Search shows all results
set incsearch
set showmatch
set hlsearch
set ignorecase
set smartcase

" Clear search highlight
nnoremap <CR> :noh<CR><CR>

" Ignore rules
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/node_modules/*,*/bower_components/*
set wildignore+=*/build/*

" bind K to search word under cursor
nnoremap K :Ack "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>f :Ack --smart-case 

"  Navigation

noremap th :tabprev<CR>
noremap tl :tabnext<CR>
noremap tn :tabnew<CR>
noremap tc :tabclose<CR>

set splitbelow
set splitright
" Vertical split
nnoremap <leader>w <C-w>v<C-w>l
" Horizontal split
nnoremap <leader>h <C-w>s<C-w>l

" Buffer previous
nmap <c-b> :bprevious<CR>
nmap <c-n> :bnext<CR>
nmap bb :bw<CR>
map <leader>b :ls<CR>:b
" Switch between files with ,,
nnoremap <leader><leader> <c-^>

"  Plugin Configs

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

" Statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Ctrl+p
let g:ctrlp_working_path_mode = 0

" Airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 0
let g:airline_theme="dark"
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extension#syntastic#enabled = 1
let g:airline_theme='bubblegum'
let g:airline_mode_map = {'n':'N','i':'I','v':'V'}
let g:airline_section_y = airline#section#create([''])
let g:airline#extensions#whitespace#enabled = 0

" React
let g:jsx_ext_required = 0

" Emmet
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
