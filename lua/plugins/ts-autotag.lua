-- Note that nvim-ts-autotag will not work unless you have treesitter parsers (like html) installed for a given filetype. See nvim-treesitter for installing parsers.

return {
	"windwp/nvim-ts-autotag",
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
	-- Also override individual filetype configs, these take priority.
	-- Empty by default, useful if one of the "opts" global settings
	-- doesn't work well in a specific filetype
	per_filetype = {
		["html"] = {
			enable_close = false,
		},
	},
}
