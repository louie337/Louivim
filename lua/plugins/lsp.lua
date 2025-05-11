return {
  {
    -- NOTES: LSP Server Manager
    "williamboman/mason.nvim",
    config=true,
  },
  {
    -- NOTE: LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    config = function()
    end,
    keys = {
      -- { "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition" },
      -- { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References", nowait = true },
      -- { "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, desc = "Goto Implementation" },
      -- { "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, desc = "Goto T[y]pe Definition" },
    }
  }
}
