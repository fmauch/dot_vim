return {
 "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,

  vim.keymap.set({ 'n' }, '<leader>t', ':NvimTreeFindFileToggle<cr>', { silent = true })
}
