return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
		},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
					-- additional_vim_regex_highlighting = "typescript",
          -- disable = function (_, bufnr)
          --   local buf_name = vim.api.nvim_buf_get_name(bufnr)
          --   local file_size = vim.fn.getfsize(buf_name)
          --   return file_size > 256 * 1024
          -- end,
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = {
					enable = true,
				},
				-- ensure these language parsers are installed
				ensure_installed = {
          "c",
          "diff",
					"json",
          "jsonc",
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
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
				-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
        require('ts_context_commentstring').setup {}
			})
		end,
	},
}
