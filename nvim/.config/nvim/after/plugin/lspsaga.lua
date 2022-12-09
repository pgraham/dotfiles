local saga = require('lspsaga')
local keymap = vim.keymap.set

saga.init_lsp_saga()

nmap('gh', '<cmd>Lspsaga lsp_finder<CR>')
nmap('gr', '<cmd>Lspsaga rename<CR>')
nmap('<leader>d', '<cmd>Lspsaga hover_doc<CR>')
keymap({'n','v'}, '<leader>ca', '<cmd>Lspsaga code_action<CR>', { silent = true })
nmap('<leader>cd', '<cmd>Lspsaga show_line_diaglostics<CR>')
nmap('[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
nmap(']e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
keymap(
  'n',
  '[E',
  function()
    require('lspsaga.diagnostic')
      .goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end,
  { silent = true }
)
keymap(
  'n',
  ']E',
  function()
    require('lspsaga.diagnostic')
      .goto_next({ severity = vim.diagnostic.severity.ERROR })
  end,
  { silent = true }
)
