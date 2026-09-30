return {
	"saghen/blink.cmp",
	-- Optional: provides nice icons next to your completion items (LSP kinds)
	dependencies = "rafamadriz/friendly-snippets",

	-- Use a release tag to download pre-built binaries (highly recommended)
	version = "1.*",
	-- Alternatively, if you want the latest development changes, use the 'main' branch and build from source:
	-- branch = 'main',
	-- build = 'cargo build --release',

	opts = {
		-- 'default' for mappings similar to vscode & a casual nvim-cmp user
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but enter to accept
		-- See the full list in the docs: https://saghen.dev
		keymap = {
			preset = "default",
		},

		completion = {
			menu = {
				auto_show = false,
			},
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
