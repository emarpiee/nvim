-- Note that nvim-ts-autotag will not work unless you have treesitter parsers (like html) installed for a given filetype. See nvim-treesitter for installing parsers.

return {
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}
