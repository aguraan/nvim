return {
	"rmagatti/auto-session",
  lazy = false,
	keys = {
		{ "<leader>wr", "<cmd>AutoSession restore<CR>", desc = "Restore session for cwd" }, -- restore last workspace session for current directory
		{ "<leader>wf", "<cmd>AutoSession search<CR>", desc = "Search sessions" },
		{ "<leader>ws", "<cmd>AutoSession save<CR>", desc = "Save session for auto session root dir" }, -- save workspace session for current working directory
	},
	opts = {
		auto_restore = false,
		suppressed_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/" },
    session_lens = {
      picker = nil, -- "telescope"|"snacks"|"fzf"|"select"|nil Pickers are detected automatically but you can also manually choose one. Falls back to vim.ui.select
    },
	},
}
