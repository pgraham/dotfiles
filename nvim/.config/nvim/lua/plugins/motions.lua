return {
	{ "kana/vim-textobj-user" },
	{ "kana/vim-textobj-line", dependencies = { "kana/vim-textobj-user" } },
	{ "vim-scripts/text-object-left-and-right" },
	{
		"bkad/CamelCaseMotion",
		init = function()
			vim.g.camelcasemotion_key = "<leader>"
		end,
	},
}
