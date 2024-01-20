return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.4",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kdheepak/lazygit.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
      config = function()
        -- Enable telescope fzf native, if installed
        pcall(require("telescope").load_extension, "fzf")
      end,
    },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
        -- NOTES: Default ignore patterns without .gitignore
        file_ignore_patterns = {
          ".node_modules/",
          ".git/",
          ".next/"
        },
      },
    })
    -- NOTE: Keymap settings
    local builtin = require("telescope.builtin")
    local utils = require("telescope.utils")
    -- See `:help telescope.builtin`
    vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
    vim.keymap.set(
      "n",
      "<leader>/",
      builtin.current_buffer_fuzzy_find,
      { desc = "[/] Fuzzily search in current buffer" }
    )
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set(
      "n",
      "<leader>sh",
      "<CMD>Telescope find_files hidden=true<CR>",
      { desc = "[S]earch [H]idden files" }
    )
    vim.keymap.set("n", "<leader>sH", builtin.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set(
      "n",
      "<leader>sG",
      "<CMD>Telescope grep_string search=<CR>",
      { desc = "[S]earch by [G]rep (Fuzzy)" }
    )
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sd", function()
      builtin.diagnostics({ initial_mode = "normal" })
    end, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>ss", function()
      builtin.spell_suggest({ initial_mode = "normal" })
    end, { desc = "[S]earch [S]pell Suggestions" })
    vim.keymap.set("n", "<leader>sj", builtin.jumplist, { desc = "[S]earch [J]ump list" })
    vim.keymap.set("n", "<leader>sJ", function()
      builtin.jumplist({ initial_mode = "normal", default_text = vim.fn.getcwd() })
    end, { desc = "[S]earch [J]ump list in current directory" })
    vim.keymap.set("n", "<leader>st", builtin.tagstack, { desc = "[S]earch [T]agstack" })
    vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffers" })
    vim.keymap.set("n", "<leader>sm", builtin.marks, { desc = "[S]earch [M]arks" })
    vim.keymap.set("n", "<leader>sq", builtin.quickfix, { desc = "[S]earch [Q]uickfix" })
  end,
}
