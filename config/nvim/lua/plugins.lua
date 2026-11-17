vim.pack.add({
    -- UI
    'https://github.com/nvim-lualine/lualine.nvim',           -- Statusline
    'https://github.com/lukas-reineke/indent-blankline.nvim', -- Vertical indent lines
    'https://github.com/lewis6991/gitsigns.nvim',             -- Git gutter
    'https://github.com/nvim-tree/nvim-web-devicons',         -- File icons

    -- Colorschemes
    'https://github.com/folke/tokyonight.nvim',               -- Neon tokyo

    -- Functionality
    'https://github.com/michaeljsmith/vim-indent-object',     -- Selecting by indent level vii vai vaI
    'https://github.com/terryma/vim-multiple-cursors',        -- Edit multiple locations at once <C-n>
    'https://github.com/tpope/vim-commentary',                -- Comment/uncomment lines
    'https://github.com/tpope/vim-fugitive',                  -- Git wrapper
    'https://github.com/tpope/vim-repeat',                    -- Enable plugins to repeat with '.'
    'https://github.com/tpope/vim-surround',                  -- Quickly surround with quotes
    'https://github.com/tpope/vim-sleuth',                    -- Smart indentation
    'https://github.com/wellle/targets.vim',                  -- More text objects

    -- Tools
    'https://github.com/nvim-tree/nvim-tree.lua',             -- File browser
    'https://github.com/ibhagwan/fzf-lua',                    -- Fuzzy finder
    'https://github.com/folke/trouble.nvim',                  -- Advanced quick fix

    -- LSP
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/cmp-path',
    'https://github.com/hrsh7th/cmp-cmdline',
    'https://github.com/hrsh7th/cmp-vsnip',
    'https://github.com/hrsh7th/vim-vsnip',
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/nvim-treesitter/nvim-treesitter'
})

require('nvim-tree').setup()

require('trouble').setup()

require('gitsigns').setup({
    linehl = false,
    numhl = false,
})

-- Statusline
require('lualine').setup({
    options = {
        component_separators = '',
        section_separators = '',
    },
    sections = {
        lualine_a = {'%{toupper(mode())}'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
            {
                'filename',
                path = 1,
            },
        },
        lualine_x = {},
        lualine_y = {'filetype'},
        lualine_z = {'%l/%L:%c'}
    }
})

-- Indentation vertical lines
vim.api.nvim_set_hl(0, 'IndentBlankLineIndent1', { fg = '#222331' })
require('ibl').setup({
    scope = {
        enabled = true,
        show_start = false,
        show_end = false
    },
    indent = {
        highlight = { 'IndentBlankLineIndent1' }
    }
})
