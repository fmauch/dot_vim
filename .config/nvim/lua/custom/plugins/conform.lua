return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      python = { "isort", "black" },
      -- Conform will run the first available formatter
      javascript = { "prettierd", "prettier", stop_after_first = true },
      cpp = { "clang-format" },
    },

    vim.keymap.set({"n", "v"}, "<leader>C", require("conform").format)
  })
  end
}
