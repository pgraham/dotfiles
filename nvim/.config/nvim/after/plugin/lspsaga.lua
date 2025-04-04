local saga = require('lspsaga')
local keymap = vim.keymap.set

saga.setup({})

nmap('gh', '<cmd>Lspsaga finder<CR>')
nmap('gr', '<cmd>Lspsaga rename<CR>')
nmap('<leader>gd', '<cmd>Lspsaga hover_doc<CR>')
keymap({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', { silent = true })
nmap('<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>')
nmap('[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
nmap(']e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
keymap('n', '[E', function()
  require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap('n', ']E', function()
  require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
