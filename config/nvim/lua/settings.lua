vim.o.inccommand = 'nosplit' -- Highlight replace as you type

vim.o.background = 'dark' -- Dark colorscheme
vim.cmd('colorscheme tokyonight-night')

-- Trouble
vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>')
vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>')
vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>')
vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>')
vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>')
vim.keymap.set('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>')

--[[ Cheatsheet

C-n Multi-line edit
C-q Open selected search results in Trouble
C-s Start completion
C-h Navigate splits left
C-j Navigate splits down
C-k Navigate splits up
C-l Navigate splits right
C-p Previous buffer
C-n Next buffer
C-/ Comment line/selection

L-* Search current word
L-= Indent buffer
L-a Append at EOL
L-G Search text
L-l Search LSP definitions
L-n File file in file tree
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
