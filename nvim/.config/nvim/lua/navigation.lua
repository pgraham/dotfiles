
-- Mappings for tab navigation
nmap('<leader>h', 'gT')
nmap('<leader>l', 'gt')

-- A couple of mappings to complement ZZ and ZQ
--
--  -  ZA  -->  Quit all
--  -  ZO  -->  Quit others
--
nmap('ZA', ':wqa<cr>')
nmap('ZO', ':tabo<cr>')

-- Use <tab> to jump between matching delimiters
nmap('<tab>', '%')
vmap('<tab>', '%')

-- Make movement keys respect softwrapping by default
nmap('j', 'gj')
nmap('k', 'gk')
nmap('$', 'g$')
nmap('0', 'g0')

nmap('gj', 'j')
nmap('gk', 'k')
nmap('g$', '$')
nmap('g0', '0')

-- Easier keys for quickly moving up and down files
nmap('J', '<c-d>')
nmap('K', '<c-u>')
nmap('<leader>J', 'J')
nmap('<leader>K', 'K')

-- Select pasted text
vim.cmd('nnoremap <expr> gp \'`[\' . strpart(getregtype(), 0, 1) . \'`]\'')

-- Replace current line with buffer - line-wise op
-- After op, replaced line will be in buffer
nmap('<leader>rp', 'pkdd')

-- Prevent accidentally pressing F1 from opening help. Open help with :help
imap('<F1>', '<esc>')
nmap('<F1>', '<esc>')
vmap('<F1>', '<esc>')

-- Quickly exit insert mode
imap('jk', '<esc>:w<cr>')

-- Map semicolon to colon to avoid extra <shift> press to enter cmdline mode.
-- Original semicolon functionality is preserved by mapping to colon
nmap(';', ':')
vmap(';', ':')
nmap(':', ';')
vmap(':', ';')


