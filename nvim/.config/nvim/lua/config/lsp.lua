vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		-- Example: Set up buffer-local keybindings for LSP
		local opts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)

		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<cr>", opts)
		vim.keymap.set("n", "gn", "<cmd>Lspsaga rename<cr>", opts)
		vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<cr>", opts)
		vim.keymap.set("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
		vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
		vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
		vim.keymap.set("n", "[E", function()
			require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end, opts)
		vim.keymap.set("n", "]E", function()
			require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
		end, opts)
	end,
})
