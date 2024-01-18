return {
  "folke/todo-comments.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  lazy = false,
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    keywords = {
      FIX = {
        icon = " ",
        color = "error",
        alt = { "IMPORTANT", "Important", "important", "BUG" },
      },
      TODO = { icon = " ", color = "info", alt = { "Todo", "todo" } },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "COMMENT", "Comment", "comment" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO", "Note", "note" } },
      TEST = { icon = " ", color = "test", alt = { "QUESTION", "Question", "question" } },
    },
    highlight = {
      multiline = false,
      pattern = [[.*<(KEYWORDS)(S|s|\s|:)]], -- pattern or table of patterns, used for highlighting (vim regex)
    },
    search = {
      pattern = [[\b(KEYWORDS)(S\s|\s|:)]], -- ripgrep regex
    }
  },
  keys = {
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "[S]earch [T]odo" },
  }
}
