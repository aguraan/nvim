return {
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("tokyonight").setup({
				style = "night",
        styles = {
          floats = "transparent",
        },
        lualine_bold = true,
			})
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
  -- {
  --   "neanias/everforest-nvim",
  --   priority = 1000,
  --   version = false,
  --   lazy = false,
  --   config = function()
  --     require("everforest").setup({
  --       style = "hard",
  --       -- transparent = false,
  --       -- italic = false,
  --       -- undercurl = true,
  --       -- hide_inactive_statusline = true,
  --       -- dark_sidebar = true,
  --       -- sidebars = { "qf", "vista_kind", "terminal", "packer" },
  --     })
  --     vim.cmd([[colorscheme everforest]])
  --   end,
  -- }
}
