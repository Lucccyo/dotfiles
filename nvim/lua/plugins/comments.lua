return {
    "numToStr/Comment.nvim",
    opts = {
        extra = {
            above = 'gcO', -- Add comment on the line above
            below = 'gco', -- Add comment on the line below
            eol   = 'gcA', -- Add comment at the end of line
        },
    },
    lazy = false,
    config = function()
        require('Comment').setup()
    end
}
