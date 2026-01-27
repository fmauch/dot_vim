return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      ---
      -- OR use all default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- remove a default
      vim.keymap.del("n", "<C-e>", { buffer = bufnr })

      -- add your mappings
      vim.keymap.set("n", "?",     api.tree.toggle_help,                  opts("Help"))
      ---
    end

    require("nvim-tree").setup {
      update_focused_file = {
        enable      = true,
        update_root = {
          enable = false,
          ignore_list = {}
        },
      },
      on_attach = my_on_attach,
      sync_root_with_cwd = false,
    }
  end,

  vim.keymap.set({ 'n' }, '<leader>t', ':NvimTreeFindFileToggle<cr>', { silent = true })
}
