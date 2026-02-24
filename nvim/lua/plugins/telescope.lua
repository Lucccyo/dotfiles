return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ahmedkhalf/project.nvim',
    'stevearc/aerial.nvim',
    'nvim-telescope/telescope-file-browser.nvim'
  },
  config = function()
    require('project_nvim').setup({
      patterns = {
        '.git',
        '_opam',
        '_darcs',
        '.hg',
        '.bzr',
        '.svn',
        'Makefile',
        'package.json'
      },
      show_hidden = true,
    })
    local telescope = require('telescope')
    local builtin   = require('telescope.builtin')
    local themes    = require('telescope.themes')
    local actions   = require('telescope.actions')

    local projects     = telescope.load_extension('projects')
    local file_browser = telescope.load_extension('file_browser')

    telescope.setup({
      defaults = themes.get_ivy {
        mappings = {
          n = {
            ['q'] = actions.close
          },
        },
      },
      extensions = {
        file_browser = {
          theme        = 'ivy',
          hijack_netrw = true,
          hidden       = true,
        },
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", builtin.find_files,         { desc = "[f]iles"            })
    vim.keymap.set("n", "<leader>of", builtin.oldfiles,           { desc = "[o]ld [f]iles"      })
    vim.keymap.set("n", "<leader>lg", builtin.live_grep,          { desc = "[r]ipgrep"          })
    vim.keymap.set("n", "<leader>b",  builtin.buffers,            { desc = "[b]uffers"          })
    vim.keymap.set("n", "<leader>tk", builtin.keymaps,            { desc = "[k]eymaps (normal)" })
    vim.keymap.set("n", "<leader>rp", projects.projects,          { desc = "[p]rojects"         })

    -- Update this line
    vim.keymap.set("n", "<leader>fb", function()
      file_browser.file_browser({
        path = vim.fn.expand('%:p:h'),
        hidden = true
      })
    end, { desc = "[f]ile [b]rowser" })
  end
}

