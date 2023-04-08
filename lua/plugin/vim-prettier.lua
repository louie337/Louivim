return {
  'prettier/vim-prettier',
  build = function()
    os.execute("yarn install --frozen-lockfile --production")
    -- vim.g.prettier.config.single_quote = true
    -- vim.g.prettier.config.trailing_comma = 'all'
  end
}
