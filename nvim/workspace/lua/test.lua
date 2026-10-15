-- Fichier de test
local M = {}

function M.greet(name)
  return "Bonjour, " .. name .. " !"
end

print(M.greet(vim.fn.getenv("USER")))

local unused = 42

return M
