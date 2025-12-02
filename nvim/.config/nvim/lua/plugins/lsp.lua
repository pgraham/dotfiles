return {
	-- LSP
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		lazy = false,
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},

	-- Autocomplete
	{ "rafamadriz/friendly-snippets" },
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},
	{ "nvim-mini/mini.icons", version = false, opts = {} },
	{ "nvim-mini/mini.snippets", version = false, opts = {} },
	{ "nvim-mini/mini.completion", version = false, opts = {} },
	{
		"nvimdev/lspsaga.nvim",
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
