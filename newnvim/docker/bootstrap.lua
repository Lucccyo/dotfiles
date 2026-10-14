require("lazy").load({ plugins = { "mason.nvim" } })
local registry = require("mason-registry")
local finished = false

registry.refresh(function()
  local pkg = registry.get_package("lua-language-server")
  if pkg:is_installed() then
    finished = true
    return
  end
  pkg:once("closed", function() finished = true end)
  pkg:install()
end)

vim.wait(300000, function() return finished end, 200)

local languages = {
  "lua", "luadoc", "vim", "vimdoc", "query", "markdown",
  "markdown_inline", "bash", "json", "toml", "yaml",
}
require("nvim-treesitter").install(languages):wait(300000)

print("bootstrap OK")
