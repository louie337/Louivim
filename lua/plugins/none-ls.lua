return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd.with({
          condition = function(utils)
            return utils.root_has_file({ ".prettierrc" })
          end,
          prefer_local = "node_modules/.bin",
        }),
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
      },
    })
  end,
}
