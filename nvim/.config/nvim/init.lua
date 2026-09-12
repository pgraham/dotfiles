vim.g.mapleader = ","

function Map(mode, k, cmd)
	vim.api.nvim_set_keymap(mode, k, cmd, { noremap = true, silent = true })
end

function Nmap(k, cmd)
	Map("n", k, cmd)
end

function Imap(k, cmd)
	Map("i", k, cmd)
end

function Vmap(k, cmd)
	Map("v", k, cmd)
end

require("config.lazy")
require("config.remap")
require("config.folds")
require("config.quickfix")
require("config.display")
require("config.search")

-- Setup undo
local homePath = os.getenv("HOME") or "~"
local cachePath = os.getenv("XDG_CACHE_HOME") or homePath .. "/.cache"
local undoPath = cachePath .. "/nvim/undo"

local path = require("plenary.path")
local undoDir = path:new(undoPath)
undoDir:mkdir()

vim.opt.undofile = true
vim.opt.undodir = undoPath

vim.api.nvim_create_user_command("FixTabs", function()
	vim.opt.tabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.expandtab = true
	vim.cmd("%retab!")
end, {})
