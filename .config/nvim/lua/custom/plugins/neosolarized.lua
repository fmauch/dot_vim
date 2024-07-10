return {
 "svrana/neosolarized.nvim",
  dependencies = {
    "tjdevries/colorbuddy.nvim",
  },
  config = function()
    require('neosolarized').setup{
      comment_italics = true,
      background_set = true,
    }
    vim.cmd("colorscheme neosolarized")
  end,
}
