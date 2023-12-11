return {
  "EdenEast/nightfox.nvim",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end
  }
}