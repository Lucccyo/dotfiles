local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Effacer la surbrillance de recherche" })
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Sauvegarder" })
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quitter" })

map("n", "<C-h>", "<C-w>h", { desc = "Fenêtre à gauche" })
map("n", "<C-j>", "<C-w>j", { desc = "Fenêtre en bas" })
map("n", "<C-k>", "<C-w>k", { desc = "Fenêtre en haut" })
map("n", "<C-l>", "<C-w>l", { desc = "Fenêtre à droite" })

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostic sous le curseur" })
map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Diagnostic précédent" })
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Diagnostic suivant" })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("yank-highlight", { clear = true }),
  callback = function() vim.hl.on_yank() end,
})
