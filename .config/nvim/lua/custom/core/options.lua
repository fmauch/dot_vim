-- See `:help vim.o`
--
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- setup indentation

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.foldenable = false
vim.opt.textwidth = 99

-- setup spelling
vim.opt.spelllang = 'en_us,de_20'
vim.opt.spell = true

-- Set highlight on search
vim.opt.hlsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
--
-- Enable mouse mode
vim.opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
