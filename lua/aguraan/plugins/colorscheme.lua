return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("tokyonight").setup({
				transparent = false,
				light_style = "day", -- The theme is used when the background is set to light
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
				style = "night",
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
				day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
				dim_inactive = false, -- dims inactive windows
				lualine_bold = true,
				cache = true,
				on_colors = function(colors) end,
				on_highlights = function(highlights, colors) end,
				plugins = {
					-- enable all plugins when not using lazy.nvim
					-- set to false to manually enable/disable plugins
					all = package.loaded.lazy == nil,
					-- uses your plugin manager to automatically enable needed plugins
					-- currently only lazy.nvim is supported
					auto = true,
					-- add any plugins here that you want to enable
					-- for all possible plugins, see:
					--   * https://github.com/folke/tokyonight.nvim/tree/main/lua/tokyonight/groups
					-- telescope = true,
				},
			})
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	-- {
	-- 	"neanias/everforest-nvim",
	-- 	priority = 1000,
	-- 	version = false,
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("everforest").setup({
	-- 			style = "hard",
	-- 			-- transparent = false,
	-- 			-- italic = false,
	-- 			-- undercurl = true,
	-- 			-- hide_inactive_statusline = true,
	-- 			-- dark_sidebar = true,
	-- 			-- sidebars = { "qf", "vista_kind", "terminal", "packer" },
	-- 		})
	-- 		vim.cmd([[colorscheme everforest]])
	-- 	end,
	-- },
	-- {
	--   "Mofiqul/vscode.nvim",
	--   priority = 1000,
	--   config = function()
	--     require("vscode").setup()
	--
	--     vim.cmd([[colorscheme vscode]])
	--   end,
	-- }
}
