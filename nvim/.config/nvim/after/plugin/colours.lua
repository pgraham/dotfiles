function Coolourful(colour, bg)
	colour = colour or 'gruvbox'
	bg = bg or 'dark'

	vim.cmd.colorscheme(colour)
	vim.o.background = bg

	-- Clear background for transparency
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

Coolourful()
