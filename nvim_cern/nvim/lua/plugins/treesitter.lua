return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "JoosepAlviste/nvim-ts-context-commentstring"
    },
    opts = {
        install = {
            "json", "javascript", "typescript", "tsx",
            "yaml", "html", "css", "markdown", "markdown_inline",
            "bash", "lua", "vim", "dockerfile", "gitignore",
            "c", "rust", "svelte", "haskell", "r", "rnoweb",
        },
        auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
