--[[ Cheatsheet

C-n Multi-line edit
C-q Open selected search results in Trouble
C-s Start completion (insert mode)

--]]

-- Keymap
local tele = require('telescope.builtin')
local teleProjectFiles = require('fuzzy').projectFiles
function fuzzyFindContents()
    tele.grep_string({
        path_display = { 'smart' },
        only_sort_text = true,
        word_match = "-w",
        search = '',
    })
end

vim.keymap.set('n', '<space>', '<leader>', { remap = true }) -- Space leader
vim.keymap.set('x', '<space>', '<leader>', { remap = true })
vim.keymap.set('n', '<space><space>', '<leader><leader>', { remap = true })
vim.keymap.set('n', '<cr>', ':noh<cr><cr>')               -- Clear search highlight on enter
vim.keymap.set('n', '<BS>', '<C-^>')                      -- Swap to last buffer

vim.keymap.set('n', 'j', 'gj')                            -- Move using display lines
vim.keymap.set('n', 'k', 'gk')                            -- Move using display lines
vim.keymap.set('n', 'Y', 'y$')                            -- Yank till EOL
vim.keymap.set('n', 'U', ':redo<cr>')                     -- Redo undo

vim.keymap.set('v', 'p', '"0p')                           -- Put without yank
vim.keymap.set('v', 'P', '"0P')                           -- Put without yank

vim.keymap.set('n', '<c-h>', '<c-w>h')                    -- Navigate splits left
vim.keymap.set('n', '<c-j>', '<c-w>j')                    -- Navigate splits down
vim.keymap.set('n', '<c-k>', '<c-w>k')                    -- Navigate splits up
vim.keymap.set('n', '<c-l>', '<c-w>l')                    -- Navigate splits right
vim.keymap.set('n', '<c-_>', 'gcc', { remap = true })     -- Comment line (C-/)
vim.keymap.set('v', '<c-_>', 'gc', { remap = true })      -- Comment selection (C-/)

vim.keymap.set('n', '<leader><leader>', ':update<cr>')    -- Quick save
vim.keymap.set('n', '<leader>*', tele.grep_string)        -- Search current word
vim.keymap.set('n', '<leader>=', 'mzgg=G`z')              -- Reindent buffer
vim.keymap.set('n', '<leader>a', 'A')                     -- Easy A
-- vim.keymap.set('n', '<leader>G', tele.live_grep)          -- Search text
vim.keymap.set('n', '<leader>G', fuzzyFindContents)          -- Search text
vim.keymap.set('n', '<leader>l', tele.lsp_definitions)    -- Search LSP definitions
vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<cr>') -- Find file in file tree
vim.keymap.set('n', '<leader>N', ':NvimTreeToggle<cr>')   -- Toggle file tree
vim.keymap.set('n', '<leader>o', teleProjectFiles)        -- Search files
vim.keymap.set('n', '<leader>q', ':bp<bar>bd#<cr>')       -- Close buffer
vim.keymap.set('n', '<leader>r', ':bufdo e<cr>')          -- Reload all buffers
vim.keymap.set('n', '<leader>t', tele.treesitter)         -- Search Treesitter
vim.keymap.set('n', '<leader>u', 'a<c-r>=')               -- Calculator
vim.keymap.set('n', '<leader>w', ':wa<cr>')               -- Save all buffers
vim.keymap.set('n', '<leader>z', 'za')                    -- Toggle fold
vim.keymap.set('n', '<leader>Z', 'zR')                    -- Open all folds

-- Split
vim.keymap.set('n', '<leader>sh', '<c-w>v<c-w>l')         -- Split horizontal (side by side)
vim.keymap.set('n', '<leader>sv', '<c-w>s<c-w>l')         -- Split vertical (top/bottom)
vim.keymap.set('n', '<leader>sc', '<c-w>c')               -- Split close
vim.keymap.set('n', '<leader>ss', '<c-w>r')               -- Split swap

-- Git
vim.keymap.set('n', '<leader>ga', ':!gaa<cr>')            -- Git add all
vim.keymap.set('n', '<leader>gs', tele.git_status)        -- Git status
vim.keymap.set('n', '<leader>gl', tele.git_commits)       -- Git log
vim.keymap.set('n', '<leader>gt', tele.git_bcommits)      -- Git buffer commits
vim.keymap.set('n', '<leader>gb', ':Git blame<cr>')       -- Git blame
vim.keymap.set('n', '<leader>gd', ':Git difftool<cr>')    -- Git diff
vim.keymap.set('n', '<leader>gm', ':Git mergetool<cr>')   -- Git mergetool

-- Trouble
vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>')
vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>')
vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>')
vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>')
vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>')
vim.keymap.set('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>')

-- LSP actions
vim.api.nvim_create_autocmd('User', {
    pattern = 'LspAttached',
    desc = 'LSP actions',
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            local opts = {buffer = true}
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')            -- Displays hover information about the symbol under the cursor
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')      -- Jump to the definition
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')     -- Jump to declaration
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')  -- Lists all the implementations for the symbol under the cursor
        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>') -- Jumps to the definition of the type symbol
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')      -- Lists all the references 
        bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')        -- Renames all references to the symbol under the cursor
    end
})

-- Allow comments in JSON files by setting jsonc filetype
vim.api.nvim_exec([[ autocmd BufNewFile,BufRead *.json setlocal filetype=jsonc ]], false)

-- Resize splits on window resize
vim.api.nvim_create_autocmd(
    { 'VimResized' },
    { command = ':wincmd =' }
)

-- Color overrides
vim.api.nvim_set_hl(0, 'Search', { bg = 'Purple' })
vim.api.nvim_set_hl(0, 'NvimTreeGitDirty', { fg = 'Yellow' })

-- Settings

-- App settings
vim.opt.inccommand = 'nosplit'                   -- Live command preview in buffer
vim.cmd('filetype plugin on')                    -- Read filetype info
vim.cmd('filetype indent on')                    -- Match file indents
vim.opt.ffs = { 'unix', 'dos', 'mac' }           -- Use unix as the standard file type
vim.opt.undofile = true                          -- Persistent undo

vim.opt.visualbell = true                        -- No bells
vim.opt.splitbelow = true                        -- Window splitting behavior
vim.opt.splitright = true                        -- Window splitting behavior
vim.opt.shortmess:append('aAIsT')                -- Less initial messaging
vim.opt.clipboard = 'unnamed'                    -- Enable clipboard
vim.opt.foldmethod = 'syntax'                    -- Enable folding by indent
vim.opt.foldenable = false                       -- Folds open by default
vim.opt.lazyredraw = true                        -- Don't render everything

-- UI settings
vim.opt.termguicolors = true                     -- More colors
vim.opt.background = 'dark'                      -- Dark colorscheme
vim.cmd('colorscheme tokyonight-night')          -- Set colorscheme
vim.opt.number = true                            -- Line numbers
vim.opt.showmode = false                         -- Only have the mode in the statusline
vim.opt.showmatch = true                         -- Highlight matching brace
vim.opt.incsearch = true                         -- Highlight search as you type
vim.opt.hlsearch = true                          -- Highlight search results
vim.opt.list = true                              -- Show invisible characters
vim.opt.listchars = { trail = '·' }              -- Show trailing spaces
vim.opt.signcolumn = 'yes'                       -- Always leave space for git/lint column

-- Behavior settings
vim.opt.scrolloff = 3                            -- Keep cursor away from the top/bottom
vim.opt.wrap = false                             -- No line wrapping
vim.opt.matchtime = 3                            -- Brace highlight time
vim.opt.timeout = false                          -- Time out on key codes but not mappings.
vim.opt.ttimeout = true                          -- Terminal keycode timeount
vim.opt.ttimeoutlen = 10                         -- Terminal timeout length
vim.opt.expandtab = true                         -- Use spaces
vim.opt.autoindent = true                        -- Auto indent
vim.opt.joinspaces = false                       -- One space after punctuation
vim.opt.softtabstop = 4                          -- Tab size
vim.opt.shiftwidth = 4                           -- Tab size
vim.opt.tabstop = 4                              -- Tab size for tab characters
vim.opt.smarttab = true                          -- Smart tab size
vim.opt.smartindent = true
vim.opt.ignorecase = true                        -- Ignore case when searching
vim.opt.smartcase = true                         -- Smart case-sensitivity
vim.opt.updatetime = 250                         -- Faster CursorHold for popups

-- local ExecuteMacroOverVisualRange = function()
--     -- echo "@".getcmdline()
--     vim.api.nvim_echo({{'@', 'None'}, {vim.fn.getcmdline(), 'None'}})
--     -- execute ":'<,'>normal @".nr2char(getchar())
-- end

-- -- " Macro over selection
-- -- xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
-- vim.keymap.set('x', '@', ':<C-u>call ExecuteMacroOverVisualRange()<CR>')
