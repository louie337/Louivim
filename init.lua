local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config.base")
require("config.keymaps")
require("config.autocmds")

require("lazy").setup({
  { import = "plugin.alpha" },
  -- { import = "plugin.autoformat" },
  { import = "plugin.cmp" },
  { import = "plugin.comment" },
  { import = "plugin.fugitive" },
  { import = "plugin.gitsigns" },
  { import = "plugin.indent-blankline" },
  { import = "plugin.lualine" },
  { import = "plugin.mason" },
  { import = "plugin.neodev" },
  { import = "plugin.rhubarb" },
  { import = "plugin.sleuth" },
  { import = "plugin.telescope" },
  { import = "plugin.telescope-fzf-native" },
  { import = "plugin.theme" },
  { import = "plugin.treesitter" },
  { import = "plugin.which-key" },
  { import = 'plugin.nvim-lspconfig' },
  -- { import = 'plugin.plenary' },
  -- { import = 'plugin.nvim-web-devicons' },
  -- { import = 'plugin.nui' },
  { import = 'plugin.neo-tree' },
  { import = 'plugin.vim-prettier' },
  -- { import = 'plugin.barbar' }
  { import = 'plugin.bufferline' },
})


require("config.after-plugin")
