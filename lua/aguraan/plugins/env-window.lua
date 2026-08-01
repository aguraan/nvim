return {
  -- dir = "~/Projects/nvim_plugins/env_window.nvim",
  "aguraan/env_window.nvim",
  lazy = true,
  cmd = { "EnvWindow" },
  keys = {
    -- { "<leader>we", ":EnvWindow<CR>", desc = "Open .env file in floating window if it exists in cwd" },
    { "<leader>'", ":EnvWindow<CR>", desc = "Open .env file in floating window if it exists in cwd" },
  },
  config = function()
    require("env_window").setup()
  end,
}
