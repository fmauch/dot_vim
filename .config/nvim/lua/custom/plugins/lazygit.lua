return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  dependencies = {
      "nvim-lua/plenary.nvim",
  },
  vim.keymap.set({ 'n' }, '<leader>lg', ':LazyGitCurrentFile<cr>', { silent = true })
}
