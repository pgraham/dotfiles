vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.hlsearch = true
vim.keymap.set({ "n", "v" }, "/", "/\\v", { silent = true })
Nmap("<leader>f", "/\\v<C-r><C-w><cr>")
Nmap("<leader><space>", ":noh<cr>")
Nmap("<leader>m", ":%s/")
Nmap("<leader>s", ":%s/<<C-r><C-w>>//c<left><left>")

-- Search for Git conflicts
Nmap("<leader>cf", "/\\v<<<<cr>")
