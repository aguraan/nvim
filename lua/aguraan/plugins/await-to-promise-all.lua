return {
  "aguraan/await_to_promise_all.nvim",
  lazy = true,
  cmd = { "AwaitToPromiseAll" },
  keys = {
    { "<leader>pa", ":'<,'>AwaitToPromiseAll<CR>", mode = "v", desc = "Convert awaits to Promise.all" },
  },
  config = function()
    require("await_to_promise_all").setup()
  end,
}
