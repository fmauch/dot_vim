return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  version = "main",
  dependencies = {
    {'nvim-treesitter/nvim-treesitter-textobjects', branch = "main"},
    { "mason-org/mason.nvim" },
  },
  config = function()
    local ts = require "nvim-treesitter"
    if not vim.fn.executable("tree-sitter") then
      vim.cmd [[MasonInstall tree-sitter-cli]]
    end
    ts.install{ 'c', 'cpp', 'lua', 'python', 'typescript', 'vimdoc', 'vim', 'xml', 'yaml', 'cmake', 'dockerfile', 'markdown', 'diff' }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = ts.get_installed(),
      callback = function()
        vim.treesitter.start()
        local tso = require "nvim-treesitter-textobjects"
        local select = require "nvim-treesitter-textobjects.select"
        local swap = require "nvim-treesitter-textobjects.swap"
        tso.setup {
          select = {
            lookahead = true,
            selection_modes = {
              ["@parameter.outer"] = "v",
              ["@function.outer"] = "v",
              ["@class.outer"] = "V",
            },
            include_surrounding_whitespace = false,
          },
        }

        -- keymaps
        -- You can use the capture groups defined in `textobjects.scm`
        vim.keymap.set({ "x", "o" }, "af", function()
          select.select_textobject("@function.outer", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "if", function()
          select.select_textobject("@function.inner", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "ac", function()
          select.select_textobject("@class.outer", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "ic", function()
          select.select_textobject("@class.inner", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "as", function()
          select.select_textobject("@local.scope", "locals")
        end)
        vim.keymap.set("n", "<leader>.", function()
          swap.swap_next "@parameter.inner"
        end)
        vim.keymap.set("n", "<leader>,", function()
          swap.swap_previous "@parameter.inner"
        end)

        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      end,
    })
  end
}
