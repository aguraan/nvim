return {
	"kevalin/mermaid.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("mermaid").setup({
      preview = {
        renderer = "beautiful-mermaid",
        theme = "tokyo-night",
      }
    })

		-- Install the Tree-sitter parser:
		-- :TSInstall mermaid
	end,
}
