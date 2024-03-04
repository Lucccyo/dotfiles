return {
    "numToStr/Comment.nvim",
    opts = {
        extra = {
            ---Add comment on the line above
            above = 'gcO',
            ---Add comment on the line below
            below = 'gco',
            ---Add comment at the end of line
            eol = 'gcA'
        },
    },
    lazy = false,
    config = function()
        require('Comment').setup()
    end
}
