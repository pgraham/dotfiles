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
		'go',
	},
	highlight = { enable = true },
	indent = { enable = true },
}
