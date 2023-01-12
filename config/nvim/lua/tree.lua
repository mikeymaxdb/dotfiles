-- Setup nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require('nvim-tree').setup({
    view = {
        mappings = {
            list = {
                { key = '<2-LeftMouse>', action = 'edit_no_picker' },
            },
        },
    },
})
