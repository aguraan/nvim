return {
	-- Make sure to set this up properly if you have lazy=true
	"MeanderingProgrammer/render-markdown.nvim",
	opts = {
		---@module 'render-markdown'
		---@type render.md.UserConfig
		file_types = { "markdown", "Avante" },
		heading = {
			setext = false,
		},
	},
	ft = { "markdown", "Avante" },
}
