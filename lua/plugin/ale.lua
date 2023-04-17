return {
  "dense-analysis/ale",
  config = function()
    vim.keymap.set("n", "<leader>p", "<cmd>:ALEFix<CR>", { desc = "ALEFix" })
    vim.g.ale_fixers = { 'prettier', 'eslint' }
  end,
}
