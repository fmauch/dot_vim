return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      update_focused_file = {
        enable      = true,
        update_root  = true,
        ignore_list = {}
      },
    }
  end,

  vim.keymap.set({ 'n' }, '<leader>t', ':NvimTreeFindFileToggle<cr>', { silent = true })
}
