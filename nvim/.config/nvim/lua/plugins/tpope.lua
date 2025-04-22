return {
	{ "tpope/vim-sleuth" },
	{ "tpope/vim-repeat" },
	{
		"tpope/vim-fugitive",
		init = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		end,
	},
	{ "tpope/vim-surround" },
	{ "tpope/vim-commentary" },
	{ "tpope/vim-eunuch" },
}
