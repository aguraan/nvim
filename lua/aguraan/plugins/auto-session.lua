return {
	"rmagatti/auto-session",
  lazy = false,
	keys = {
		{ "<leader>wr", "<cmd>SessionRestore<CR>", desc = "Restore session for cwd" }, -- restore last workspace session for current directory
		{ "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session for auto session root dir" }, -- save workspace session for current working directory
	},
	opts = {
		auto_restore = false,
		suppressed_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/" },
	},
}
