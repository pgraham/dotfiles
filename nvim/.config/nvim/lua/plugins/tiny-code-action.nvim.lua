return {
	"rachartier/tiny-code-action.nvim",
	event = "LspAttach",
	opts = {
		backend = "vim",
		picker = "select",
	},
	keys = {
		{
			"<leader>ca",
			function()
				require("tiny-code-action").code_action()
			end,
			mode = { "n", "x" },
		},
	},
}
