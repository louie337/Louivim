-- Global settings
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " "
-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- List & Map style settings
local opt = vim.opt

opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.sidescrolloff = 8
-- opt.clipboard = "unnamedplus"
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spell = true
opt.spelllang = { "en" }
opt.splitbelow = false -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.hlsearch = false -- Remove highlight search on search

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append { C = true }
end

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
