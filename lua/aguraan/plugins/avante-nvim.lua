return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
	opts = {
		provider = "openai",
		openai = {
      -- Models Aliases:
      -- - gpt-4o
      -- - chatgpt-4o-latest
      -- - gpt-4o-mini
      -- - o1
      -- - o1-mini
      -- - o3-mini
      -- - o1-preview
      -- - gpt-4o-realtime-preview
      -- - gpt-4o-mini-realtime-preview
      -- - gpt-4o-audio-preview
			model = "gpt-4o-mini",
		},
		hints = { enabled = false },
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
				latex = { enabled = false },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
