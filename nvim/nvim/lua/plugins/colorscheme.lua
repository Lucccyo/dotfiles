return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "mocha",
    integrations = {
      gitsigns = true,
      telescope = { enabled = true },
      treesitter = true,
      mason = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          warnings = { "undercurl" },
        },
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
