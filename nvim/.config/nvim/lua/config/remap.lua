-- Open Netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Use <tab> to jump between matching delimiters
vim.keymap.set({ "n", "v" }, "<tab>", "%")

-- Make movement keys respect softwrapping by default
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "$", "g$")
vim.keymap.set("n", "0", "g0")

vim.keymap.set("n", "gj", "j")
vim.keymap.set("n", "gk", "k")
vim.keymap.set("n", "g$", "$")
vim.keymap.set("n", "g0", "0")

-- Quickly exit insert mode
vim.keymap.set("i", "jk", "<esc>:w<cr>")

-- Quickly exit visual mode
vim.keymap.set("v", "vv", "<esc>")

-- Map semicolon to colon to avoid extra <shift> press to enter cmdline mode.
-- Original semicolon functionality is preserved by mapping to colon
vim.keymap.set({ "n", "v" }, ";", ":")
vim.keymap.set({ "n", "v" }, ":", ";")

-- Select pasted text
vim.cmd("nnoremap <expr> <leader>vp '`[' . strpart(getregtype(), 0, 1) . '`]'")

-- Replace current line with buffer - line-wise op
-- After op, replaced line will be in buffer
vim.keymap.set("n", "<leader>rp", "pkdd")
-- After op, pasted line will be in buffer
vim.keymap.set("n", "<leader>p", [["_dP]])

-- Prevent accidentally pressing F1 from opening help. Open help with :help
vim.keymap.set({ "i", "n", "v" }, "<F1>", "<esc>")

-- Insert blank line without entering insert mode.
vim.keymap.set("n", "<cr>", "o<esc>")

-- Insert white-space without entering insert mode
--
--    <leader>sp    Insert space under cursor
--    <leader>Sp    Insert space after cursor
--    <leader>nl    Insert line break under cursor
--    <leader>Nl    Insert line break after cursor
vim.keymap.set("n", "<leader>sp", "i<space><esc>")
vim.keymap.set("n", "<leader>Sp", "a<space><esc>")
vim.keymap.set("n", "<leader>nl", "i<cr><esc>l")
vim.keymap.set("n", "<leader>Nl", "a<cr><esc>l")

-- Move highlighted lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep curson in middle when navigating search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to void register
vim.keymap.set("n", "<leader>d", [["_d]])
