vim.g.mapleader = ','
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Use <tab> to jump between matching delimiters
vim.keymap.set({ 'n', 'v' }, '<tab>', '%')

-- Make movement keys respect softwrapping by default
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '$', 'g$')
vim.keymap.set('n', '0', 'g0')

vim.keymap.set('n', 'gj', 'j')
vim.keymap.set('n', 'gk', 'k')
vim.keymap.set('n', 'g$', '$')
vim.keymap.set('n', 'g0', '0')

-- Easier keys for quickly moving up and down files
vim.keymap.set({ 'n', 'v' }, 'J', '<c-d>')
vim.keymap.set({ 'n', 'v' }, 'K', '<c-u>')
vim.keymap.set({ 'n', 'v' }, '<leader>J', 'J')
vim.keymap.set({ 'n', 'v' }, '<leader>K', 'K')

-- Quickly exit insert mode
vim.keymap.set('i', 'jk', '<esc>:w<cr>')

-- Map semicolon to colon to avoid extra <shift> press to enter cmdline mode.
-- Original semicolon functionality is preserved by mapping to colon
vim.keymap.set({ 'n', 'v' }, ';', ':')
vim.keymap.set({ 'n', 'v' }, ':', ';')

-- Select pasted text
vim.cmd('nnoremap <expr> gp \'`[\' . strpart(getregtype(), 0, 1) . \'`]\'')

-- Replace current line with buffer - line-wise op
-- After op, replaced line will be in buffer
vim.keymap.set('n', '<leader>rp', 'pkdd')
-- After op, patsted line will be in buffer
vim.keymap.set('n', '<leader>p', [["_dP]])

-- Prevent accidentally pressing F1 from opening help. Open help with :help
vim.keymap.set('i', '<F1>', '<esc>')
vim.keymap.set('n', '<F1>', '<esc>')
vim.keymap.set('v', '<F1>', '<esc>')

-- Insert blank line without entering insert mode.  Stay on current line
vim.keymap.set('n', '<cr>', 'o<esc>:w<cr>')

-- Insert line break without entering insert mode
--
--    <leader>nl    Insert line break under cursor
--    <leader>Nl    Insert line break after cursor
vim.keymap.set('n', '<leader>nl', 'i<cr><esc>l')
vim.keymap.set('n', '<leader>Nl', 'a<cr><esc>l')

-- Insert space without entering insert mode
--
--    <leader>sp    Insert space under cursor
--    <leader>Sp    Insert space after cursro
vim.keymap.set('n', '<leader>sp', 'i<space><esc>')
vim.keymap.set('n', '<leader>Sp', 'a<space><esc>')

-- Move highlighted lines up/down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- keep curson in middle when navigating search results
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Yank into system clipboard
vim.keymap.set('n', '<leader>y', [["+y]])
vim.keymap.set('v', '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- delete to void register
vim.keymap.set('n', '<leader>d', [["_d]])
