return {
  "folke/noice.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>nd", "<CMD>NoiceDismiss<CR>",   desc = "[N]oice [D]ismiss" },
    { "<leader>nh", "<CMD>NoiceHistory<CR>",   desc = "[N]oice [H]istory" },
    { "<leader>nt", "<CMD>NoiceTelescope<CR>", desc = "[N]oice [T]elescope" },
  },
  opts = {
    -- add any options here
    cmdline = {
      format = {
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = "󰍉 ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = "󰍉 ", lang = "regex" },
        lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
      },
    },
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true,      -- use a classic bottom cmdline for search
      command_palette = true,    -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,        -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false,    -- add a border to hover docs and signature help
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
