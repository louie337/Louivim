return {
  "saghen/blink.cmp",
  dependencies = { "folke/lazydev.nvim", "hrsh7th/nvim-cmp" },
  opts = {
    keymap = {
      preset = "default",
      ["<C-space>"] = {},
      ["<C-n>"] = { "select_next", "show", "fallback_to_mappings" },
    },

    completion = {
      keyword = { range = "full" },
      accept = { auto_brackets = { enabled = false } },
      menu = {
        auto_show = true,
        draw = {
          columns = {
            { "label",     "label_description", gap = 4 },
            { "kind_icon", "kind" },
          },
        },
      },
      documentation = { auto_show = true },
      ghost_text = { enabled = true },
    },

    signature = { enabled = true },

    fuzzy = { implementation = "lua" },
  },

  sources = {
    default = { "lsp", "path", "buffer", "snippets" },
    providers = {
      lsp = {
        score_offset = 1000,
      },
      snippets = {
        score_offset = -100,
      },
    },
  },
}
