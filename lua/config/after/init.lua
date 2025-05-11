-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

luasnip.config.setup({})
require("luasnip.loaders.from_vscode").lazy_load()

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
        }),
        ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ count = 2 })
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = {
        { name = "copilot", group_index = 2 },
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            max_width = 50,
            symbol_map = {
                Copilot = "",
            },
        }),
    },
})

-- treesitter
vim.treesitter.language.register("markdown", "mdx")

-- Plugin menus

-- Lazygit
vim.keymap.set("n", "<leader>lzg", "<CMD>LazyGit<CR>", { desc = "[L]a[Z]y [G]it" })
vim.keymap.set("n", "<leader>lzc", "<CMD>LazyGitConfig<CR>", { desc = "[L]a[Z]y Git [C]onfig" })

-- Spectre setup
vim.keymap.set("n", "<leader>sr", '<CMD>lua require("spectre").open()<CR>', { desc = "[S]earch & [R]eplace" })

-- Diffview setup
vim.keymap.set("n", "<leader>do", "<CMD>DiffviewOpen origin/HEAD..HEAD<CR>", { desc = "[D]iffview [O]pen" })
vim.keymap.set("n", "<leader>dh", "<CMD>DiffviewFileHistory %<CR>", { desc = "[D]iffview [H]istory" })
vim.keymap.set("n", "<leader>dc", "<CMD>DiffviewClose<CR>", { desc = "[D]iffview [C]lose" })
vim.keymap.set("n", "<leader>dt", "<CMD>DiffviewToggleFiles<CR>", { desc = "[D]iffview [T]oggle Files" })
vim.keymap.set("n", "<leader>df", "<CMD>DiffviewFocusFiles<CR>", { desc = "[D]iffview [F]ocus Files" })
vim.keymap.set("n", "<leader>dr", "<CMD>DiffviewRefresh<CR>", { desc = "[D]iffview [R]efresh" })
vim.keymap.set("v", "<leader>dr", "<Esc><CMD>'<,'>DiffviewFileHistory --follow<CR>", { desc = "[D]iffview [R]ange" })

-- Lazy vim
vim.keymap.set("n", "<leader>lv", "<CMD>:Lazy<CR>", { desc = "[L]azy [V]im" })

-- Mason
vim.keymap.set("n", "<leader>pm", "<CMD>Mason<CR>", { desc = "[M]ason" })

-- Alpha
vim.keymap.set("n", "<leader>pa", "<CMD>Alpha<CR>", { desc = "[A]lpha" })

-- NOTES: Plugin setup

-- vim-smoothie setup
-- vim.g.smoothie_update_interval = ??
vim.g.smoothie_base_speed = 2000

-- which-key setup
local wk = require("which-key")
local modes = { "n", "v", "i", "s" }
wk.add({
    { "<leader>a", group = "+[A]vante", mode = modes, icon = "" },
    { "<leader>b", group = "+[B]uffer", mode = modes },
    { "<leader>C", group = "+[C]opilot Chat", mode = modes, icon = "" },
    { "<leader>c", group = "+[C]ode/ [Copilot]", mode = modes, icon = "" },
    { "<leader>d", group = "+[D]ocument/ [D]iffvew", mode = modes },
    { "<leader>r", group = "+[R]ename ", mode = modes },
    { "<leader>w", group = "+[W]orkspace", mode = modes },
    { "<leader>x", group = "+Trouble [X]", mode = modes },
    { "<leader>p", group = "+[P]rint", mode = modes },
    { "<leader>s", group = "+[S]earch", mode = modes },
    { "<leader>K", group = "+[C]ase Change", mode = modes },
    { "<leader>g", group = "+[G]ptPrompt", mode = modes, icon = "" },
})
