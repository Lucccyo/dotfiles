-- Install Lazy.nvim if not found
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Options for lazy
require('lazy').setup({
  spec = { import = 'plugins' },
  install = {
    colorscheme = {
      "catppuccin-mocha"
    }
  }
})

require("lazy").setup({
  -- {"tarides/ocaml.nvim",
  {
    dir = "/home/cha/Documents/github/ocaml.nvim",
    config = function()
      require("ocaml").setup({
        params = {
          client = "MAOUAHHAHAH",
        },
        keymaps = {
          jump_next_hole = "<leader>n",
          jump_prev_hole = "<leader>p",
          construct = "<leader>c",
          jump = "<leader>j",
          phrase_prev = "<leader>pp",
          phrase_next = "<leader>pn",
          infer = "<leader>i",
          switch_ml_mli = "<leader>s",
          type_enclosing = "<leader>t",
          type_enclosing_grow = "<Up>",
          type_enclosing_shrink = "<Down>",
          type_enclosing_increase = "<Right>",
          type_enclosing_decrease = "<Left>",
        },
      })
    end
  }
})