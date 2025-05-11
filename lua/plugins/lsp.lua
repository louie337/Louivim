local telescope = require("telescope")
return {
  {
    -- NOTES: LSP Server Manager
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "mason-org/mason-lspconfig.nvim",
  },
  {
    -- NOTE: LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    keys = {
      { "gd", function() telescope.lsp_definitions({ reuse_win = true }) end,      desc = "[G]oto [D]efinition" },
      { "gr", function() telescope.lsp_references({}) end,                         desc = "[G]oto [R]eferences" },
      { "gi", function() telescope.lsp_implementations({ reuse_win = true }) end,  desc = "[G]oto [I]mplementation" },
      { "gt", function() telescope.lsp_type_definitions({ reuse_win = true }) end, desc = "[G]oto [T]ype Definition" },
    }
  }
}
