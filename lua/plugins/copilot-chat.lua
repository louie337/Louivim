return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      -- { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "zbirenbaum/copilot.lua" },                -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                       -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
      model = "claude-3.7-sonnet",
      -- model = "claude-3.7-sonnet-thought",
      agent = "copilot",
      prompts = {
        ReactExpert = {
          system_prompt = "You are a senior fullstack developer with years of experience in React.",
          description = "React expert",
        },
      },
      -- Default uses visual selection or falls back to buffer
      selection = function(source)
        local select = require("CopilotChat.select")
        return select.visual(source) or select.buffer(source)
      end,
      mappings = {
        -- NOTE: Originally it uses <C-l> to reset, but it collides with my existing keymaps so I am disabling it.
        reset = {
          normal = "",
          insert = "",
        },
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
    keys = {
      { "<leader>Ct", ":CopilotChatToggle<cr>",  desc = "[C]opilot [C]hat [T]oggle" },
      { "<leader>Cs", ":CopilotChatStop<cr>",    desc = "[C]opilot [C]hat [S]top" },
      { "<leader>CR", ":CopilotChatReset<cr>",   desc = "[C]opilot [C]hat [R]eset" },
      { "<leader>Cp", ":CopilotChatPrompts<cr>", desc = "[C]opilot [C]hat [P]rompts", mode = { "v", "n" } },
      { "<leader>Cm", ":CopilotChatModels<cr>",  desc = "[C]opilot [C]hat [M]odels" },
      { "<leader>Ca", ":CopilotChatAgents<cr>",  desc = "[C]opilot [C]hat [A]gents" },
      {
        "<leader>CS",
        function()
          vim.ui.input({ prompt = "Save session as: " }, function(name)
            if name and name ~= "" then
              vim.cmd("CopilotChatSave " .. name)
            end
          end)
        end,
        desc = "[C]opilot [C]hat [S]ave",
      },
      {
        "<leader>CL",
        function()
          vim.ui.input({ prompt = "Load session: " }, function(name)
            if name and name ~= "" then
              vim.cmd("CopilotChatLoad " .. name)
            end
          end)
        end,
        desc = "[C]opilot [C]hat [L]oad",
      },
      { "<leader>CP", ":CopilotChat<PromptName><cr>", desc = "[C]opilot [C]hat [P]rompt Template" },
    },
  },
}
