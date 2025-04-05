return {
  "zbirenbaum/copilot-cmp",
  dependencies = {
    -- { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
    { "zbirenbaum/copilot.lua" },                 -- or zbirenbaum/copilot.lua
  },
  config = function()
    require("copilot_cmp").setup()
  end,
}
