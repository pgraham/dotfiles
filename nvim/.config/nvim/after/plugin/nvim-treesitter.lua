require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		'typescript',
		'tsx',
		'javascript',
		'json',
		'css',
		'lua',
		'sql',
		'html',
	},
	highlight = { enable = true },
	indent = { enable = true },
}
