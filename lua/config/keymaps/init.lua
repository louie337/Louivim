-- Better buffer manipulations
vim.keymap.set("n", "<C-q>", ":q<cr>", { desc = "Close current buffer", silent = true })
vim.keymap.set("n", "<C-w>", ":w<cr>", { desc = "Save current buffer", silent = true })
vim.keymap.set("n", "<C-x>", ":x<cr>", { desc = "Save & close current buffer", silent = true })
-- NOTE: vim.keymap.set("n", "", ":nmap", { desc = "Show all current keymaps", silent = true })

-- Better up/down
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Plugin menus
vim.keymap.set("n", "<leader>Pl", "<cmd>:Lazy<cr>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>Pm", "<cmd>Mason<cr>", { desc = "Mason" })
vim.keymap.set("n", "<leader>Pa", "<cmd>Alpha<CR>", { desc = "Alpha" })

-- System clipboard related
vim.keymap.set("v", "<C-y>", '"+y', { desc = "[Y]ank to system clipboard" })
vim.keymap.set("v", "<C-p>", '"+p', { desc = "[P]aste to system clipboard" })
vim.keymap.set("n", "<C-y>", '"+y', { desc = "[Y]ank to system clipboard" })
vim.keymap.set("n", "<C-p>", '"+p', { desc = "[P]aste to system clipboard" })

-- Better yanking
vim.keymap.set("n", "yL", '^vg_y', { desc = "[Y]ank [L]ine without newline" })
