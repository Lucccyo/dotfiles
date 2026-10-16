return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
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

    require("nvim-treesitter").setup({})
    require("nvim-treesitter").install(languages)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("user-treesitter", { clear = true }),
      callback = function(ev)
        if pcall(vim.treesitter.start, ev.buf) then
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
