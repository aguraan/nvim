return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    indent = { enabled = false },
    input = { enabled = true },
    notifier = { enabled = true },
    dashboard = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    scroll = { enabled = false },
  },
  keys = {
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    { "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal"},
    { "<c-_>", function() Snacks.terminal() end, desc = "which_key_ignore" },
  },
}
