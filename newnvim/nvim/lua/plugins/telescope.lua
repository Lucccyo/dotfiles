return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function() return vim.fn.executable("make") == 1 end,
    },
  },
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<CR>", desc = "Chercher un fichier" },
    { "<leader>lg", "<cmd>Telescope live_grep<CR>", desc = "Chercher dans les fichiers (ripgrep)" },
    { "<leader>b", "<cmd>Telescope buffers<CR>", desc = "Buffers ouverts" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Aide Neovim" },
    { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Fichiers récents" },
    { "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Symboles du document" },
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits Git" },
    { "<leader>gS", "<cmd>Telescope git_status<CR>", desc = "Statut Git" },
    { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Chercher dans le buffer" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "top" },
      },
    })
    pcall(telescope.load_extension, "fzf")
  end,
}
