return{
  "andythigpen/nvim-coverage",
  requires = "nvim-lua/plenary.nvim",
  -- Optional: needed for PHP when using the cobertura parser
  rocks = { 'lua-xmlreader' },
  config = function()
    require("coverage").setup({
      commands = true, -- create commands
      highlights = {
      -- customize highlight groups created by the plugin
        covered = { fg = "#C3E88D" },   -- supports style, fg, bg, sp (see :h highlight-gui)
        uncovered = { fg = "#F07178" },
        partial = { fg = "#FFCB6B" },
      },
      signs = {
      	-- use your own highlight groups or text markers
      	covered = { hl = "CoverageCovered", text = "▎" },
      	uncovered = { hl = "CoverageUncovered", text = "▎" },
      },
      summary = {
      	-- customize the summary pop-up
      	min_coverage = 80.0,      -- minimum coverage threshold (used for highlighting)
      },
      cpp = {
        -- customize language specific settings
        coverage_file = "coverage.info",  -- default coverage file name
      },
      load_coverage_cb = function (ftype)
        vim.notify("Loaded " .. ftype .. " coverage")
      end,
    })
  end,
}
