return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",  -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		opts = {},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
		init = function()
			vim.g.barbar_auto_setup = false

			-- Move to previous/next
			Nmap("<leader>h", "<Cmd>BufferPrevious<CR>")
			Nmap("<leader>l", "<Cmd>BufferNext<CR>")

			-- Re-order to previous/next
			Nmap("<leader><", "<Cmd>BufferMovePrevious<CR>")
			Nmap("<leader>>", "<Cmd>BufferMoveNext<CR>")

			-- Close buffer
			Nmap("<leader>x", "<Cmd>BufferClose<CR>")
			Nmap("<leader>X", "<Cmd>BufferClose!<CR>")
		end,
	},
}
