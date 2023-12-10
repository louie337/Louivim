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
	require("plugin.dressing"),
	require("plugin.noice"),
	require("plugin.alpha"),
	require("plugin.cmp"),
	require("plugin.comment"),
	require("plugin.fugitive"),
	require("plugin.gitsigns"),
	require("plugin.indent-blankline"),
	require("plugin.mason"),
	require("plugin.neodev"),
	require("plugin.rhubarb"),
	require("plugin.sleuth"),
	require("plugin.telescope"),
	require("plugin.theme"),
	require("plugin.treesitter"),
	require("plugin.which-key"),
	require("plugin.nvim-lspconfig"),
	require("plugin.neo-tree"),
	-- require("plugin.autopairs" ),
	require("plugin.trouble"),
	require("plugin.ale"),
	require("plugin.mini-indentscope"),
	require("plugin.todo-comments"),
	require("plugin.git-blame"),
	require("plugin.illuminate"),
	require("plugin.toggleterm"),
	require("plugin.lazygit"),
	require("plugin.nvim-ufo"),
	require("plugin.nvim-surround"),
	require("plugin.emmet-vim"),
	require("plugin.nvim-navic"),
	require("plugin.lualine"),
	require("plugin.text-case"),
	require("plugin.vim-smoothie"),
	-- require("plugin.vim-gitgutter"),
	require("plugin.nvim-spectre"),
	require("plugin.diffview"), -- The plugin to view git difference
	require("plugin.symbols-outline"),
	require("plugin.nvim-colorizer"),
	-- TODO: Add color picker
	-- require("plugin.color-picker"),
	-- NOTE: Achieved plugins
	-- { import = 'plugin.barbar' },
	-- { import = 'plugin.bufferline' },
	-- require("plugin.nvim-ts-autotag"),
	change_detection = { enabled = true, notify = false }
})


require("config.after-plugin")
