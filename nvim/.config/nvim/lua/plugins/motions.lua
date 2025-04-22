return {
	{ "b4winckler/vim-angry" },
	{ "kana/vim-textobj-user" },
	{ "inside/vim-textobj-jsxattr", dependencies = { "kana/vim-textobj-user" } },
	{ "kana/vim-textobj-line", dependencies = { "kana/vim-textobj-user" } },
	{ "D4KU/vim-textobj-chainmember", dependencies = { "kana/vim-textobj-user" } },
	{
		"bkad/CamelCaseMotion",
		init = function()
			vim.g.camelcasemotion_key = "<leader>"
		end,
	},
	{
		"andrewradev/sideways.vim",
		init = function()
			local keymap = vim.keymap.set
			keymap("n", "<leader>sl", "<cmd>SidewaysLeft<CR>")
			keymap("n", "<leader>sr", "<cmd>SidewaysRight<CR>")
			keymap("n", "<leader>si", "<Plug>SidewaysArgumentInsertBefore")
			keymap("n", "<leader>sa", "<Plug>SidewaysArgumentAppendAfter")
			keymap("n", "<leader>sI", "<Plug>SidewaysArgumentInsertFirst")
			keymap("n", "<leader>sA", "<Plug>SidewaysArgumentAppendLast")
		end,
	},
}
