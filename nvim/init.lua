vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.shiftwidth = 2
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {'azabiong/vim-highlighter'},
	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
	},

	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},

	{ "neoclide/vim-jsx-improve" },
	-- Useful plugin to show you pending keybinds.
	{ "folke/which-key.nvim", opts = {} },
	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				vim.keymap.set(
					"n",
					"[c",
					require("gitsigns").prev_hunk,
					{ buffer = bufnr, desc = "Go to Previous Hunk" }
				)
				vim.keymap.set("n", "]c", require("gitsigns").next_hunk, { buffer = bufnr, desc = "Go to Next Hunk" })
				vim.keymap.set(
					"n",
					"<leader>ph",
					require("gitsigns").preview_hunk,
					{ buffer = bufnr, desc = "[P]review [H]unk" }
				)
			end,
		},
	},

	{
		-- Nord Theme
		"shaunsingh/nord.nvim",
		--priority = 1000,
		-- config = function()
		-- vim.cmd.colorscheme 'nord'
		--end,
	},
	{
		-- Theme inspired by Atom
		"navarasu/onedark.nvim",
		-- priority = 1000,
		-- config = function()
		--   vim.cmd.colorscheme 'onedark'
		-- end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},

	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		-- See `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = false,
				theme = "catppuccin",
				component_separators = "|",
				section_separators = "",
			},
		},
	},

	{
		-- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help indent_blankline.txt`
		opts = {
			char = "o",
			show_trailing_blankline_indent = true,
		},
	},

	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	-- "gc" to comment visual regions/lines
	-- { 'numToStr/Comment.nvim', opts = {} },

	-- Fuzzy Finder (files, lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		--requires = {
		--{ 'nvim-telescope/telescopelive-grep-args.nvim'},
		--},
		--config = function()
		--require("telescope").load_extension("live_grep_args")
		--end
	},

	{
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{ "Whonore/Coqtail" },
	{ "nvim-lua/popup.nvim" },
	--{ 'nvim-lua/plenary.nvim' }
	--{ 'nvim-telescope/telescope.nvim' }
	{ "nvim-telescope/telescope-media-files.nvim" },
	-- Fuzzy Finder Algorithm which requires local dependencies to be built.
	-- Only load if `make` is available. Make sure you have the system
	-- requirements installed.
	{ "windwp/nvim-ts-autotag" },
	{ "ray-x/web-tools.nvim" },
	{ "norcalli/nvim-colorizer.lua" },
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
		"nvim-telescope/telescope-fzf-native.nvim",
		-- NOTE: If you are having trouble with this installation,
		--       refer to the README for telescope-fzf-native for more instructions.
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},

	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
	},
}, {})

vim.cmd([[command! -nargs=* BuildJava !javac %:p]])

-- [[ Setting options ]]

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

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
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

require("telescope").setup({
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
			filetypes = { "png", "webp", "jpeg", "jpg", "bmp", "pdf" },
		},
	},
})
--   defaults = {

--     mappings = {

require("telescope").load_extension("media_files")
-- require("telescope").load_extension "live_grep"
-- require("telescope").extensions.live_grep_args.live_grep_args()
require("telescope").load_extension("file_browser")

require("web-tools").setup({
	keymaps = {
		rename = nil,
		repeat_rename = ".",
	},
	hurl = {
		show_headers = false,
		floating = false,
		formatter = {
			json = { "jq" },
			html = { "prettier", "--parser", "html" },
		},
	},
})

-- vim.keymap.set('n', '<leader>fb', require("telescope").extensions.file_browser.file_browser, {desc = '[fb] Open file browser' })
vim.keymap.set(
	"n",
	"<leader>fb",
	":Telescope file_browser path=%:p:h select_buffer=t<CR>",
	{ desc = "[fb] Open file browser" }
)
vim.keymap.set("n", "<leader>lg", ":Telescope live_grep search_dirs=%:p:h<CR>")

require("toggleterm").setup({})

vim.keymap.set("n", "<leader><CR>", ":ToggleTerm dir=$VIM_DIR<CR>", { desc = "miaou" })
vim.keymap.set("t", "<leader><CR>", "exit<CR>", { desc = "miaou" })
vim.keymap.set("n", "<leader>init", ":e ~/.config/nvim/init.lua<CR>", { desc = "open init.lua" })
vim.keymap.set("n", "<leader>td", ":!cat ~/Documents/todo<CR>", { desc = "show todo list" })


require("cmp_nvim_lsp").setup({})

require("lspconfig").pyright.setup({})
require("lspconfig").als.setup({
	settings = {},
})
require("lspconfig").ocamllsp.setup({})
require("nvim-surround").setup({})

local lspconfig = require("lspconfig")

-- Configuration du serveur LSP pour OCaml (ocamllsp)
lspconfig.ocamllsp.setup({
	on_attach = function(client, bufnr)
		-- Désactiver les bannières pour les diagnostics (erreurs/avertissements)
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = false, -- Désactiver les soulignements
			virtual_text = false, -- Désactiver le texte virtuel (messages)
		})

		-- Votre fonction on_attach ici (si nécessaire)
	end,
})



