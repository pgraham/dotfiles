return {
	-- LSP
	{
		"mason-org/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			-- 1. Initialize Mason package manager
			require("mason").setup({ ui = { border = "rounded" } })

			-- 2. Let mason-lspconfig bridge the names and auto-enable them
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright" },
				automatic_enable = true, -- Tells Neovim to run vim.lsp.enable() natively
			})

			-- 3. Native 0.12 way to override specific server settings
			-- No more lspconfig.lua_ls.setup()!
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})
		end,
	},
}
