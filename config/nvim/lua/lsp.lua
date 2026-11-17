-- Setup neovim lsp
vim.lsp.config('*', {
    flags = {
        debounce_text_changes = 150,
    },
})

local has_float = function()
    return vim.iter(vim.api.nvim_tabpage_list_wins(0)):any(function(win)
        return vim.api.nvim_win_get_config(win).relative ~= ''
    end)
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        -- Open diagnostic window when cursor is on an error
        local group = vim.api.nvim_create_augroup('diagnostic_float_' .. args.buf, { clear = true })
        vim.api.nvim_create_autocmd('CursorHold', {
            group = group,
            buffer = args.buf,
            callback = function()
                -- Do not cover an open float (e.g. hover from K)
                if has_float() then
                    return
                end
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
    'oxlint',
    'pyright',
    'tsc',
    'vimls',
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
