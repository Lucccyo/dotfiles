return {
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function()
      local gitsigns = require('gitsigns')
      gitsigns.setup()
      vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, { desc = "[b]lame" })
    end,
  },

  {
    'dinhhuy258/git.nvim',
    config = function()
      require('git').setup({
        default_mappings = false
      })
    end
  }
}
