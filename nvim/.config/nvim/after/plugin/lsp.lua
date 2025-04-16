vim.api.nvim_create_autocmd("LspAttach", {
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

local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities =
  vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

require("mason").setup({})
require("mason-lspconfig").setup({
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end,
  },
})

local cmp = require("cmp")

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
