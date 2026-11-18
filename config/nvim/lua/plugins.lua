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
    'https://github.com/saghen/blink.lib',                    -- Completion lib
    'https://github.com/saghen/blink.cmp',                    -- Completion
    'https://github.com/neovim/nvim-lspconfig',               -- LSP server configs
    'https://github.com/nvim-treesitter/nvim-treesitter',
})

-- Some plugins require a setup()
require('nvim-tree').setup()
require('trouble').setup()
require('gitsigns').setup()

-- Build blink.cmp's rust library (skipped when one exists for the current commit)
-- The macOS 27 strip step writes a misaligned LINKEDIT string pool that dyld rejects
vim.env.CARGO_PROFILE_RELEASE_STRIP = 'none'
require('blink.cmp').build():pwait()

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
