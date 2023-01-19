-- Auto install
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'              -- Package manager

    -- UI
    use 'airblade/vim-gitgutter'              -- Gitgutter
    use 'nvim-lualine/lualine.nvim'           -- Statusline
    use 'lukas-reineke/indent-blankline.nvim' -- Vertical indent lines

    -- Functionality
    use 'michaeljsmith/vim-indent-object'     -- Selecting by indent level vii vai vaI
    use 'terryma/vim-multiple-cursors'        -- Edit multiple locations at once <C-n>
    use 'tpope/vim-commentary'                -- Comment/uncomment lines
    use 'tpope/vim-fugitive'                  -- Git wrapper
    use 'tpope/vim-repeat'                    -- Enable plugins to repeat with '.'
    use 'tpope/vim-surround'                  -- Quickly surround with quotes
    use 'wellle/targets.vim'                  -- More text objects

    -- Colorscheme
    -- use 'ellisonleao/gruvbox.nvim'
    -- use 'shaunsingh/nord.nvim'
    use 'folke/tokyonight.nvim'

    -- Tools
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons'
        }
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
    }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/nvim-cmp'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

-- File browser
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

-- Vertical indent lines
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#333333]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=LightMagenta]]
require('indent_blankline').setup({
    char = '│',
    show_current_context = true,
    char_highlight_list = {
        'IndentBlanklineIndent1',
    },
})
