-- return { --Theme inspired by Atom
--     'navarasu/onedark.nvim',
--     priority = 1000,
--     config = function()
--       vim.cmd.colorscheme 'onedark'
--     end,
--   }

return {
	"folke/tokyonight.nvim",
	config = function()
		vim.cmd.colorscheme 'tokyonight-storm'
	end,
}
