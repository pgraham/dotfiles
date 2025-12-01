return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},

	-- Autocomplete
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},

	{ "rafamadriz/friendly-snippets" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		init = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
			})
		end,
	},

	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-nvim-lua" },

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		init = function()
			-- Reserve a space in the gutter
			-- This will avoid an annoying layout shift in the screen
			vim.opt.signcolumn = "yes"
		end,
		config = function()
			local lsp_defaults = require("lspconfig").util.default_config

			-- Add cmp_nvim_lsp capabilities settings to lspconfig
			-- This should be executed before you configure any language server
			lsp_defaults.capabilities =
				vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- LspAttach is where you enable features that only work
			-- if there is a language server active in the file
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }
					local optsSilent = { buffer = event.buf, silent = true }
					local keymap = vim.keymap.set

					keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
					keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
					keymap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
					keymap("n", "gr", "<cmd>Lspsaga finder<CR>", opts)
					keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
					keymap("n", "<leader>vws", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", opts)

					-- LSP Saga
					keymap("n", "gn", "<cmd>Lspsaga rename<CR>", opts)

					keymap({ "n", "v" }, "gA", "<cmd>Lspsaga code_action<CR>", optsSilent)
					keymap("n", "gf", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
					keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
					keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
					keymap("n", "[E", function()
						require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
					end, optsSilent)
					keymap("n", "]E", function()
						require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
					end, optsSilent)
				end,
			})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
