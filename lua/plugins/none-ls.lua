return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- NOTES: Lua settings
        null_ls.builtins.formatting.stylua,

        -- NOTES: Prettier settings
        null_ls.builtins.formatting.prettier.with({
          only_local = "node_modules/.bin",
          extra_filetypes = { "mdx" },
        }),

        -- NOTES: Eslnit settings
        require("none-ls.diagnostics.eslint_d").with({
          condition = function(utils)
            return utils.root_has_file_matches("eslintrc")
          end,
          only_local = "node_modules/.bin",
        }),
        require("none-ls.code_actions.eslint_d").with({
          condition = function(utils)
            return utils.root_has_file_matches("eslintrc")
          end,
          only_local = "node_modules/.bin",
        }),

        -- NOTES: Cspell settings
        null_ls.builtins.completion.spell.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity.HINT
          end,
        }),
      },
    })
  end,
}
