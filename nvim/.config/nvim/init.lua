require('plugins')

vim.g.mapleader = ','

function map(mode, k, cmd)
  vim.api.nvim_set_keymap(mode, k, cmd, { noremap = true, silent = true })
end

function nmap(k, cmd)
  map('n', k, cmd)
end

function imap(k, cmd)
  map('i', k, cmd)
end

function vmap(k, cmd)
  map('v', k, cmd)
end

require('display')
require('navigation')
require('search')

vim.cmd('ca tn tabnew')

vim.api.nvim_create_user_command(
  'FixTabs',
  function ()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    vim.cmd('%retab!')
  end,
  {}
)
