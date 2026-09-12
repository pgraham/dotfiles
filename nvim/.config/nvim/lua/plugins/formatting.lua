local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
	-- Formatting
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 1000,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				html = prettier,
				json = prettier,
				javascript = prettier,
				javascriptreact = prettier,
				typescript = prettier,
				typescriptreact = prettier,
			},
		},
	},
	{ "windwp/nvim-ts-autotag", opts = {} },
	{ "nvim-mini/mini.pairs", opts = {}, version = false },
}
