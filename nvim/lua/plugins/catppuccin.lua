return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000,
    config = function()
      vim.cmd.colorscheme("catppuccin-frappe")
      require("catppuccin").setup {
        color_overrides = {
          all = {
            text = "#fbfad0",
          },
          frappe = {
            base = "#251c25",
            text = "#fbfad0",
            mantle = "#3aa45b",
            crust = "#474747",
          },
            latte = {},
            macchiato = {},
            mocha = {},
          }
      }
    end
  }
}
