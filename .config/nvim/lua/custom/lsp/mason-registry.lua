-- Copied from https://codeberg.org/jufickel/nvim-config-files/src/branch/main/lua/user/lsp/mason-registry.lua
--MIT License

-- Copyright (c) 2022 Juergen Fickel
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
local M = {}

function M.ensure_installed(package_name)
  local mason_registry_status, mason_registry = pcall(require, "mason-registry")
  if (not mason_registry_status) then
    return false, nil
  end

  if (not mason_registry.is_installed(package_name)) then
    print("Installing " .. package_name)
    local package = mason_registry.get_package(package_name)
    package:install({})
  end

  return mason_registry.is_installed(package_name)
end

return M
