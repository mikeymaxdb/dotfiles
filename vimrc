set nocompatible
filetype off

" Reload vimrc when edited
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

augroup tex
    autocmd!
    au BufRead,BufNewFile *.tex setlocal columns=80 wrap
augroup END

" Auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Get bash aliases into vim
let $BASH_ENV = "~/configuration/bash_aliases"

au VimResized * :wincmd =              " Resize splits when the window is resized

" Plugin manager vim-plug
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'          " Gitgutter
Plug 'ap/vim-css-color'                " Hightlight colors with color
Plug 'flazz/vim-colorschemes'          " Syntax highlighting colors
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                " Fast file searching
Plug 'junegunn/vim-plug'               " Plugin manager
Plug 'mattn/emmet-vim'                 " Quick html
Plug 'michaeljsmith/vim-indent-object' " Selecting by indent level vii vai vaI
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'scrooloose/nerdtree'             " File tree
Plug 'sheerun/vim-polyglot'            " Many language packs
Plug 'terryma/vim-multiple-cursors'    " Edit multiple locations at once <C-n>
Plug 'tpope/vim-commentary'            " Comment/uncomment lines
Plug 'tpope/vim-fugitive'              " Git wrapper
Plug 'tpope/vim-repeat'                " Enable plugins to repeat with '.'
Plug 'tpope/vim-speeddating'           " Quickly work with dates
Plug 'tpope/vim-surround'              " Quickly surround with quotes
Plug 'wellle/targets.vim'              " More text objects
Plug 'yggdroot/indentline'             " Vertical line for space indents

call plug#end()

" App Settings
syntax enable                       " Syntax highlighting
set background=dark                 " Using dark background
colorscheme gruvbox                 " Fav colorscheme
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

" Map spacebar to leader
nmap <space> <leader>
nmap <space><space> <leader><leader>
xmap <space> <leader>

" Move using display lines
nnoremap j gj
nnoremap k gk

" Add saving with sudo
command! W w !sudo tee % >/dev/null
" Yank till eol with Y
nmap Y y$
" Put without yank
vnoremap p "0p
vnoremap P "0P
" Quick Save
nnoremap <Leader><Leader> :update<CR>
" Clear search highlight on enter
nnoremap <silent> <CR> :noh<CR><CR>
" Reindent the file
nnoremap <Leader>= mzgg=G`z

" NerdTree
nnoremap <Leader>n :NERDTreeFind<CR>
nnoremap <Leader>N :NERDTreeToggle<CR>

" FZF
" Search in current buffer or all buffers
nnoremap <Leader>f :BLines<CR>
nnoremap <Leader>F :Lines<CR>
" Search for git files or all files
nnoremap <expr> <Leader>o fugitive#head() != '' ? ":GFiles<CR>" : ":Files<CR>"
nnoremap <Leader>O :Files<CR>
" Search file contents for word under cursor or in all files
nnoremap <Leader>* :Rg <C-R><C-W><CR>
nnoremap <Leader>G :Rg<Cr>
" List loaded buffers
nnoremap <Leader>b :Buffers<CR>

" GIT
" List git status
nnoremap <Leader>gs :GitFiles?<CR>
" List commit log
nnoremap <Leader>gl :Commits<CR>
" List commit log for current buffer
nnoremap <Leader>gt :BCommits<CR>
" Add files and start commit
nnoremap <Leader>gc :!gaa<CR>:Gcommit<CR>

" Splits
" Side to side split
nnoremap <leader>sh <C-w>v<C-w>l
" Top/bottom split
nnoremap <leader>sv <C-w>s<C-w>l
" Close split
nnoremap <leader>sc <C-w>c
" Swap splits
nnoremap <leader>ss <C-w>r
" Navigate splits more easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Buffers
" Previous buffer
nnoremap <c-p> :bprevious<CR>
" Next buffer
nnoremap <c-n> :bnext<CR>
" Close buffer
nnoremap <leader>q :bp<bar>bd#<CR>

" Comment lines with ctrl + / (vim-commentary)
nmap <C-_> gcc
vmap <C-_> gcgv

" Switch between files with backspace
nnoremap <bs> <c-^>

" Un-undo with shift + u
nnoremap U :redo<CR>

" Easier A
nnoremap <leader>a A

" Trigger Emmet
nmap <leader>e <C-Y>,


" Indentline
let g:indentLine_char = '│'
let g:indentLine_color_term = 237

" React
let g:jsx_ext_required = 0
let g:user_emmet_settings = {'javascript' : {'extends' : 'jsx'}}

" ALE linting
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '▲'

" Autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set shortmess+=c   " Shut off completion messages

" Polyglot
" Disable polyglot's support to use a different package
" let g:polyglot_disabled = ['jsx', 'javascript']

" Signcolumn colors
hi clear SignColumn
hi GitGutterAdd ctermfg=014
hi GitGutterChange ctermfg=012
hi GitGutterDelete ctermfg=009
hi GitGutterChangeDelete ctermfg=012

" Linenumbers color
hi LineNr ctermfg=239
" Split color
hi VertSplit ctermfg=239
" Column limit color
hi ColorColumn ctermbg=234

" Statusline
set statusline=
set statusline+=%#uMode#
set statusline+=\ %{toupper(mode())}
set statusline+=\ 
set statusline+=%#uDir#
set statusline+=\ %r
set statusline+=\ %f
set statusline+=\ %M
set statusline+=%=
set statusline+=%#uFileT#
set statusline+=%{fugitive#head()}
" set statusline+=\ %Y
set statusline+=%#uInfo#
set statusline+=\ %p%%
set statusline+=\ %l/%L:%c
set statusline+=\ 
" Statusline colors
hi uMode ctermfg=000 ctermbg=010
hi uInfo ctermfg=013 ctermbg=237
hi uBuff ctermfg=229 ctermbg=239
hi uDir ctermfg=15 ctermbg=237
hi uFileT ctermfg=14 ctermbg=237
" Change mode color when entering/exiting insert mode
au InsertEnter * hi uMode ctermfg=015 ctermbg=004
au InsertLeave * hi uMode ctermfg=000 ctermbg=010
