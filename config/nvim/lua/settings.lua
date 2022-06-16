vim.g.inccommand = 'nosplit' -- Highlight replace as you type

-- Setup neovim lsp
local lspconfig = require('lspconfig')
local lsp_defaults = {
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(client, bufnr)
        vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
    end
}

lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    lsp_defaults
    )

local servers = {'tsserver', 'cssls', 'html', 'vimls', 'jsonls'}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({})
end

-- require'nvim-treesitter.configs'.setup {
-- ensure_installed = 'maintained',
-- highlight = { enable = true },
-- indent = { enable = false }
-- }

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn['vsnip#anonymous'](args.body)
            end,
        },
        mapping = {
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
            ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        },
        sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'vsnip' },
            }, {
                { name = 'buffer' },
            }),
        window = {
            -- documentation = cmp.config.window.bordered(),
        },
    })

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
        sources = {
            { name = 'buffer' }
        }
    })

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
    })

vim.api.nvim_create_autocmd('User', {
        pattern = 'LspAttached',
        desc = 'LSP actions',
        callback = function()
            local bufmap = function(mode, lhs, rhs)
                local opts = {buffer = true}
                vim.keymap.set(mode, lhs, rhs, opts)
            end

            -- Displays hover information about the symbol under the cursor
            bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

            -- Jump to the definition
            bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

            -- Jump to declaration
            bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

            -- Lists all the implementations for the symbol under the cursor
            bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

            -- Jumps to the definition of the type symbol
            bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

            -- Lists all the references 
            bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

            -- Displays a function's signature information
            bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

            -- Renames all references to the symbol under the cursor
            bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

            -- Selects a code action available at the current cursor position
            bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
            bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

            -- Show diagnostics in a floating window
            bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

            -- Move to the previous diagnostic
            bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

            -- Move to the next diagnostic
            bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
        end
    })
