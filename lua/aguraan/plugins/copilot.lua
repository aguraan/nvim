return {
	-- "github/copilot.vim",
	"zbirenbaum/copilot.lua", -- for providers='copilot'
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			should_attach = function(_, bufname)
				if string.match(bufname, "^%.env.*") or string.match(bufname, "notes") then
					return false
				end
				return true
			end,
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<Tab>",
				},
			},
		})
	end,
}
