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

-- tmux navigation
-- keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Navigate left tmux pane" })
-- keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Navigate down tmux pane" })
-- keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Navigate up tmux pane" })
-- keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Navigate right tmux pane" })

-- remaps with centering
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')
keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Gitsigns
keymap.set("n", "<leader>gs", ":<C-U>Gitsigns<CR>", { desc = "Toggle Gitsigns" })
keymap.set("n", "<leader>gh", ":<C-U>Gitsigns preview_hunk<CR>", { desc = "Preview Gitsigns hunk" })
keymap.set("n", "<leader>]h", ":<C-U>Gitsigns next_hunk<CR>", { desc = "Next Gitsigns hunk" })
keymap.set("n", "<leader>[h", ":<C-U>Gitsigns prev_hunk<CR>", { desc = "Previous Gitsigns hunk" })

-- Cloak
keymap.set("n", "<leader>sl", ":<C-U>CloakPreviewLine<CR>", { desc = "Preview Cloak line" })

-- Terminal
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
