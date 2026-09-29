local biome = { "biome", "prettierd", "prettier", stop_after_first = true }

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
				html = biome,
				json = biome,
				javascript = biome,
				javascriptreact = biome,
				typescript = biome,
				typescriptreact = biome,
				css = biome,
			},
			formatters = {
				biome = {
					condition = function(self, ctx)
						return vim.fs.root(ctx.dirname, { "biome.json" }) ~= nil
					end,
				},
				prettierd = {
					-- ONLY consider prettierd "available" if a Prettier config file exists
					condition = function(self, ctx)
						return vim.fs.root(ctx.dirname, {
							".prettierrc",
							".prettierrc.json",
							".prettierrc.js",
							"prettier.config.js",
						}) ~= nil
					end,
				},
			},
		},
	},
	{ "windwp/nvim-ts-autotag", opts = {} },
	{ "nvim-mini/mini.pairs", opts = {}, version = false },
}
