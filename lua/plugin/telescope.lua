return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'kdheepak/lazygit.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
      config = function()
        -- Enable telescope fzf native, if installed
        pcall(require('telescope').load_extension, 'fzf')
      end
    },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    }
    -- NOTE: Keymap settings
    local builtin = require('telescope.builtin')
    -- See `:help telescope.builtin`
    vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader>bl', builtin.buffers, { desc = '[L]ist of buffers' })
    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find
    -- *NOTES: Kickstart.nvim setting
    -- function()
    --     builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    --     winblend = 10,
    --     previewer = false,
    --   })
    -- end
    , { desc = '[/] Fuzzily search in current buffer' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sh', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>', { desc = '[S]earch [H]idden files' })
    -- vim.keymap.set('n', '<leader>sn', '<cmd>T'elescope find_files hidden=true no_ignore=true<CR>', { desc = '[S]earch [N]o ignore' })
    vim.keymap.set('n', '<leader>sH', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    -- NOTE: Lazygit integration
    require("telescope").load_extension("lazygit")
    vim.keymap.set('n', '<leader>sl', require('telescope').extensions.lazygit.lazygit,
      { desc = '[S]earch [L]azygit' })
  end
}
