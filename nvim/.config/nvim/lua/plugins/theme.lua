function Coolourful(colour, bg)
	colour = colour or "gruvbox"
	bg = bg or "dark"

	vim.cmd.colorscheme(colour)
	vim.o.background = bg

	-- Clear background for transparency
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"ellisonleao/gruvbox.nvim",
		init = function()
			Coolourful()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = { theme = "gruvbox" },
		},
	},
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{ "lewis6991/gitsigns.nvim", opts = {
		signcolumn = true,
	} },
	{ "brenoprata10/nvim-highlight-colors", opts = {} },
}
