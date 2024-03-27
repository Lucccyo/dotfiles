return {
  "whonore/Coqtail",
  config = function()
    vim.keymap.set("n", "<leader>j",  ":CoqNext<CR>",   { desc = "go ahead by one step" })
    vim.keymap.set("n", "<leader>k",  ":CoqUndo<CR>",   { desc = "go back by one step"  })
    vim.keymap.set("n", "<leader>l",  ":CoqToLine<CR>", { desc = "start from [l]ine"    })
    vim.keymap.set("i", "jj",  "<Esc>:CoqNext<CR>", { desc = "go ahead by one step" })
    vim.keymap.set("i", "kk",  "<Esc>:CoqUndo<CR>", { desc = "go back by one step"  })
  end
}
