-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<M-,>", "<c-w>5<", { desc = "Decrease split window width" }) -- decrease split window width
keymap.set("n", "<M-.>", "<c-w>5>", { desc = "Increase split window width" }) -- increase split window width
keymap.set("n", "<M-t>", "<C-W>+", { desc = "Increase split window height" }) -- increase split window height
keymap.set("n", "<M-b>", "<C-W>-", { desc = "Decrease split window height" }) -- decrease split window height

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- remaps with centering
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
-- keymap.set("n", "<C-d>", "M<C-d>")
-- keymap.set("n", "<C-u>", "M<C-u>")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')
keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Terminal
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
