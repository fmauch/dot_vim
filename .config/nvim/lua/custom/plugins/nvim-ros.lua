return {
  'tadachs/ros-nvim',
  config = function() require("ros-nvim").setup({ only_workspace = true }) end,
  dependencies = { "nvim-lua/plenary.nvim" },

  -- follow links in launch files
  vim.keymap.set('n', '<leader>rol', function() require("ros-nvim.ros").open_launch_include() end, { silent = true, noremap = true }),

  -- show definition for interfaces (messages/services) in floating window
  vim.keymap.set('n', '<leader>rdi', function() require("ros-nvim.ros").show_interface_definition() end, { silent = true, noremap = true }),
}
