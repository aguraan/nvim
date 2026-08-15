return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	lazy = false,
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = { lookahead = true },
			move = { set_jumps = true },
		})

		local select = require("nvim-treesitter-textobjects.select")
		local swap = require("nvim-treesitter-textobjects.swap")
		local move = require("nvim-treesitter-textobjects.move")
		local repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

		local selections = {
			["a="] = "@assignment.outer",
			["i="] = "@assignment.inner",
			["r="] = "@assignment.rhs",
			["a:"] = "@property.outer",
			["i:"] = "@property.inner",
			["r:"] = "@property.rhs",
			["aa"] = "@parameter.outer",
			["ia"] = "@parameter.inner",
			["ai"] = "@conditional.outer",
			["ii"] = "@conditional.inner",
			["al"] = "@loop.outer",
			["il"] = "@loop.inner",
			["af"] = "@call.outer",
			["if"] = "@call.inner",
			["am"] = "@function.outer",
			["im"] = "@function.inner",
			["ac"] = "@class.outer",
			["ic"] = "@class.inner",
		}
		for lhs, query in pairs(selections) do
			vim.keymap.set({ "x", "o" }, lhs, function()
				select.select_textobject(query, "textobjects")
			end, { desc = "Select " .. query })
		end

		local swaps = {
			["<leader>na"] = { "next", "@parameter.inner" },
			["<leader>pa"] = { "previous", "@parameter.inner" },
			["<leader>n:"] = { "next", "@property.outer" },
			["<leader>p:"] = { "previous", "@property.outer" },
			["<leader>nm"] = { "next", "@function.outer" },
			["<leader>pm"] = { "previous", "@function.outer" },
		}
		for lhs, spec in pairs(swaps) do
			vim.keymap.set("n", lhs, function()
				swap["swap_" .. spec[1]](spec[2])
			end, { desc = "Swap " .. spec[1] .. " " .. spec[2] })
		end

		local movements = {
			["f"] = "@call.outer",
			["m"] = "@function.outer",
			["c"] = "@class.outer",
			["i"] = "@conditional.outer",
			["l"] = "@loop.outer",
		}
		for suffix, query in pairs(movements) do
			vim.keymap.set({ "n", "x", "o" }, "]" .. suffix, function()
				move.goto_next_start(query, "textobjects")
			end, { desc = "Next " .. query .. " start" })
			vim.keymap.set({ "n", "x", "o" }, "]" .. suffix:upper(), function()
				move.goto_next_end(query, "textobjects")
			end, { desc = "Next " .. query .. " end" })
			vim.keymap.set({ "n", "x", "o" }, "[" .. suffix, function()
				move.goto_previous_start(query, "textobjects")
			end, { desc = "Previous " .. query .. " start" })
			vim.keymap.set({ "n", "x", "o" }, "[" .. suffix:upper(), function()
				move.goto_previous_end(query, "textobjects")
			end, { desc = "Previous " .. query .. " end" })
		end

		for lhs, spec in pairs({ ["]s"] = { "@local.scope", "locals" }, ["]z"] = { "@fold", "folds" } }) do
			vim.keymap.set({ "n", "x", "o" }, lhs, function()
				move.goto_next_start(spec[1], spec[2])
			end, { desc = "Next " .. spec[1] })
		end

		vim.keymap.set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move)
		vim.keymap.set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_opposite)
		vim.keymap.set({ "n", "x", "o" }, "f", repeat_move.builtin_f_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "F", repeat_move.builtin_F_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "t", repeat_move.builtin_t_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "T", repeat_move.builtin_T_expr, { expr = true })
	end,
}
