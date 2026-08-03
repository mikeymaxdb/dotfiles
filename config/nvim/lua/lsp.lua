-- Setup neovim lsp
vim.lsp.config('*', {
    flags = {
        debounce_text_changes = 150,
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        -- Open diagnostic window when cursor is on an error
        vim.api.nvim_create_autocmd('CursorHold', {
            callback = function()
                local opts = {
                    focusable = false,
                    close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
                    border = 'rounded',
                    source = 'always',
                    prefix = ' ',
                    scope = 'cursor',
                }
                vim.diagnostic.open_float(nil, opts)
            end
        })
    end
})

-- Configure diagnostics
vim.diagnostic.config({
    virtual_text = true,
    underline =  true,
    update_in_insert = false,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '■',
            [vim.diagnostic.severity.WARN]  = '▲',
            [vim.diagnostic.severity.HINT]  = '',
            [vim.diagnostic.severity.INFO]  = '◉',
        }
    },
})

-- Enable LSP servers
local servers = {
    'cssls',
    'eslint',
    'html',
    'jsonls',
    'pyright',
    -- 'ts_ls',
    'tsgo',
    'vimls',
    'oxlint',
}
for _, lsp in ipairs(servers) do
    vim.lsp.enable(lsp)
end

-- Setup treesitter
require'nvim-treesitter'.setup {
    install_dir = vim.fn.stdpath('data') .. '/site',
    highlight = { enable = true },
    indent = { enable = true }
}

require('nvim-treesitter').install {
    'javascript',
    'jsdoc',
    'json',
    'lua',
    'markdown',
    'python',
    'scss',
    'tsx',
    'typescript',
    'vim',
}
