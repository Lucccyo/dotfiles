return {
  { "nvim-treesitter/nvim-treesitter", branch = "main", lazy = false, build = ":TSUpdate",

  config = function()
    local ts = require("nvim-treesitter")

    local languages = {
      "lua",
      "luadoc",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
      "bash",
      "json",
      "toml",
      "yaml",
      "python",
      "c",
      "cpp",
      "cmake",
      "make",
      "nasm",
    }

    ts.setup({})

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("user-treesitter", {
        clear = true,
      }),
      callback = function(ev)
        local ok = pcall(vim.treesitter.start, ev.buf)
        if ok then
          vim.bo[ev.buf].indentexpr =
            "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    if type(ts.install) == "function" then
      ts.install(languages)
    else
      vim.notify(
        "nvim-treesitter.install is unavailable. Check the plugin branch and checkout.",
        vim.log.levels.ERROR
      )
    end
  end,
  },
}