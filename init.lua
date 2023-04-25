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
	require("plugin.fugitive"),
	{ import = "plugin.gitsigns" },
	{ import = "plugin.indent-blankline" },
	{ import = "plugin.lualine" },
	{ import = "plugin.mason" },
	require("plugin.neodev"),
	require("plugin.rhubarb"),
	require("plugin.sleuth"),
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
	require('plugin.nvim-ts-autotag'),
	{ import = 'plugin.trouble' },
	{ import = 'plugin.ale' },
	{ import = "plugin.mini-indentscope" },
	{ import = "plugin.todo-comments" },
	require("plugin.git-blame"),
	require('plugin.illuminate'),
	{ import = 'plugin.toggleterm' },
	require('plugin.lazygit'),
	{ import = 'plugin.nvim-ufo' },
	{ import = 'plugin.nvim-surround' },
	require('plugin.emmet-vim'),
	{ import = 'plugin.nvim-navic' },
	require('plugin.text-case'),
	require('plugin.vim-smoothie'),
})


require("config.after-plugin")
