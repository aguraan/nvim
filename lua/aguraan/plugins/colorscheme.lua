return {
	-- {
	--   "bluz71/vim-nightfly-guicolors",
	--   priority = 1000, -- make sure to load this before all the other start plugins
	--   config = function()
	--     -- load the colorscheme here
	--     vim.cmd([[colorscheme nightfly]])
	--   end,
	-- },
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- local bg = "#011628"
			-- local bg_dark = "#011423"
			-- local bg_highlight = "#143652"
			-- local bg_search = "#0A64AC"
			-- local bg_visual = "#275378"
			-- local fg = "#CBE0F0"
			-- local fg_dark = "#B4D0E9"
			-- local fg_gutter = "#627E97"
			-- local border = "#547998"
			--
			require("tokyonight").setup({
				style = "night",
        styles = {
          floats = "transparent",
        },
        lualine_bold = true,
			-- 	on_colors = function(colors)
			-- 		colors.bg = bg
			-- 		colors.bg_dark = bg_dark
			-- 		colors.bg_float = bg_dark
			-- 		colors.bg_highlight = bg_highlight
			-- 		colors.bg_popup = bg_dark
			-- 		colors.bg_search = bg_search
			-- 		colors.bg_sidebar = bg_dark
			-- 		colors.bg_statusline = bg_dark
			-- 		colors.bg_visual = bg_visual
			-- 		colors.border = border
			-- 		colors.fg = fg
			-- 		colors.fg_dark = fg_dark
			-- 		colors.fg_float = fg
			-- 		colors.fg_gutter = fg_gutter
			-- 		colors.fg_sidebar = fg_dark
      -- end,
			})
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	-- {
	-- 	"askfiy/visual_studio_code",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme visual_studio_code]])
	--
	-- 		vim.cmd([[hi @keyword.return.typescript guifg=#cc81a9]])
	-- 		vim.cmd([[hi @keyword.coroutine.typescript guifg=#cc81a9]])
	-- 		vim.cmd([[hi @keyword.typescript guifg=#cc81a9]])
	-- 		vim.cmd([[hi @keyword.operator.typescript guifg=#cc81a9]])
	--
	-- 		vim.cmd([[hi @include.typescript guifg=#cc81a9]])
	-- 		vim.cmd([[hi @conditional.typescript guifg=#cc81a9]])
	-- 		vim.cmd([[hi @exception.typescript guifg=#cc81a9]])
	-- 		vim.cmd([[hi @repeat.typescript guifg=#cc81a9]])
	-- 		vim.cmd([[hi @attribute.typescript guifg=#dcdcaa]])
	-- 		vim.cmd([[hi @constructor.typescript guifg=#418ed0]])
	-- 		vim.cmd([[hi @variable.typescript guifg=#8adefb]])
	-- 		vim.cmd([[hi @type.typescript guifg=#4ec9b0]])
	-- 		vim.cmd([[hi @type.builtin.typescript guifg=#4ec9b0]])
	-- 		vim.cmd([[hi @property.typescript guifg=#8adefb]])
	--
	-- 		vim.cmd([[hi @lsp.type.class.typescript guifg=#4ec9b0]])
	-- 		vim.cmd([[hi @lsp.type.property.typescript guifg=#8adefb]])
	-- 		vim.cmd([[hi @lsp.type.interface.typescript guifg=#4ec9b0]])
	-- 		vim.cmd([[hi @lsp.mod.readonly.typescript guifg=#00c5e7]])
	-- 		vim.cmd([[hi @lsp.type.variable.typescript guifg=#8adefb]])
	-- 		vim.cmd([[hi @lsp.type.parameter.typescript guifg=#8adefb]])
	-- 		vim.cmd([[hi @lsp.type.function.typescript guifg=#dcdcaa]])
	-- 		vim.cmd([[hi @lsp.mod.async.typescript guifg=#dcdcaa]])
	-- 		vim.cmd([[hi @lsp.type.member.typescript guifg=#dcdcaa]])
	-- 		vim.cmd([[hi @lsp.typemod.function.readonly.typescript guifg=#dcdcaa]])
	-- 		vim.cmd([[hi @lsp.type.enum.typescript guifg=#4ec9b0]])
	--
	--
	-- 		vim.cmd([[hi @keyword.return.tsx guifg=#cc81a9]])
	-- 		vim.cmd([[hi @keyword.coroutine.tsx guifg=#cc81a9]])
	-- 		vim.cmd([[hi @keyword.tsx guifg=#cc81a9]])
	-- 		vim.cmd([[hi @keyword.operator.tsx guifg=#cc81a9]])
	--
	-- 		vim.cmd([[hi @include.tsx guifg=#cc81a9]])
	-- 		vim.cmd([[hi @conditional.tsx guifg=#cc81a9]])
	-- 		vim.cmd([[hi @exception.tsx guifg=#cc81a9]])
	-- 		vim.cmd([[hi @repeat.tsx guifg=#cc81a9]])
	-- 		vim.cmd([[hi @attribute.tsx guifg=#dcdcaa]])
	-- 		vim.cmd([[hi @constructor.tsx guifg=#418ed0]])
	-- 		vim.cmd([[hi @variable.tsx guifg=#8adefb]])
	-- 		vim.cmd([[hi @type.tsx guifg=#4ec9b0]])
	-- 		vim.cmd([[hi @type.builtin.tsx guifg=#4ec9b0]])
	-- 		vim.cmd([[hi @property.tsx guifg=#8adefb]])
	--
	-- 		vim.cmd([[hi @lsp.type.class.typescriptreact guifg=#4ec9b0]])
	-- 		vim.cmd([[hi @lsp.type.property.typescriptreact guifg=#8adefb]])
	-- 		vim.cmd([[hi @lsp.type.interface.typescriptreact guifg=#4ec9b0]])
	-- 		vim.cmd([[hi @lsp.mod.readonly.typescriptreact guifg=#00c5e7]])
	-- 		vim.cmd([[hi @lsp.type.variable.typescriptreact guifg=#8adefb]])
	-- 		vim.cmd([[hi @lsp.type.parameter.typescriptreact guifg=#8adefb]])
	-- 		vim.cmd([[hi @lsp.type.function.typescriptreact guifg=#dcdcaa]])
	-- 		vim.cmd([[hi @lsp.mod.async.typescriptreact guifg=#dcdcaa]])
	-- 		vim.cmd([[hi @lsp.type.member.typescriptreact guifg=#dcdcaa]])
	-- 		vim.cmd([[hi @lsp.typemod.function.readonly.typescriptreact guifg=#dcdcaa]])
	-- 		vim.cmd([[hi @lsp.type.enum.typescriptreact guifg=#4ec9b0]])
	-- 	end,
	-- },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function ()
  --     vim.cmd([[colorscheme catppuccin-mocha]])
  --   end
  -- }
}
