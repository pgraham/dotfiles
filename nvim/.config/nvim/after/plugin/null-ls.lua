require('null-ls').setup {
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()')
    end
  end
}
