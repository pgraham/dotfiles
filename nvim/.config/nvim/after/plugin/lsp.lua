local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()

local null_ls = require("null-ls")
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup {
	on_attach = function(client, bufnr)
		null_opts.on_attach(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_create_autocmd("BufWritePre", {
				desc = "Auto format before save",
				pattern = "<buffer>",
				callback = function() vim.lsp.buf.format({ async = false }) end
			})
		end
	end,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.gofmt
	},
}

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on(
	"confirm_done",
	cmp_autopairs.on_confirm_done()
)

-- vim.cmd('autocmd BufWritePre *.go LspZeroFormat!')
-- vim.cmd('autocmd BufWritePre *.ts LspZeroFormat!')
