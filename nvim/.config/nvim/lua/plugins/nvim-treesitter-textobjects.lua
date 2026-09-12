return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- Function definitions
				["af"] = "@function.outer",
				["if"] = "@function.inner",

				-- Function calls (invocations)
				["ac"] = "@call.outer",
				["ic"] = "@call.inner",

				-- Method/Function parameters (arguments)
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",

				-- JSX/TSX attributes parameters (arguments)
				["ax"] = "@attribute.outer",
				["ix"] = "@attribute.inner",
			},
		},
		-- 2. SWAP MODE (Replaces andrewradev/sideways.vim)
		-- Move your arguments left and right with leader controls
		swap = {
			enable = true,
			swap_next = {
				["<leader>sl"] = "@parameter.inner", -- Swaps current argument with next
			},
			swap_previous = {
				["<leader>sr"] = "@parameter.inner", -- Swaps current argument with previous
			},
		},
	},
}
