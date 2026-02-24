return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "rust",
        "python",
        "markdown",
        "ocaml",
        "bibtex",
        "c",
        "cmake",
        "cpp",
        "css",
        "haskell",
        "html",
        "javascript",
        "json",
        "make",
        "scala",
        "typescript",
        "vim"
      },
      highlight = {
        enable = true,
      },
    })
  end
}
