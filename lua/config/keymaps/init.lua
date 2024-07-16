-- Better buffer manipulations
-- vim.keymap.set("n", "<C-q>", ":q<cr>", { desc = "Close current buffer", silent = true })
-- vim.keymap.set("n", "<C-w>", ":w<cr>", { desc = "Save current buffer", silent = true })
-- vim.keymap.set("n", "<C-x>", ":x<cr>", { desc = "Save & close current buffer", silent = true })
-- vim.keymap.set("n", "", ":nmap", { desc = "Show all current keymaps", silent = true })

-- Base setup
vim.keymap.set("n", "<leader>ln", "<CMD>set rnu!<CR>", { desc = "[L]ine [N]number" })
vim.keymap.set("n", "<leader>n", "<CMD>nohls<CR>", { desc = "[N]o Highlight" })

-- Better up/down
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Better buffer
vim.keymap.set("n", "<leader>bp", "<CMD>bprevious<CR>", { desc = "[P]revious buffer" })
vim.keymap.set("n", "<leader>bn", "<CMD>bnext<CR>", { desc = "[N]ext buffer" })
vim.keymap.set("n", "<leader>;", "<CMD>b#<CR>", { desc = "Go to last buffer" })
vim.keymap.set("n", "<leader>bd", "<CMD>bd<CR>", { desc = "[D]elete buffer" })
vim.keymap.set("n", "<leader>bD", "<CMD>%bd|e#|bd#<CR>", { desc = "[D]elete all buffer but current one" })

-- Better tab
-- vim.keymap.set("n", "<C-=>", "<CMD>tabnew<CR>", { desc = "Create new tab" }) -- Create empty tab
vim.keymap.set("n", "<C-w>t", "<C-w>v<C-w>T", { desc = "Create new [T]ab" }) -- Create tab with existing buffer
vim.keymap.set("n", "<C-w>[", "<CMD>tabprevious<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<C-w>]", "<CMD>tabnext<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<C-w>{", "<CMD>:-tabmove<CR>", { desc = "Move tab to left" })
vim.keymap.set("n", "<C-w>}", "<CMD>:+tabmove<CR>", { desc = "Move tab to right" })
vim.keymap.set("n", "<C-w>Q", "<CMD>tabclose<CR>", { desc = "[Q]uit current tab" })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Better window
vim.keymap.set("n", "<C-q>", "<C-w>q", { desc = "[Q]uit current window" })

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Gitsigns
vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "[G]itsigns [P]review hunk" })
vim.keymap.set(
	"n",
	"]c",
	"&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'",
	{ expr = true },
	{ desc = "[G]itsigns next hunk" }
)
vim.keymap.set(
	"n",
	"[c",
	"&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'",
	{ expr = true },
	{ desc = "[G]itsigns previous hunk" }
)

-- Better yanking
vim.keymap.set("n", "yL", "^vg_y", { desc = "[Y]ank [L]ine without newline" })
vim.keymap.set("n", "dL", "^vg_d", { desc = "[D]elete [L]ine without newline" })

-- Custom keymap scripts
vim.keymap.set("n", "<leader>Cj", 'yiwiconsole.log("<ESC>ea", )<ESC>P', { desc = "[C]ustom copy with [J]avaScript" })
vim.keymap.set("n", "<leader>Cp", 'yiwiprint("<ESC>ea", )<ESC>P', { desc = "[C]ustom copy with [P]ython" })
