local keymap = vim.keymap.set

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.hlsearch = true
keymap({ 'n', 'v' }, '/', '/\\v', { silent = true })
nmap('<leader>f', '/\\v<C-r><C-w><cr>')
nmap('<leader><space>', ':noh<cr>')
nmap('<leader>m', ':%s/')
nmap('<leader>s', ':%s/<<C-r><C-w>>//c<left><left>')

-- Search for Git conflicts
nmap('<leader>cf', '/\\v<<<<cr>')

