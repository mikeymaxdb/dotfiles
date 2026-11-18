-- Setup blink.cmp (v2)
-- Cmdline completion (buffer for '/', cmdline for ':') and LSP capabilities are enabled by default
require('blink.cmp').setup({
    keymap = {
        preset = 'none',
        ['<C-s>'] =  { 'show', 'show_documentation', 'hide_documentation', 'fallback' },
        ['<Tab>'] =  { 'accept', 'fallback' },
        ['<CR>'] =   { 'accept', 'fallback' },
        ['<Up>'] =   { 'select_prev', 'snippet_backward', 'fallback' },
        ['<Down>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<C-y>'] =  { 'show_signature', 'hide_signature', 'fallback' },
        ['<C-e>'] =  { 'cancel', 'fallback' },
    },
    signature = {
        enabled = true,
    },
    completion = {
        menu = {
            border = 'rounded',
            draw = {
                columns = {
                    { "label", "label_description", gap = 1 },
                    { "kind_icon", "kind" , gap = 1 }
                },
            }
        },
        documentation = {
            auto_show = true,
            window = {
                border = 'rounded',
            },
        },
        ghost_text = {
            enabled = true,
        },
    },
    cmdline = {
        keymap = {
            preset = 'inherit',
            ['<CR>'] = { 'fallback' },
        },
        completion = { menu = { auto_show = true } },
    },
})
