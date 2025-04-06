return {
	"nvim-treesitter/nvim-treesitter-textobjects",
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
	config = function()
		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

		-- vim way: ; goes to the direction you were moving.
		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

		-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
		vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr)
		vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr)
		vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr)
		vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr)
	end,
}
