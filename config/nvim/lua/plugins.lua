-- Auto install
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- UI
    'nvim-lualine/lualine.nvim',           -- Statusline
    'lukas-reineke/indent-blankline.nvim', -- Vertical indent lines
    {
        'lewis6991/gitsigns.nvim',             -- Git gutter
        config = function()
            require('gitsigns').setup()
        end,
    },
    'nvim-tree/nvim-web-devicons',         -- File icons

    -- Functionality
    'michaeljsmith/vim-indent-object',     -- Selecting by indent level vii vai vaI
    'terryma/vim-multiple-cursors',        -- Edit multiple locations at once <C-n>
    'tpope/vim-commentary',                -- Comment/uncomment lines
    'tpope/vim-fugitive',                  -- Git wrapper
    'tpope/vim-repeat',                    -- Enable plugins to repeat with '.'
    'tpope/vim-surround',                  -- Quickly surround with quotes
    'tpope/vim-sleuth',                    -- Smart indentation
    'wellle/targets.vim',                  -- More text objects

    -- Colorschemes
    'AlexvZyl/nordic.nvim',                -- Warmer nordic
    'folke/tokyonight.nvim',               -- Neon tokyo

    -- Tools
    {
    'nvim-tree/nvim-tree.lua',             -- File browser
        config = function()
            require('nvim-tree').setup()
        end,
    },
    'ibhagwan/fzf-lua',                    -- Fuzzy finder
    'folke/trouble.nvim',                  -- Advanced quick fix
    {
        'olimorris/codecompanion.nvim',    -- AI
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        config = true
    },

    -- LSP
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'hrsh7th/nvim-cmp',
    'nvim-treesitter/nvim-treesitter'
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

-- Code companion
require('secrets')
require("codecompanion").setup({
    strategies = {
        chat = {
            adapter = 'anthropic',
        },
        inline = {
            adapter = 'anthropic',
        },
    },
    adapters = {
        anthropic = function()
            return require('codecompanion.adapters').extend('anthropic', {
                env = {
                    api_key = ANTHROPIC_KEY
                },
            })
        end,
    },
})
