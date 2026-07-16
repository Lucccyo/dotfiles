return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
    },

  config = function()
    local telescope = require('telescope')
    local builtin   = require('telescope.builtin')
    local themes    = require('telescope.themes')
    local actions   = require('telescope.actions')

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
          hijack_netrw = true, -- disables netrw and use telescope-file-browser in its place
        },
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", builtin.find_files,         { desc = "[f]iles"            })
    vim.keymap.set("n", "<leader>lg", builtin.live_grep,          { desc = "[r]ipgrep"          })
    vim.keymap.set("n", "<leader>b",  builtin.buffers,            { desc = "[b]uffers"          })
    vim.keymap.set("n", "<leader>fb", function()
        file_browser.file_browser({
            path = vim.fn.expand('%:p:h'),
            hidden = true
        })
    end,  { desc = "[f]ile [b]rowser"   })

  end
}
