return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame = false,
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "]h", function() gs.nav_hunk("next") end, "Hunk suivant")
        map("n", "[h", function() gs.nav_hunk("prev") end, "Hunk précédent")
        map("n", "<leader>gs", gs.stage_hunk, "Stage le hunk")
        map("n", "<leader>gr", gs.reset_hunk, "Reset le hunk")
        map("n", "<leader>gp", gs.preview_hunk, "Prévisualiser le hunk")
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame de la ligne")
        map("n", "<leader>gB", gs.toggle_current_line_blame, "Basculer le blame inline")
        map("n", "<leader>gd", gs.diffthis, "Diff du fichier")
      end,
    },
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "GBrowse" },
    keys = {
      { "<leader>gg", "<cmd>Git<CR>", desc = "Statut Git (fugitive)" },
    },
  },
}
