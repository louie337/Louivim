return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<leader>dO", "<cmd>Outline<CR>", desc = "[D]ocument [O]utline" },
  },
  opts = {
    -- Your setup opts here
  },
}
