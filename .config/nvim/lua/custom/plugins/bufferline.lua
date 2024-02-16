return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup {
      options = {
        numbers = 'ordinal',
        indicator = {
          style = 'underline',
        },
        show_close_icon = false,
        truncate_names = false,
      },
    }
  end,
  vim.keymap.set({ 'n' }, '<C-w>1', ':BufferLineGoToBuffer 1<cr>', { silent = true }),
  vim.keymap.set({ 'n' }, '<C-w>2', ':BufferLineGoToBuffer 2<cr>', { silent = true }),
  vim.keymap.set({ 'n' }, '<C-w>3', ':BufferLineGoToBuffer 3<cr>', { silent = true }),
  vim.keymap.set({ 'n' }, '<C-w>4', ':BufferLineGoToBuffer 4<cr>', { silent = true }),
  vim.keymap.set({ 'n' }, '<C-w>5', ':BufferLineGoToBuffer 5<cr>', { silent = true }),
  vim.keymap.set({ 'n' }, '<C-w>6', ':BufferLineGoToBuffer 6<cr>', { silent = true }),
  vim.keymap.set({ 'n' }, '<C-w>7', ':BufferLineGoToBuffer 7<cr>', { silent = true }),
  vim.keymap.set({ 'n' }, '<C-w>8', ':BufferLineGoToBuffer 8<cr>', { silent = true }),
  vim.keymap.set({ 'n' }, '<C-w>9', ':BufferLineGoToBuffer 9<cr>', { silent = true }),
}
