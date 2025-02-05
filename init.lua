require("core.keymaps")
require("core.options")

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- NOTE: ## MANAGER
	--
	-- Portable package manager
	require("plugins.mason"),

	-- NOTE: ## CODE QUALITY
	--
	require("plugins.treesitter"),

	-- NOTE: ## PRODUCTIVITY & EDITING ENHANCEMENTS
	--
	-- Collection of independent Lua modules
	require("plugins.mini-nvim"),

	-- Shows available keybindings in a popup as you type
	require("plugins.which-key"),

	-- A collection of small QoL pluins for Neovim
	require("plugins.snacks"),

	-- Multiple curosrs
	require("plugins.vim-visual-multi"),

	-- nvim-cmp, this is required for Mason LSP
	require("plugins.autocompletion"),

	-- Add/change/delete surrounding delimiter pairs with ease.
	require("plugins.surround"),

	-- Code formatter
	require("plugins.formatter"),

	-- Auto pair tags (required treesitter)
	require("plugins.ts-autotag"),

	-- Auto close brackets, quotes, etc
	-- require("plugins.autopairs"),

	-- NOTE: ## NAVIGATION
	--
	-- Fuzzy Finder
	require("plugins.telescope"),

	-- NOTE: ## GIT & VERSION CONTROL
	--
	-- Git integration for buffers
	require("plugins.gitsigns"),

	-- NOTE: ## UI & APPEARANCE
	--
	require("plugins.colortheme"),

	-- Buffer/tab management
	require("plugins.bufferline"),

	-- Status line
	require("plugins.lualine"),

	-- Highlight, list and search todo comments in your projects
	require("plugins.todo"),

	-- Color highlighter
	require("plugins.colorizer"),

	-- plugin to help easily manage multiple terminal windows
	require("plugins.toggleterm"),

	-- NOTE: ## GAMES
	--
	-- smol game to make you better with vim
	require("plugins.vimbegood"),

	-- NOTE: ## OTHER
	--
	-- require 'plugins.obsidian',
})

-- NOTE: ## MODIFICATIONS
-- Set colorscheme
vim.cmd.colorscheme("retrobox")

-- Modified colors.
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000", fg = "#ffffff" })
