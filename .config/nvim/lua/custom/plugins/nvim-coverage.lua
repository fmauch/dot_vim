return{
  "andythigpen/nvim-coverage",
  requires = "nvim-lua/plenary.nvim",
  -- Optional: needed for PHP when using the cobertura parser
  rocks = { 'lua-xmlreader' },
  config = function()
    require("coverage").setup()
  end,
}
