return {
  'romgrk/barbar.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  lazy = false,
  opts = {
    -- lazy.nvim can automatically call setup for you. just put your options here:
    insert_at_start = true,
    animation = true,
    -- …etc
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
  keys = {
    -- Move to previous/next
    {'<A-h>', '<Cmd>BufferPrevious<CR>', desc = "BufferPrevious", mode = "n"},
    {'<A-l>', '<Cmd>BufferNext<CR>', desc = "BufferNext", mode = "n"},
    -- Re-order to previous/next
    {'<A-<>', '<Cmd>BufferMovePrevious<CR>', desc = "BufferMovePrevious", mode = "n"},
    {'<A->>', desc = "', '", mode = "n"}, -- ???
    -- Goto buffer in position...
    {'<A-1>', '<Cmd>BufferGoto 1<CR>', desc = "BufferGoto 1", mode = "n"},
    {'<A-2>', '<Cmd>BufferGoto 2<CR>', desc = "BufferGoto 2", mode = "n"},
    {'<A-3>', '<Cmd>BufferGoto 3<CR>', desc = "BufferGoto 3", mode = "n"},
    {'<A-4>', '<Cmd>BufferGoto 4<CR>', desc = "BufferGoto 4", mode = "n"},
    {'<A-5>', '<Cmd>BufferGoto 5<CR>', desc = "BufferGoto 5", mode = "n"},
    {'<A-6>', '<Cmd>BufferGoto 6<CR>', desc = "BufferGoto 6", mode = "n"},
    {'<A-7>', '<Cmd>BufferGoto 7<CR>', desc = "BufferGoto 7", mode = "n"},
    {'<A-8>', '<Cmd>BufferGoto 8<CR>', desc = "BufferGoto 8", mode = "n"},
    {'<A-9>', '<Cmd>BufferGoto 9<CR>', desc = "BufferGoto 9", mode = "n"},
    {'<A-0>', '<Cmd>BufferLast<CR>', desc = "BufferLast", mode = "n"},
    -- Pin/unpin buffer
    {'<A-p>', '<Cmd>BufferPin<CR>', desc = "BufferPin", mode = "n"},
    -- Close buffer
    {'<A-c>', '<Cmd>BufferClose<CR>', desc = "BufferClose", mode = "n"},
    -- Wipeout buffer
    --                 :BufferWipeout
    -- Close commands
    --                 :BufferCloseAllButCurrent
    --                 :BufferCloseAllButPinned
    --                 :BufferCloseAllButCurrentOrPinned
    --                 :BufferCloseBuffersLeft
    --                 :BufferCloseBuffersRight
    -- Magic buffer-picking mode
    {'<C-p>', '<Cmd>BufferPick<CR>', desc = "BufferPick", mode = "n"},
    -- Sort automatically by...
    {'<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', desc = "BufferOrderByBufferNumber", mode = "n"},
    {'<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', desc = "BufferOrderByDirectory", mode = "n"},
    {'<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', desc = "BufferOrderByLanguage", mode = "n"},
    {'<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', desc = "BufferOrderByWindowNumber", mode = "n"},

    -- Other:
    -- :BarbarEnable - enables barbar (enabled by default)
    -- :BarbarDisable - very bad command, should never be used
  },
}
