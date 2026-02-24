return {
  "numToStr/Comment.nvim",
  opts = {
    extra = {
      above = 'gcO',
      below = 'gco',
      eol   = 'gcA',
    },
  },
  lazy = false,
  config = function()
    require('Comment').setup()
  end
}
