local function build_select_command(textobject)
	return string.format(
		"<cmd>lua require('nvim-treesitter-textobjects.select').select_textobject('%s', 'textobjects')<cr>",
		textobject
	)
end

local function build_swap_command(textobject, direction)
	return string.format(
		"<cmd>lua require('nvim-treesitter-textobjects.swap').swap_%s('%s')<cr>",
		direction,
		textobject
	)
end

local function set_textobject_keymap(key, textobject)
	vim.keymap.set({ "o", "x" }, key, build_select_command(textobject))
end

local function set_swap_keymap(key, textobject, direction)
	vim.keymap.set("n", key, build_swap_command(textobject, direction))
end

return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	init = function()
		vim.g.no_plugin_maps = true
	end,
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			},
		})

		set_textobject_keymap("aa", "@parameter.outer")
		set_textobject_keymap("ia", "@parameter.inner")
		set_textobject_keymap("af", "@function.outer")
		set_textobject_keymap("if", "@function.inner")
		set_textobject_keymap("ac", "@call.outer")
		set_textobject_keymap("ic", "@call.inner")
		set_textobject_keymap("ax", "@attribute.outer")
		set_textobject_keymap("ix", "@attribute.inner")

		set_swap_keymap("<leader>sa", "@parameter.inner", "next")
		set_swap_keymap("<leader>Sa", "@parameter.inner", "previous")
	end,

	opts = {
		select = {
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
		},
	},
}
