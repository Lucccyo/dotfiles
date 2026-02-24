return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()

      -- Lua (pour configurer Neovim en Lua)
      vim.lsp.config.lua_ls.setup {
        cmd = { "lua-language-server" }, -- ou chemin absolu si besoin
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }

      -- OCaml
      vim.lsp.config.ocamllsp.setup {}

      -- LTex
      vim.lsp.config.ltex.setup {
  on_attach = on_attach,
  cmd = { "ltex-ls" },
  filetypes = { "markdown", "text" },
  flags = { debounce_text_changes = 300 },
      }

      -- Mappings de base
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      map("n", "gd", vim.lsp.buf.definition, opts)
      map("n", "gdv", "<cmd>vsplit | Telescope lsp_definitions<CR>", opts)
      map("n", "gdh", "<cmd>hsplit | Telescope lsp_definitions<CR>", opts)
      map("n", "gD", vim.lsp.buf.declaration, opts)
      map("n", "gt", vim.lsp.buf.type_definition, opts)
      map("n", "gtv", "<cmd>vsplit | Telescope lsp_type_definitions<CR>", opts)
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "<leader>rn", vim.lsp.buf.rename, opts)
      map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      map("n", "gr", vim.lsp.buf.references, opts)
      map("n", "<leader>e", vim.diagnostic.open_float, opts)
      map("n", "[d", vim.diagnostic.goto_prev, opts)
      map("n", "]d", vim.diagnostic.goto_next, opts)
    end,
  },
}
