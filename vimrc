set nocompatible
filetype off

" Get bash aliases into vim
let $BASH_ENV = "~/configuration/bash_aliases"

au VimResized * :wincmd =              " Resize splits when the window is resized

" App Settings
set notermguicolors
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

function SwitchToCorresponding(split)
    let extension = expand('%:e') == 'jsx' ? '.scss' : '.jsx'
    let fileName = expand('%:r') . extension
    if filereadable(fileName)
        if a:split
            if winnr('$') > 1
                execute "wincmd w"
                execute "edit " . fileName
            else
                execute "vsplit " . fileName
            endif
        else
            execute "edit " . fileName
        endif
    else
        echohl WarningMsg | echomsg 'No corresponding file exists (' . fileName . ')' | echohl None
    endif
endfunction

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

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
" Switch to corresponding file
nnoremap <silent> <Leader>c :call SwitchToCorresponding(0)<CR>
nnoremap <silent> <Leader>C :call SwitchToCorresponding(1)<CR>
" Save all buffers
nnoremap <Leader>w :wa<CR>
" Toggle fold
nnoremap <Leader>z za
" Open all folds
nnoremap <Leader>Z zR
" Macro over selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Project tree
if has('nvim-0.5')
    " nvim-tree in lua setup
    nnoremap <Leader>n :NvimTreeFindFile<CR>
    nnoremap <Leader>N :NvimTreeToggle<CR>
else
    nnoremap <Leader>n :NERDTreeFind<CR>
    nnoremap <Leader>N :NERDTreeToggle<CR>
    let NERDTreeShowHidden=1
endif

" FZF
" Search in current buffer or all buffers
nnoremap <Leader>f :BLines<CR>
nnoremap <Leader>F :Lines<CR>
" Search for git files or all files
nnoremap <expr> <Leader>o FugitiveHead() != '' ? ":GFiles<CR>" : ":Files<CR>"
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
" Navigate splits more easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Start calculator
nnoremap <leader>u a<C-r>=

" Buffers
" Previous buffer
nnoremap <c-p> :bprevious<CR>
" Next buffer
nnoremap <c-n> :bnext<CR>
" Close buffer
nnoremap <leader>q :bp<bar>bd#<CR>

" Comment lines with ctrl + / (vim-commentary)
nmap <C-_> gcc
vmap <C-_> gc

" Switch between files with backspace
nnoremap <bs> <c-^>

" Un-undo with shift + u
nnoremap U :redo<CR>

" Easier A
nnoremap <leader>a A

" Reload buffers
nnoremap <leader>r :bufdo e<CR>

" Open terminal in split
nmap <Leader>t :split<CR>:terminal<CR>


" FZF
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
let g:fzf_action = { 'ctrl-q': function('s:build_quickfix_list') }

" Indentline
let g:indentLine_char = '│'
let g:indentLine_color_term = 237

" React
let g:jsx_ext_required = 0

" Autocomplete
set completeopt=menu,menuone,noselect
set shortmess+=c


" Completion colors
" hi CmpItemKindText ctermfg=108
hi CmpItemAbbrMatch ctermfg=208
hi CmpItemAbbrMatchFuzzy ctermfg=214
hi CmpItemKindClass ctermfg=167
hi CmpItemKindConstant ctermfg=109
hi CmpItemKindDefault ctermfg=229
hi CmpItemKindFunction ctermfg=108
hi CmpItemKindKeyword ctermfg=175
hi CmpItemKindMethod ctermfg=142
" hi DiagnosticError ctermbg=167

" Signcolumn colors
hi clear SignColumn
hi GitGutterAdd ctermfg=014
hi GitGutterChange ctermfg=012
hi GitGutterDelete ctermfg=009
hi GitGutterChangeDelete ctermfg=012

" Nerdtree colors
hi NERDTreeDir ctermfg=004

" NvimTree colors
hi NvimTreeFolderName ctermfg=004
hi NvimTreeOpenedFolderName ctermfg=004
hi NvimTreeFolderIcon ctermfg=013
hi NvimTreeGitDirty ctermfg=011

" Linenumbers color
hi LineNr ctermfg=239
" Split color
hi VertSplit ctermfg=239
" Column limit color
hi ColorColumn ctermbg=234
" Search color
hi Search ctermfg=175

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
set statusline+=%{FugitiveHead()}
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
