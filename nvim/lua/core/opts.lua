local options = {
    -- Default indent size
    expandtab     = true,
    shiftwidth    = 2,
    tabstop       = 4,
    smartindent   = true,

    -- Hidden chars
    list = true,

    -- UI
    termguicolors = true,
    bg            = "dark",
    mouse         = 'a',      -- Always be able to use mouse
    number        = true,
    splitbelow    = true,
    splitright    = true,

    -- Status line
    cmdheight   = 1,
    showcmd     = true,
    laststatus  = 2, -- Always

    -- Clipboard
    clipboard = 'unnamed,unnamedplus',

    -- Scroll size
    scrolloff     = 8,
    sidescrolloff = 8,

    -- Search
    ignorecase  = true,
    smartcase   = true,

    -- Completion
    wildmode = 'list:longest',

    colorcolumn = "80",
}

vim.opt.listchars:append("trail:·")

for k, v in pairs(options) do
    vim.opt[k] = v
end
