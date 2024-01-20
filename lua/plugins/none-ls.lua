return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- NOTES: Lua settings
        null_ls.builtins.formatting.stylua,

        -- NOTES: Prettier settings
        null_ls.builtins.formatting.prettierd.with({
          condition = function(utils)
            return utils.root_has_file_matches("prettierrc")
          end,
          prefer_local = "node_modules/.bin",
          extra_filetypes = { "mdx" },
        }),

        -- NOTES: Eslnit settings
        null_ls.builtins.diagnostics.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file_matches("eslintrc")
          end,
          prefer_local = "node_modules/.bin",
        }),
        null_ls.builtins.code_actions.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file_matches("eslintrc")
          end,
          prefer_local = "node_modules/.bin",
        }),

        -- NOTES: Cspell settings
        null_ls.builtins.diagnostics.cspell.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity.HINT
          end,
        }),
      },
    })
  end,
}
