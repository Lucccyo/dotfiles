return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ahmedkhalf/project.nvim',
    'stevearc/aerial.nvim',
    'nvim-telescope/telescope-file-browser.nvim'
  },
  keys = {
    {
      "<leader>ff",
      function()
        require('telescope.builtin').find_files({
          hidden = true
        })
      end,
      desc = "[f]iles"
    },
    {
      "<leader>of",
      function()
        require('telescope.builtin').oldfiles()
      end,
      desc = "[o]ld (Files)"
    },
    {
      "<leader>lg",
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = "[r]ipgrep"
    },
    {
      "<leader>b",
      function()
        require('telescope.builtin').buffers()
      end,
      desc = "[b]uffers"
    },
    {
      "<leader>tk",
      function()
        require('telescope.builtin').keymaps()
      end,
      desc = "[k]eymaps (normal)"
    },
    {
      "<leader>rp",
      function()
        require 'telescope'.extensions.projects.projects()
      end,
      desc = "[p]rojects"
    },
    {
      "<leader>fb",
      function()
        require("telescope").load_extension("file_browser").file_browser()
      end,
      desc = "[f]ile [b]rowser"
    }
  },
  config = function()
    require("project_nvim").setup({
      patterns = {
        ".git",
        "_opam",
        "_darcs",
        ".hg",
        ".bzr",
        ".svn",
        "Makefile",
        "package.json"
      },
      show_hidden = true,
    })
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    telescope.load_extension('projects')
    require("telescope").load_extension "file_browser"
    telescope.setup({
      defaults = require('telescope.themes').get_ivy {
        mappings = {
          n = {
            ["q"] = actions.close
          },
        },
      },
      extensions = {
        file_browser = {
          theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              -- your custom insert mode mappings
            },
            ["n"] = {
              -- your custom normal mode mappings
            },
          },
        },
      },
    })
  end
}
