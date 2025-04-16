local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({ "tpope/vim-sleuth" })
	use({ "tpope/vim-repeat" })
	use({ "tpope/vim-fugitive" })
	use({ "tpope/vim-surround" })
	use({ "tpope/vim-commentary" })
	use({ "tpope/vim-eunuch" })
	use({ "nvim-lua/plenary.nvim" })

	-- Theme
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "nvim-tree/nvim-web-devicons" })
	use({ "romgrk/barbar.nvim", wants = "nvim-web-devicons" })
	use({ "lewis6991/gitsigns.nvim" })

	-- Text objects, motion
	use({ "b4winckler/vim-angry" })
	use({ "kana/vim-textobj-user" })
	use({ "inside/vim-textobj-jsxattr" })
	use({ "kana/vim-textobj-line" })
	use({ "bkad/CamelCaseMotion" })
	use({ "andrewradev/sideways.vim" })

	-- Navigation
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "mbbill/undotree" })

	-- LSP
	-- LSP Support
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "neovim/nvim-lspconfig" })

	-- Autocompletion
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/nvim-cmp" })

	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- Snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })

	use({
		"nvimdev/lspsaga.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("lspsaga").setup({})
		end,
	})

	-- Formatting
	use({ "mhartington/formatter.nvim" })
	use({ "windwp/nvim-ts-autotag" })
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- Highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
