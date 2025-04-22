lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "python",
        "go",
        "rust",
        "c",
        "cpp",
        "json",
        "yaml",
    },
    highlight = { enable = true },
    indent = { enable = true },
}
EOF
