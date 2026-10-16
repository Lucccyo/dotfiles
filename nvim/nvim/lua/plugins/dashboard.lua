local header = [[
 ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
 ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
 ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
 ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]]
 
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader>;", function() Snacks.dashboard() end, desc = "Page d'accueil" },
  },
  ---@type snacks.Config
  opts = {
    dashboard = {
      enabled = true,
      width = 54,
      preset = {
        header = header,
        keys = {
          { key = "f", desc = "Chercher un fichier", action = ":Telescope find_files" },
          { key = "g", desc = "Chercher dans les fichiers", action = ":Telescope live_grep" },
          { key = "r", desc = "Fichiers récents", action = ":Telescope oldfiles" },
          { key = "n", desc = "Nouveau fichier", action = ":enew | startinsert" },
          {
            key = "c",
            desc = "Configuration",
            action = function()
              vim.cmd.cd(vim.fn.stdpath("config"))
              vim.cmd("Telescope find_files")
            end,
          },
          { key = "l", desc = "Plugins (Lazy)", action = ":Lazy" },
          { key = "m", desc = "Serveurs LSP (Mason)", action = ":Mason" },
          { key = "q", desc = "Quitter", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { title = "Fichiers récents", section = "recent_files", cwd = true, limit = 5, padding = 1 },
        { title = "Projets", section = "projects", limit = 3, padding = 1 },
        { section = "startup" }, -- temps de démarrage et nombre de plugins
      },
    },
  },
}

