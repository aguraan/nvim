local parsers = {
	"c",
	"diff",
	"json",
	"jsdoc",
	"javascript",
	"typescript",
	"tsx",
	"yaml",
	"html",
	"css",
	"prisma",
	"markdown",
	"markdown_inline",
	"graphql",
	"bash",
	"printf",
	"lua",
	"luadoc",
	"luap",
	"vim",
	"vimdoc",
	"dockerfile",
	"gitignore",
	"go",
	"toml",
	"xml",
	"regex",
	"latex",
	"scss",
	"svelte",
	"typst",
	"vue",
  "sql",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")
			treesitter.setup()
			treesitter.install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
				callback = function(event)
					if pcall(vim.treesitter.start, event.buf) then
						vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})

			-- Neovim 0.12 provides incremental selection natively through `an` and `in`.
			vim.keymap.set("n", "<C-space>", "van", { remap = true, desc = "Start node selection" })
			vim.keymap.set("x", "<C-space>", "an", { remap = true, desc = "Expand node selection" })
			vim.keymap.set("x", "<BS>", "in", { remap = true, desc = "Shrink node selection" })
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = true,
	},
}
