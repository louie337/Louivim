return {"folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 0
        require("which-key").setup({})
    end,
} -- *NOTES: Feature of showing what the keys do

