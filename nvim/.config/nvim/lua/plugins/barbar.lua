return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
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

			-- Goto buffer in position...
			Nmap("<leader>b1", "<Cmd>BufferGoto 1<CR>")
			Nmap("<leader>b2", "<Cmd>BufferGoto 2<CR>")
			Nmap("<leader>b3", "<Cmd>BufferGoto 3<CR>")
			Nmap("<leader>b4", "<Cmd>BufferGoto 4<CR>")
			Nmap("<leader>b5", "<Cmd>BufferGoto 5<CR>")
			Nmap("<leader>b6", "<Cmd>BufferGoto 6<CR>")
			Nmap("<leader>b7", "<Cmd>BufferGoto 7<CR>")
			Nmap("<leader>b8", "<Cmd>BufferGoto 8<CR>")
			Nmap("<leader>b9", "<Cmd>BufferGoto 9<CR>")
			Nmap("<leader>b0", "<Cmd>BufferLast<CR>")
			-- Pin/unpin buffer
			Nmap("<leader>by", "<Cmd>BufferPin<CR>")
			-- Close buffer
			Nmap("<leader>x", "<Cmd>BufferClose<CR>")
			-- Wipeout buffer
			--                 :BufferWipeout
			-- Close commands
			--                 :BufferCloseAllButCurrent
			--                 :BufferCloseAllButPinned
			--                 :BufferCloseAllButCurrentOrPinned
			--                 :BufferCloseBuffersLeft
			--                 :BufferCloseBuffersRight
			--
			-- Magic buffer-picking mode
			Nmap("<leader>bp", "<Cmd>BufferPick<CR>")

			-- Sort automatically by...
			Nmap("<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>")
			Nmap("<leader>bd", "<Cmd>BufferOrderByDirectory<CR>")
			Nmap("<leader>bl", "<Cmd>BufferOrderByLanguage<CR>")
			Nmap("<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>")
		end,
	},
}
