require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'gitignore',
        'javascript',
        'jsdoc',
        'json',
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
