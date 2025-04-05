-- NOTE: Used i mode on it before but it is causing lag
local gpModes = { "v", "n" }

return {
  "robitx/gp.nvim",
  config = function()
    local conf = {
      -- For customization, refer to Install > Configuration in the Documentation/Readme
      providers = {
        openai = {},
        copilot = {
          endpoint = "https://api.githubcopilot.com/chat/completions",
          secret = {
            "bash",
            "-c",
            "cat ~/.config/github-copilot/apps.json | sed -e 's/.*oauth_token...//;s/\".*//'",
          },
        },
      },
    }
    require("gp").setup(conf)
    -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
  end,
  keys = {
    -- { "<leader>g<C-t>", ":GpChatNew tabnew<cr>", desc = "[G]ptPrompt [T]abnew ChatNew",          mode = gpModes },
    -- { "<leader>g<C-v>", ":GpChatNew vsplit<cr>", desc = "[G]ptPrompt [V]split ChatNew",          mode = gpModes },
    -- { "<leader>g<C-s>", ":GpChatNew split<cr>",  desc = "[G]ptPrompt [S]plit ChatNew",           mode = gpModes },
    { "<leader>ga",  ":GpAppend<cr>",                  desc = "[G]ptPrompt [A]ppend (after)",      mode = gpModes },
    { "<leader>gb",  ":GpPrepend<cr>",                 desc = "[G]ptPrompt [P]repend (before)",    mode = gpModes },
    -- { "<leader>gc",     ":GpChatNew<cr>",        desc = "[G]ptPrompt [C]hat New",                mode = gpModes },
    { "<leader>gg",  group = "[G]ptPrompt [G]enerate", mode = gpModes },
    { "<leader>gge", ":GpEnew<cr>",                    desc = "[G]ptPrompt [G]enerate [E]new",     mode = gpModes },
    { "<leader>ggn", ":GpNew<cr>",                     desc = "[G]ptPrompt [G]enerate [N]ew",      mode = gpModes },
    { "<leader>ggp", ":GpPopup<cr>",                   desc = "[G]ptPrompt [G]enerate [P]opup",    mode = gpModes },
    { "<leader>ggt", ":GpTabnew<cr>",                  desc = "[G]ptPrompt [G]enerate [T]abnew",   mode = gpModes },
    { "<leader>ggv", ":GpVnew<cr>",                    desc = "[G]ptPrompt [G]enerate [V]new",     mode = gpModes },
    { "<leader>gi",  ":GpImplement<cr>",               desc = "[G]ptPrompt [I]mplement selection", mode = gpModes },
    {
      "<leader>gn",
      "<cmd>GpNextAgent<cr>",
      desc = "[G]ptPrompt [N]ext Agent",
      mode = gpModes,
    },
    -- { "<leader>gp",     ":GpChatPaste<cr>",      desc = "[G]ptPrompt [P]aste Chat",              mode = gpModes },
    { "<leader>gr", ":GpRewrite<cr>", desc = "[G]ptPrompt [R]ewrite", mode = gpModes },
    {
      "<leader>gs",
      "<cmd>GpStop<cr>",
      desc = "[G]ptPrompt [S]top",
      mode = gpModes,
    },
    -- { "<leader>gt",     ":GpChatToggle<cr>",     desc = "[G]ptPrompt [T]oggle Chat",             mode = gpModes },
    -- { "<leader>gw",     group = "[G]ptPrompt [W]hisper",        mode = gpModes },
    -- { "<leader>gwa",    ":GpWhisperAppend<cr>",  desc = "[W]hisper [A]ppend",          mode = gpModes },
    -- { "<leader>gwb",    ":GpWhisperPrepend<cr>", desc = "[W]hisper [P]repend",         mode = gpModes },
    -- { "<leader>gwe",    ":GpWhisperEnew<cr>",    desc = "[W]hisper [E]new",            mode = gpModes },
    -- { "<leader>gwn",    ":GpWhisperNew<cr>",     desc = "[W]hisper [N]ew",             mode = gpModes },
    -- { "<leader>gwp",    ":GpWhisperPopup<cr>",   desc = "[W]hisper [P]opup",           mode = gpModes },
    -- { "<leader>gwr",    ":GpWhisperRewrite<cr>", desc = "[W]hisper [R]ewrite",         mode = gpModes },
    -- { "<leader>gwt",    ":GpWhisperTabnew<cr>",  desc = "[W]hisper [T]abnew",          mode = gpModes },
    -- { "<leader>gwv",    ":GpWhisperVnew<cr>",    desc = "[W]hisper [V]new",            mode = gpModes },
    -- { "<leader>gww",    ":GpWhisper<cr>",        desc = "[W]hisper",                 mode = gpModes },
    { "<leader>gx", ":GpContext<cr>", desc = "[C]ontext",             mode = gpModes },
  },
}
