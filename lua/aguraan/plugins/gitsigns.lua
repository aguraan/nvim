return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>gs", "<cmd>Gitsigns<CR>", desc = "Gitsigns" },
    { "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview Gitsigns hunk" },
    { "]h", "<cmd>Gitsigns next_hunk<CR>", desc = "Next Gitsigns hunk" },
    { "[h", "<cmd>Gitsigns prev_hunk<CR>", desc = "Previous Gitsigns hunk" },
  },
  config = true,
}
