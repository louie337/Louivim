return {
  "akinsho/bufferline.nvim",
  dependencies = {'nvim-tree/nvim-web-devicons'},
  version = "v3.*",
  -- *NOTES: Don't know why it does not work without this line.
  event = "VeryLazy",
  keys = {
    -- Move to previous/next
    {'<A-h>', '<Cmd>BufferLineCyclePrev<CR>', desc = "BufferPrevious", mode = "n"},
    {'<A-l>', '<Cmd>BufferLineCycleNext<CR>', desc = "BufferNext", mode = "n"},
    -- Re-order to previous/next
    {'<A-<>', '<Cmd>BufferLineMovePrev<CR>', desc = "BufferMovePrevious", mode = "n"},
    {'<A->>', '<Cmd>BufferLineMoveNext<CR>', desc = "BufferMovePrevious", mode = "n"},
    -- Goto buffer in position...
    {'<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', desc = "BufferGoto 1", mode = "n"},
    {'<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', desc = "BufferGoto 2", mode = "n"},
    {'<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', desc = "BufferGoto 3", mode = "n"},
    {'<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', desc = "BufferGoto 4", mode = "n"},
    {'<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', desc = "BufferGoto 5", mode = "n"},
    {'<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', desc = "BufferGoto 6", mode = "n"},
    {'<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', desc = "BufferGoto 7", mode = "n"},
    {'<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', desc = "BufferGoto 8", mode = "n"},
    {'<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', desc = "BufferGoto 9", mode = "n"},
    {'<A-0>', '<Cmd>BufferLineGoToBuffer -1<CR>', desc = "BufferLast", mode = "n"},
    -- Pin/unpin buffer
    {'<A-p>', '<Cmd>BufferLineTogglePin<CR>', desc = "BufferPin", mode = "n"},
    -- Close buffer
    {'<A-c>', '<Cmd>bd<CR>', desc = "BufferClose", mode = "n"},
    {'<A-C>', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = "BufferClose", mode = "n"},
  },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
}
