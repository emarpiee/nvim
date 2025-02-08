return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			close_on_exit = true,
			float_opts = {
				border = "curved", -- 'single' | 'double' | 'shadow' | 'curved'
				width = 120,
				height = 40,
			},
			-- Create custom terminal commands (e.g., lazygit)
			terminals = {
				lazygit = {
					cmd = "lazygit",
					direction = "float",
					hidden = true,
				},
			},
		})
    vim.keymap.set("n", "<leader>t", "", {desc = "Terminal"})
		vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", { desc = "Horizontal Terminal" })
		vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", { desc = "Vertical Terminal" })
		vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "Floating Terminal" })

		-- Custom terminal launcher example (lazygit)
		vim.keymap.set("n", "<leader>gg", function()
			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
			lazygit:toggle()
		end, { desc = "Open lazygit" })
	end,
}
