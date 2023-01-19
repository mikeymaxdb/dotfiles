-- Fuzzy file finding and other

-- Telescope
local actions = require('telescope.actions')
local trouble = require('trouble.providers.telescope')
require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-q>'] = trouble.open_selected_with_trouble,
            }
        }
    }
})

-- Use find files if not in a git repo
local projectFiles = function()
  local opts = {} -- define here if you want to define something
  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    require"telescope.builtin".git_files(opts)
  else
    require"telescope.builtin".find_files(opts)
  end
end

-- Keymap
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>o', projectFiles, {})
vim.keymap.set('n', '<leader>*', builtin.grep_string, {})
vim.keymap.set('n', '<leader>G', builtin.live_grep, {})
vim.keymap.set('n', '<leader>t', builtin.treesitter, {})
vim.keymap.set('n', '<leader>l', builtin.lsp_definitions, {})

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
