return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "frappe",
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
    color_overrides = {
      all = {
        text = "#e9e678",
      },
      frappe = {
        base = "#050f2c",
        text = "#e9e678",
        mantle = "#5b5f0d",
        crust = "#474747",
      },
        latte = {},
        macchiato = {},
        mocha = {},
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
