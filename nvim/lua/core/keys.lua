local nmap = require("core.helpers").nmap
local imap = require("core.helpers").imap
local vmap = require("core.helpers").vmap
local tmap = require("core.helpers").tmap

-- Normal mode
nmap("<leader>os", "<cmd>nohl<CR>", "[s]top search")

nmap("<C-h>", "<C-w>h", "Go to left window")
nmap("<C-j>", "<C-w>j", "Go to down window")
nmap("<C-k>", "<C-w>k", "Go to up window")
nmap("<C-l>", "<C-w>l", "Go to right window")

nmap("<C-Left>", "<C-w><S-h>", "Move window to the left")
nmap("<C-Down>", "<C-w><S-j>", "Move window to down")
nmap("<C-Up>", "<C-w><S-k>", "Move window to up")
nmap("<C-Right>", "<C-w><S-l>", "Move window to the right")

nmap("<S-Up>", ":resize +2<CR>", "Resize up")
nmap("<S-Down>", ":resize -2<CR>", "Resize down")
nmap("<S-Left>", ":vertical resize +2<CR>", "Resize left")
nmap("<S-Right>", ":vertical resize -2<CR>", "Resize right")

nmap("<TAB>", ":bnext<CR>", "Next buffer")
nmap("<S-TAB>", ":bprevious<CR>", "Previous buffer")

vim.keymap.set("n", "<leader>tt", function()
  local dir = vim.fn.expand("%:p:h")
  vim.fn.jobstart({ "alacritty", "--working-directory", dir }, { detach = true })
end)

nmap("<leader>+", ":tabnew<CR>", "Open a new empty tab")
nmap("[", ":tabprev<CR>", "Move to the prev tab")
nmap("]", ":tabnext<CR>", "Move to the next tab")

vim.api.nvim_create_user_command("Spelling", function()
  if vim.opt.spell:get() then
    vim.opt.spell = false
    print("Disable spell checker.")
  else
    vim.opt.spell = true
    vim.opt.spelllang = { "fr" }
    print("Enable spell checker.")
  end
end, {})

  vim.api.nvim_create_user_command("CmpOff", function()
    require("cmp").setup.buffer({ enabled = false })
  end, {})

  vim.api.nvim_create_user_command("CmpOn", function()
    require("cmp").setup.buffer({ enabled = true })
  end, {})

-- Visual mode
vmap("<", "<gv", "Retab left and keep selected")
vmap(">", ">gv", "Retab right and keep selected")

-- Terminal mode
tmap("<Esc>", "<C-\\><C-n>", "Escape terminal")
