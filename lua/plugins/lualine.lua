return {
  -- Set lualine as statusline
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(plugin)
    local icons = require("options.icons")
    local noice = require("noice")

    local function fg(name)
      return function()
        ---@type {foreground?:number}?
        local hl = vim.api.nvim_get_hl_by_name(name, true)
        return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
      end
    end

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          {
            "filetype",
            icon_only = true,
            separator = "",
            padding = { left = 1, right = 0 },
          },
          { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
          -- stylua: ignore
        },
        lualine_x = {
          {
            noice.api.status.message.get_hl,
            cond = noice.api.status.message.has,
          },
          {
            noice.api.status.command.get,
            cond = noice.api.status.command.has,
            color = { fg = "#ff9e64" },
          },
          {
            noice.api.status.mode.get,
            cond = noice.api.status.mode.has,
            color = { fg = "#ff9e64" },
          },
          {
            noice.api.status.search.get,
            cond = noice.api.status.search.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = fg("Special"),
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
        },
        lualine_y = {
          { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
      extensions = { "neo-tree" },
    }
  end,
  -- See `:help lualine.txt`
  -- opts = {
  --   options = {
  --     icons_enabled = false,
  --     theme = 'tokyonight',
  --     component_separators = '|',
  --     section_separators = '',
  --   },
  -- },
}
