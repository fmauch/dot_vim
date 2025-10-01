return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = "LspAttach",
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
  },
  config = function()
    local mason_registry = require "custom.lsp.mason-registry"

    local lint = require("lint")
    -- CMake linters
    local cmake_linters = {}
    local cmakelint_pkg_name = "cmakelint"
    if (mason_registry.ensure_installed(cmakelint_pkg_name)) then
      table.insert(cmake_linters, cmakelint_pkg_name)
    end

    -- Markdown linters
    local markdown_linters = {}
    local markdownlint_pkg_name = "markdownlint-cli2"
    if (mason_registry.ensure_installed(markdownlint_pkg_name)) then
      table.insert(markdown_linters, markdownlint_pkg_name)
    end

    -- XML linters
    local xml_linters = {}
    local vale_pkg_name = "vale"
    if (mason_registry.ensure_installed(vale_pkg_name)) then
      table.insert(xml_linters, vale_pkg_name)
    end

    -- YAML linters
    local yaml_linters = {}
    local yamllint_pkg_name = "yamllint"
    if (mason_registry.ensure_installed(yamllint_pkg_name)) then
      table.insert(yaml_linters, yamllint_pkg_name)
    end

    -- Python linters
    local python_linters = {}
    local python_linter_pkg_name = "pylint"
    if (mason_registry.ensure_installed(python_linter_pkg_name)) then
      table.insert(python_linters, python_linter_pkg_name)
    end

    -- Shell linters
    local shell_linters = {}
    local shell_linter_pkg_name = "shellcheck"
    if (mason_registry.ensure_installed(shell_linter_pkg_name)) then
      table.insert(shell_linters, python_linter_pkg_name)
    end

    lint.linters_by_ft = {
      cmake = cmake_linters,
      markdown = markdown_linters,
      python = python_linters,
      xml = xml_linters,
      yaml = yaml_linters,
      sh = shell_linters,
    }

    vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost", "BufEnter", "BufWinEnter" }, {
      callback = function()
        require('lint').try_lint()
      end,
    })

    -- Set pylint to work in virtualenv
    lint.linters.pylint.cmd = 'python'
    lint.linters.pylint.args = {'-m', 'pylint', '-f', 'json'}

    lint.linters["markdownlint-cli2"].args = {
      '--config',
      vim.fn.stdpath('config') .. '/lua/custom/plugins/cfg_linters/global.markdownlint-cli2.yml',
      '--'
    }

  end
}
