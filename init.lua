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
  { import = "plugin.theme" },
  { import = "plugin.treesitter" },
  { import = "plugin.which-key" },
  { import = 'plugin.nvim-lspconfig' },
  { import = 'plugin.neo-tree' },
  -- *NOTES: Using bufferline instead of barbar.
  -- { import = 'plugin.barbar' },
  -- { import = 'plugin.bufferline' },
  { import = 'plugin.autopairs' },
  { import = 'plugin.nvim-ts-autotag' },
  { import = 'plugin.trouble' },
  { import = 'plugin.ale'},
  { import = "plugin.mini-indentscope" },
  { import = "plugin.todo-comments" },
  { import = "plugin.git-blame" },
  { import = 'plugin.illuminate' },
  { import = 'plugin.toggleterm' },
  { import = 'plugin.lazygit' },
  { import = 'plugin.nvim-ufo' },
  { import = 'plugin.nvim-surround' },
  { import = 'plugin.emmet-vim' }
})


require("config.after-plugin")
