-- Fuzzy file finding and other

-- " FZF
-- " Search in current buffer or all buffers
-- nnoremap <Leader>f :BLines<CR>
-- nnoremap <Leader>F :Lines<CR>
-- " Search for git files or all files
-- nnoremap <expr> <Leader>o FugitiveHead() != '' ? ":GFiles<CR>" : ":Files<CR>"
-- nnoremap <Leader>O :Files<CR>
-- " Search file contents for word under cursor or in all files
-- nnoremap <Leader>* :Rg <C-R><C-W><CR>
-- nnoremap <Leader>G :Rg<Cr>

-- function! s:build_quickfix_list(lines)
--   call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
--   copen
--   cc
-- endfunction
-- let g:fzf_action = { 'ctrl-q': function('s:build_quickfix_list') }
