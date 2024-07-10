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
        update_root = {
          enable = false,
          ignore_list = {}
        },
      },
      sync_root_with_cwd = false,
    }
  end,

  vim.keymap.set({ 'n' }, '<leader>t', ':NvimTreeFindFileToggle<cr>', { silent = true })
}
