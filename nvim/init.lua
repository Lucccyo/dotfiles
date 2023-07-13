vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
       { 'williamboman/mason.nvim', config = true },
       'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
       { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
     },
  },

 {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets'
    },
 },

 {'neoclide/vim-jsx-improve'},
  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '[c', require('gitsigns').prev_hunk, { buffer = bufnr, desc = 'Go to Previous Hunk' })
        vim.keymap.set('n', ']c', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'Go to Next Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },

  {
    -- Nord Theme
    'shaunsingh/nord.nvim',
    --priority = 1000,
   -- config = function()
     -- vim.cmd.colorscheme 'nord'
    --end,
  },
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    -- priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme 'onedark'
    -- end,
  },
  { 'catppuccin/nvim',
    name = "catppuccin",
    config = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },


  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'catppuccin',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = "o",
      show_trailing_blankline_indent = true,
    },
  },


  {'akinsho/toggleterm.nvim', version = "*", config = true},
  -- "gc" to comment visual regions/lines
  -- { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
      --requires = {
        --{ 'nvim-telescope/telescopelive-grep-args.nvim'},
      --},
      --config = function()
        --require("telescope").load_extension("live_grep_args")
      --end
  },

  { "nvim-telescope/telescope-file-browser.nvim", requires = {'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' } },

  { 'nvim-lua/popup.nvim' },
  --{ 'nvim-lua/plenary.nvim' }
  --{ 'nvim-telescope/telescope.nvim' }
  { 'nvim-telescope/telescope-media-files.nvim' },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {'windwp/nvim-ts-autotag'},
    {'ray-x/web-tools.nvim'},
  {'norcalli/nvim-colorizer.lua'},
  -- { 'hrsh7th/nvim-lspconfig' },
  --{ 'hrsh7th/cmp-nvim-lsp' },
  --{ 'hrsh7th/cmp-buffer' },
  --{ 'hrsh7th/cmp-path' },
  --{ 'hrsh7th/cmpcmdline' },
  --{ 'hrsh7th/nvim-cmp',
  --  dependencies = {
    --  'FelipeLema/cmp-async-path',
      --'hrsh7th/cmp-buffer',
      --'hrsh7th/cmp-calc',
      --'hrsh7th/cmp-cmdline',
      --'hrsh7th/cmp-lua',
      --'hrsh7th/cmp-lsp',
      --'saadparwaitz1/cmp_luasnip',
      --'rafamadriz/friendly-snippets',
    --{
      --'L3MON3/LuaSnip',
      --build = 'make install_jsergexp',
      --version = 'v1.*',
    --},
  --  },
  --},


  -- {'tpope/vim-surround'},

  {
    "kylechui/nvim-surround",
    --version = "*",
    --event = "VeryLazy",
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
}, {})

-- [[ Setting options ]]

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
-- vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

require('telescope').setup {
  --pickers = {
  --  live_grep = {
      --additional_args = function(opts)
       -- return {"--hidden"}
      --end
    --},
  --},
  defaults = {
    -- hidden = true,
    --vimgrep_arguments = {
      --'rg',
      --'--hidden',
    previewer = true,
  },

  extensions = {
    file_browser = {
      theme = "ivy",
    },
    media_files = {
      filetypes = {"png", "webp", "jpeg", "jpg", "bmp", "pdf"},
    }
  },
}
  --   defaults = {

  --     mappings = {

require("telescope").load_extension "media_files"
-- require("telescope").load_extension "live_grep"
-- require("telescope").extensions.live_grep_args.live_grep_args()
require("telescope").load_extension "file_browser"

require'web-tools'.setup({
  keymaps = {
    rename = nil,
    repeat_rename = '.',
  },
  hurl = {
    show_headers = false,
    floating = false,
    formatter = {
      json = {'jq'},
      html = {'prettier', '--parser', 'html'},
    },
  },
})

-- vim.keymap.set('n', '<leader>fb', require("telescope").extensions.file_browser.file_browser, {desc = '[fb] Open file browser' })
vim.keymap.set('n', '<leader>fb', ':Telescope file_browser path=%:p:h select_buffer=t<CR>', {desc = '[fb] Open file browser' })
vim.keymap.set('n', '<leader>lg', ':Telescope live_grep search_dirs=%:p:h<CR>')

require("toggleterm").setup{}

vim.keymap.set('n', '<leader><CR>', ':ToggleTerm dir=$VIM_DIR<CR>', {desc = 'miaou'})
vim.keymap.set('t', '<leader><CR>', 'exit<CR>', {desc = 'miaou'})
vim.keymap.set('n', '<leader>init', ':e ~/.config/nvim/init.lua<CR>', {desc = 'open init.lua'})

require('cmp_nvim_lsp').setup{}

require'lspconfig'.pyright.setup{}
require('lspconfig').als.setup{
  settings = {
    
  }
}
require'lspconfig'.ocamllsp.setup{}
  require("nvim-surround").setup{}






-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.

  local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end
    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')
  -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
  end
  -- Enable the following language servers
  --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
  --
  --  Add any additional override configuration in the following tables. They will be passed to
  --  the `settings` field of the server config. You must look up that documentation yourself.
  require('nvim-ts-autotag').setup()

  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      underline = true,
      virtual_text = {
        spacing = 2,
        severity_limit = 'warning',
      },
      update_in_insert = true,
    }
  )


  local servers = {
    -- clangd = {},
    -- gopls = {},
    -- pyright = {},
    -- rust_analyzer = {},
    -- tsserver = {},
  lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  }
 require'lspconfig'.ocamllsp.setup{}
  -- Setup neovim lua configuration
  require('neodev').setup()

require('colorizer').setup()

  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
  -- Ensure the servers above are installed
  local mason_lspconfig = require 'mason-lspconfig'
  mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
  }
 mason_lspconfig.setup_handlers {
    function(server_name)
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server_name],
      }
    end,
  }
require("mason-lspconfig").setup({
  -- ensure_installed = {"sumneko_lua", "tsserver", "tailwindcss" }
})

local lspconfig = require('lspconfig')
local lsp_flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 150,
}

 lspconfig.emmet_ls.setup ({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"css", "html", "javascript", "javascriptreact", "typescripttreact"},
  flags = lsp_flags,
  init_options = {
    html = {
      options = {
        ["bom.enabled"] = true,
      },
    },
  }
 })


lspconfig.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescripttreact", "typescript.tsx"},
  cmd = { "typescript-language-server", "--stdio" },
}


  -- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}



