return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main", -- Ensure you are using the modern, stable branch
		build = ":TSUpdate",
		-- Using 'opts' automatically calls require("nvim-treesitter").setup(opts) under the hood
		opts = {
			-- Core parsers to keep explicitly installed
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"bash",
				"css",
				"javascript",
				"typescript",
				"json",
				"tsx",
				"sql",
				"html",
				"go",
			},

			-- Install parsers asynchronously in the background
			sync_install = false,

			-- Automatically download parsers for missing filetypes on demand
			auto_install = true,

			-- Handed off to native Neovim runtime engines
			highlight = {
				enable = true,
				-- Avoid fallback syntax highlighting unless working with highly niche file types
				additional_vim_regex_highlighting = false,
			},
		},
	},
}
