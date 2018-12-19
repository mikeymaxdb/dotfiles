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

" Passive
Plug 'junegunn/vim-plug'               " Plugin manager
Plug 'flazz/vim-colorschemes'          " Syntax highlighting colors
Plug 'airblade/vim-gitgutter'          " Gitgutter
Plug 'yggdroot/indentline'             " Vertical line for space indents
Plug 'sheerun/vim-polyglot'            " Many language packs

" Interactive
Plug 'junegunn/fzf.vim'                " Fast file searching
Plug 'mattn/emmet-vim'                 " Quick html
Plug 'w0rp/ale'                        " Linting
Plug 'terryma/vim-multiple-cursors'    " Edit mutliple locations at once
Plug 'tpope/vim-surround'              " Quickly surround with quotes
Plug 'tpope/vim-commentary'            " Comment/uncomment lines
Plug 'prettier/vim-prettier'           " Auto format files
Plug 'michaeljsmith/vim-indent-object' " Selecting by indent level vii vai vaI

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
set undodir=~/.vim/undo//           " Where to save undo histories
set undolevels=1000                 " How many undos
set undoreload=10000                " Number of lines to save for undo
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
set list                            " Show invisible characters
set listchars=tab:\|\ ,trail:·,extends:›,precedes:‹ " Show vertical line for tabs

" Behavior Settings
set mouse=a                         " Enable mouse
set scrolloff=3                     " Keep cursor away from the top/bottom
set nowrap                          " No line wrapping
set backspace=indent,eol,start      " Backspace
set laststatus=2                    " Always show status
set matchtime=3                     " Brace highlight time
set notimeout                       " Time out on key codes but not mappings.
set ttimeout                        " Terminal keycode timeount
set ttimeoutlen=10                  " Terminal timeout length
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

" Add saving with sudo
command! W w !sudo tee % >/dev/null
" Clear search highlight on enter
nnoremap <CR> :noh<CR><CR>
" Start FZF with ctrl+P
nnoremap <C-p> :Files<Cr>
" Search file contents
nnoremap <C-g> :Rg<Cr>

" Quick Save
nnoremap <Leader>w :update<CR>
" Search file contents for word under cursor
nnoremap <Leader>g :Rg <C-R><C-W><CR>

" Side to side split
nnoremap <leader>h <C-w>v<C-w>l
" Top/bottom split
nnoremap <leader>v <C-w>s<C-w>l
" Close split
nnoremap <leader>c <C-w>c
" Navigate splits more easily
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

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

" Indentline
let g:indentLine_char = '│'
let g:indentLine_color_term = 237

" React
let g:jsx_ext_required = 0
let g:user_emmet_settings = {'javascript' : {'extends' : 'jsx'}}

" Prettier
let g:prettier#config#tab_width = 4
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#semi = 'false'

" ALE linting
let g:ale_fixers = {'javascript' : ['eslint']}
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '▲'
hi ALEWarning ctermfg=011
hi ALEError ctermfg=009

" Signcolumn colors
hi clear SignColumn
hi GitGutterAdd ctermfg=014
hi GitGutterChange ctermfg=012
hi GitGutterDelete ctermfg=009
hi GitGutterChangeDelete ctermfg=012
hi ALEErrorSign ctermfg=009
hi ALEWarningSign ctermfg=011

" Column limit color
hi ColorColumn ctermbg=234

" Statusline
set statusline=
set statusline+=%#uMode#
set statusline+=\ %{toupper(mode())}
set statusline+=\ 
set statusline+=%#uBuff#
set statusline+=\ %n
set statusline+=\ 
set statusline+=%#uDir#
set statusline+=\ %r
set statusline+=\ %F
set statusline+=\ %M
set statusline+=%=
set statusline+=%#uFileT#
set statusline+=\ %Y
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
