-- Setup neovim lsp
local lspconfig = require('lspconfig')
local lsp_defaults = {
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(client, bufnr)
        vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
    end
}

lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    lsp_defaults
)

local servers = {
    'tsserver',
    'cssls',
    'html',
    'vimls',
    'jsonls',
}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({})
end

-- Setup treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        -- 'gitignore',
        'javascript',
        'jsdoc',
        'jsonc',
        'lua',
        'markdown',
        'scss',
        'tsx',
        'typescript',
        'vim',
    },
    highlight = { enable = true },
    indent = { enable = true }
}
