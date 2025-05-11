return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    indent = { enabled = true },
    image = { enabled = true },
    input = {
      enabled = true,
      win = {
        row = 5,
      },
    },
    notifier = { enabled = true },
    dashboard = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    scroll = { enabled = false },
    lazygit = { enabled = true },
    gitbrowse = { enabled = true },
  },
  keys = {
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },

    { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },

    { "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal"},
    { "<c-_>", function() Snacks.terminal() end, desc = "which_key_ignore" },

    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    { "<leader>dps", function() Snacks.profiler.scratch() end, desc = "Profiler Scratch Buffer" },

    -- Telescope
		{ "<leader>ff", function () Snacks.picker.files() end, desc = "Fuzzy find files in cwd" },
		{ "<leader>fc", function () Snacks.picker.grep_word() end, desc = "Find string under cursor in cwd" },
		{ "<leader>fb", function () Snacks.picker.buffers() end, desc = "Open buffers" },
		{ "<leader>fu", function () Snacks.picker.undo() end, desc = "Open undo list" },
		{ "<leader>/", function () Snacks.picker.grep() end, desc = "Find string in cwd" },
		{ "<leader>vh", function () Snacks.picker.help() end, desc = "Help tags" },
    { "<leader>sh", function () Snacks.notifier.show_history() end, desc = "Show notifier history" },
  },
}
