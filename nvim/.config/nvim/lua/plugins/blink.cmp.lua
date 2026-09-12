return {
	"saghen/blink.cmp",
	-- Optional: provides nice icons next to your completion items (LSP kinds)
	dependencies = "rafamadriz/friendly-snippets",

	-- Use a release tag to download pre-built binaries (highly recommended)
	version = "*",
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
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
		},
		auto = {
			-- Automatically select the first item in the completion menu
			select_first = true,
		},

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful if your colorscheme doesn't support blink.cmp yet
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons don't overlap text
			nerd_font_variant = "mono",
		},

		-- Default list of enabled providers defined by blink.cmp itself
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		-- Optional: Enable documentation preview and signature help out-of-the-box
		signature = { enabled = true },
		completion = {
			menu = {
				auto_show = false, -- This is the magic line
			},
			-- Optional: Turn off auto-brackets so they don't insert without the menu open
			ghost_text = { enabled = false },
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
		},
		-- trigger autocomplete on '.' or '::')
		trigger = {
			signature = { enabled = true },
			completion = {
				show_on_trigger_character = true,
			},
		},
	},
	opts_extend = { "sources.default" },
}
