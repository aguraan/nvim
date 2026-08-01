return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local keymap = vim.keymap -- for conciseness

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				-- keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
				keymap.set("n", "gR", function()
					Snacks.picker.lsp_references()
				end, opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				-- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
				keymap.set("n", "gd", function()
					Snacks.picker.lsp_definitions()
				end, opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				-- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
				keymap.set("n", "gi", function()
					Snacks.picker.lsp_implementations()
				end, opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				-- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
				keymap.set("n", "gt", function()
					Snacks.picker.lsp_type_definitions()
				end, opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				-- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
				keymap.set("n", "<leader>D", function()
					Snacks.picker.diagnostics_buffer()
				end, opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", function()
					vim.diagnostic.jump({ count = -1 })
				end, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", function()
					vim.diagnostic.jump({ count = 1 })
				end, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.config("clangd", {
			filetypes = { "c", "cpp", "objc", "objcpp" },
		})

		vim.lsp.config("gopls", {
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_markers = { "go.work", "go.mod", ".git" },
		})

		vim.lsp.config("emmet_ls", {
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
		})

		vim.lsp.config("lua_ls", {
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim", "Snacks" },
					},
					completion = {
						callSnippet = "Replace",
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		vim.lsp.config("graphql", {
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})

		vim.lsp.config("solidity-language-server", {
			name = "Solidity Language Server",
			cmd = { "solidity-language-server", "--stdio" },
			filetypes = { "solidity" },
			root_markers = { "foundry.toml", ".git" },
			capabilities = {
				textDocument = {
					semanticTokens = {
						multilineTokenSupport = true,
					},
				},
				workspace = {
					fileOperations = {
						willCreate = true,
						didCreate = true,
						willRename = true,
						didRename = true,
						willDelete = true,
						didDelete = true,
					},
				},
			},
			settings = {
				["solidity-language-server"] = {
					inlayHints = {
						-- Show parameter name hints on function/event/struct calls.
						parameters = true,
						-- Show gas cost hints on functions annotated with
						-- `/// @custom:lsp-enable gas-estimates`.
						gasEstimates = true,
					},
					lint = {
						-- Master toggle for forge lint diagnostics.
						enabled = true,
						-- Filter lints by severity. Empty = all severities.
						-- Values: "high", "med", "low", "info", "gas", "code-size"
						severity = {},
						-- Run only specific lint rules by ID. Empty = all rules.
						-- Values: "incorrect-shift", "unchecked-call", "erc20-unchecked-transfer",
						--   "divide-before-multiply", "unsafe-typecast", "pascal-case-struct",
						--   "mixed-case-function", "mixed-case-variable", "screaming-snake-case-const",
						--   "screaming-snake-case-immutable", "unused-import", "unaliased-plain-import",
						--   "named-struct-fields", "unsafe-cheatcode", "asm-keccak256", "custom-errors",
						--   "unwrapped-modifier-logic"
						only = {},
						-- Suppress specific lint rule IDs from diagnostics.
						exclude = {},
					},
					fileOperations = {
						-- Auto-generate scaffold for new .sol files.
						-- Set to false to disable scaffold generation.
						templateOnCreate = true,
						-- Auto-update imports via workspace/willRenameFiles.
						updateImportsOnRename = true,
						-- Auto-remove imports via workspace/willDeleteFiles.
						updateImportsOnDelete = true,
					},
					projectIndex = {
						fullProjectScan = true,
						-- Persistent cache mode: "v2"
						cacheMode = "v2",
						-- Aggressive scoped dirty-sync: reindex only reverse-import affected files.
						-- Falls back to full reindex if scoped compile fails.
						incrementalEditReindex = false,
					},
				},
			},
			on_attach = function(client, bufnr)
				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

				-- autoformat
				vim.api.nvim_create_autocmd("BufWritePost", {
					callback = function()
						vim.lsp.buf.format()
					end,
				})

				-- completions autotrigger
				vim.lsp.completion.enable(true, client.id, bufnr, {
					autotrigger = true,
					convert = function(item)
						return { abbr = item.label:gsub("%b()", "") }
					end,
				})

				-- completion trigger list
				for _, char in ipairs({ "(", ",", "[" }) do
					vim.keymap.set("i", char, function()
						vim.api.nvim_feedkeys(char, "n", false)
						vim.defer_fn(vim.lsp.buf.signature_help, 50)
					end, { buffer = bufnr })
				end
			end,
		})
	end,
}
