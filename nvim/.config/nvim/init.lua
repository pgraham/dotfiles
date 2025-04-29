vim.g.mapleader = ","

require("config.lazy")
require("config.remap")

-- Load plugin config
require("config.barbar")

function map(mode, k, cmd)
	vim.api.nvim_set_keymap(mode, k, cmd, { noremap = true, silent = true })
end

function nmap(k, cmd)
	map("n", k, cmd)
end

function imap(k, cmd)
	map("i", k, cmd)
end

function vmap(k, cmd)
	map("v", k, cmd)
end

-- Setup undo
local homePath = os.getenv("HOME") or "~"
local cachePath = os.getenv("XDG_CACHE_HOME") or homePath .. "/.cache"
local undoPath = cachePath .. "/nvim/undo"

local path = require("plenary.path")
local undoDir = path:new(undoPath)
undoDir:mkdir()

vim.opt.undofile = true
vim.opt.undodir = undoPath

require("display")
require("search")

vim.api.nvim_create_user_command("FixTabs", function()
	vim.opt.tabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.expandtab = true
	vim.cmd("%retab!")
end, {})
