vim.o.inccommand = 'nosplit' -- Highlight replace as you type

vim.o.background = 'dark' -- Dark colorscheme
vim.cmd('colorscheme tokyonight-night')

-- Space leader
vim.keymap.set('n', '<space>', '<leader>', { remap = true })
vim.keymap.set('x', '<space>', '<leader>', { remap = true })
vim.keymap.set('n', '<space><space>', '<leader><leader>', { remap = true })

vim.keymap.set('n', 'j', 'gj') -- Move using display lines
vim.keymap.set('n', 'k', 'gk') -- Move using display lines
vim.keymap.set('n', 'Y', 'y$') -- Yank till EOL

vim.keymap.set('v', 'p', '"0p') -- Put without yank
vim.keymap.set('v', 'P', '"0P') -- Put without yank

vim.keymap.set('n', '<c-h>', '<c-w>h') -- Navigate splits left
vim.keymap.set('n', '<c-j>', '<c-w>j') -- Navigate splits down
vim.keymap.set('n', '<c-k>', '<c-w>k') -- Navigate splits up
vim.keymap.set('n', '<c-l>', '<c-w>l') -- Navigate splits right

vim.keymap.set('n', '<leader><leader>', ':update<cr>')    -- Quick save
vim.keymap.set('n', '<leader>=', 'mzgg=G`z')              -- Reindent buffer
vim.keymap.set('n', '<leader>a', 'A')                     -- Easy A
vim.keymap.set('n', '<leader>w', ':wa<cr>')               -- Save all buffers
vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<cr>') -- Find file in file tree
vim.keymap.set('n', '<leader>N', ':NvimTreeToggle<cr>')   -- Toggle file tree
vim.keymap.set('n', '<leader>q', ':bp<bar>bd#<cr>'        -- Close buffer
vim.keymap.set('n', '<leader>u', 'a<c-r>=')               -- Calculator
vim.keymap.set('n', '<leader>z', 'za')                    -- Toggle fold
vim.keymap.set('n', '<leader>Z', 'zR')                    -- Open all folds

vim.keymap.set('n', '<cr>', ':noh<cr><cr>')               -- Clear search highlight on enter
vim.keymap.set('n', '<bs>', '<c-^')                       -- Swap to last buffer

-- Trouble
vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>')
vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>')
vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>')
vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>')
vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>')
vim.keymap.set('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>')

--[[ Cheatsheet

<Space> Space leader!

C-n Multi-line edit
C-q Open selected search results in Trouble
C-s Start completion
C-h Navigate splits left
C-j Navigate splits down
C-k Navigate splits up
C-l Navigate splits right
C-/ Comment line/selection

L-* Search current word
L-= Indent buffer
L-a Append at EOL
L-G Search text
L-l Search LSP definitions
L-n Find file in file tree
L-N Toggle file tree
L-o Search files
L-t Search Treesitter
L-u Calculator
L-q Close buffer
L-r Reload all buffers
L-w Save all buffers
L-z Toggle folds
L-Z Open all folds

L-sh Split side by side
L-sv Split top/bottom
L-sc Close split
L-ss Swap splits

L-xx Trouble toggle
L-xw Workspace diagnostics
L-xd Document diagnostics
L-xl Location list (per window)
L-xq Quickfix list (global)

K   Symbol info
gd  Jump to definition
gD  Just to declaration
gi  List implementations for symbol
go  Jump to definition of type symbol
gr  List references
gR  Lsp references (Trouble)

F2  Rename symbol
BS  Swap to last buffer

--]]
