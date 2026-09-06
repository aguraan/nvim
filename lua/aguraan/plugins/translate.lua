return {
	"niuiic/translate.nvim",
	dependencies = {
		{ "niuiic/omega.nvim", build = "cd rs && cargo build --release" },
	},
	config = function()
		local translate = require("translate")

		vim.keymap.set({ "v" }, "<leader>ts", function()
			translate.translate({
				get_command = function(input)
					return {
						"trans",
						"-e",
						"bing",
						"-b",
						":ru",
						input,
					}
				end,
				-- input | clipboard | selection
				input = "selection",
				-- open_float | notify | copy | insert | replace
				output = { "open_float" },
				resolve_result = function(result)
					if result.code ~= 0 then
						return nil
					end

					return string.match(result.stdout, "(.*)\n")
				end,
			})
		end, { desc = "Translate to RU" })
	end,
}
