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

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'airblade/vim-gitgutter'          -- Gitgutter
    use {
        'junegunn/fzf.vim',                -- Fast file searching
        requires = {
            'junegunn/fzf',
            run = './install --all'
        }
    }
    use 'junegunn/vim-plug'               -- Plugin manager
    use 'michaeljsmith/vim-indent-object' -- Selecting by indent level vii vai vaI
    use 'terryma/vim-multiple-cursors'    -- Edit multiple locations at once <C-n>
    use 'tpope/vim-commentary'            -- Comment/uncomment lines
    use 'tpope/vim-fugitive'              -- Git wrapper
    use 'tpope/vim-repeat'                -- Enable plugins to repeat with '.'
    use 'tpope/vim-surround'              -- Quickly surround with quotes
    use 'wellle/targets.vim'              -- More text objects
    use 'yggdroot/indentline'             -- Vertical line for space indents

    -- use 'ellisonleao/gruvbox.nvim'
    use 'morhetz/gruvbox'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons'
        }
    }

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
