-- Setup neovim lsp
local lspconfig = require('lspconfig')
local lsp_defaults = {
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(client, bufnr)
        vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})

        vim.api.nvim_create_autocmd("CursorHold", {
            buffer = bufnr,
            callback = function()
                local opts = {
                    focusable = false,
                    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                    border = 'rounded',
                    source = 'always',
                    prefix = ' ',
                    scope = 'cursor',
                }
                vim.diagnostic.open_float(nil, opts)
            end
        })
    end
}

-- Inject configs
lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    lsp_defaults
)

vim.diagnostic.config({
    -- virtual_text = false,
})

-- Enable LSP servers
local servers = {
    'cssls',
    'eslint',
    'html',
    'jsonls',
    'pyright',
    'tsserver',
    'vimls',
}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({})
end

-- Nicer icons in gutter
local signs = { Error = "■ ", Warn = "▲ ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
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
        'python',
        'scss',
        'tsx',
        'typescript',
        'vim',
    },
    highlight = { enable = true },
    indent = { enable = true }
}
