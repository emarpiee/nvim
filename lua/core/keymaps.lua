-- NOTE: -- -- MAIN KEYMAPS -- -- --

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

-- Disable default mappings
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v" }, "s", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v" }, "<C-n>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v" }, "<C-p>", "<Nop>", { silent = true })

-- NOTE: ## FILE OPERATIONS

vim.keymap.set("n", "<leader>f", "", { desc = "File / Find" })
vim.keymap.set("n", "<leader>fc", function()
	vim.cmd("edit " .. vim.fn.stdpath("config") .. "/init.lua")
end, { desc = "Find config" })
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", { desc = "Quit" })

-- NOTE: ## SCROLLING

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- NOTE: WINDOW MANAGEMENT

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- NOTE: ## BUFFER MANAGEMENT
vim.keymap.set("n", "<leader>b", "", { desc = "BUFFERS" })
vim.keymap.set("n", "<leader>bb", ":b#<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>bl", ":buffers<CR>", { desc = "List buffers" })
vim.keymap.set("n", "<leader>bf", ":bfirst<CR>", { desc = "First buffer" })
vim.keymap.set("n", "<leader>bk", ":blast<CR>", { desc = "Last buffer" })
vim.keymap.set("n", "<leader>bw", ":bufdo w<CR>", { desc = "Write all buffers" })
vim.keymap.set("n", "<leader>ba", ":%bd|e#|bd#<CR>", { desc = "Close all except current" })
vim.keymap.set(
	"n",
	"<leader>bL",
	":silent! exec '1,' . (bufnr('%') - 1) . 'bd'<CR>",
	{ desc = "Delete buffers to the left" }
)
vim.keymap.set(
	"n",
	"<leader>bR",
	":silent! exec (bufnr('%') + 1) . ',$bd'<CR>",
	{ desc = "Delete buffers to the right" }
)
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close current buffer" })

-- Telescope
vim.keymap.set("n", "<leader>be", ":Telescope buffers<CR>", { desc = "Open Buffer Explorer" })

-- NOTE: ## TABS
vim.keymap.set("n", "<leader><tab>", "", { desc = "TABS" })
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- NOTE: ## DIAGNOSTICS

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- NOTE: ## MISCELLANEOUS

-- Insert test to first line.
vim.keymap.set({ "n", "v" }, "<C-p>", "ggO", opts)

-- Insert test to last line.
vim.keymap.set({ "n", "v" }, "<C-n>", "Go", opts)

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", ":set wrap!<CR>", { desc = "Toggle Line Wrap" })

-- Stay in indent mode after shifting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked content when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Delete single character without copying to register
vim.keymap.set("n", "x", '"_x', opts)

-- Don't yank on 'change'
vim.keymap.set("n", "c", '"_c', opts)

-- Jump to first/last line of the file
vim.keymap.set("n", "gg", "gg0")
vim.keymap.set("n", "G", "G$")

-- Clear highlights on search when pressing <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Replace word under cursor across the buffer
vim.keymap.set(
	"n",
	"<leader>ra",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace all words under cursor" }
)

-- Select all text in the file
vim.api.nvim_set_keymap("n", "<C-a>", "gg0vG$", { noremap = true, silent = true })

-- Exit insert mode without pressing Esc
vim.keymap.set("i", "jj", "<Esc>")

-- Open HTML in Browser (cross-platform) -- -- --

vim.keymap.set({ "n", "v" }, "<leader>fh", function()
	local filename = vim.fn.expand("%:t")
	if filename:match("%.html$") or filename:match("%.htm$") then
		local os_name = vim.loop.os_uname().sysname
		if os_name == "Darwin" then
			-- macOS
			vim.cmd("silent !open %")
		elseif os_name == "Linux" then
			-- Linux
			vim.cmd("silent !xdg-open %")
		elseif os_name == "Windows_NT" then
			-- Windows
			vim.cmd("silent !start explorer %")
		else
			print("Unsupported OS.")
		end
	else
		print("This is not an HTML file.")
	end
end, { desc = "Open HTML file in system browser" })

-- NOTE: -- -- CUSTOM KEYMAPS FOR PLUGINS -- -- --

-- mini.nvim
vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "Explorer MiniFiles (root dir)" })

-- cder (telescope)
vim.keymap.set("n", "<leader>fd", ":Telescope cder <CR>", { desc = "Change working directory" })

-- ccc.nvim
vim.keymap.set("n", "<C-p>", ":CccPick <CR>", opts)

-- keypmap to delete all the scratch buffers created by snacks.nvim (scratch)
vim.keymap.set("n", "<leader>bD", function()
	-- Define scratch directory paths
	local scratch_path = vim.fn.expand("~/.local/share/nvim/scratch") -- Unix default
	if vim.fn.has("win32") == 1 then
		scratch_path = vim.fn.expand("~/AppData/Local/nvim-data/scratch") -- Windows path
	end

	-- Check if the scratch directory exists
	if vim.fn.isdirectory(scratch_path) == 0 then
		vim.notify("Scratch folder does not exist: " .. scratch_path, vim.log.levels.WARN)
		return
	end

	-- Build the delete command
	local cmd
	if vim.fn.has("win32") == 1 then
		-- PowerShell 7 (uses pwsh for Windows)
		cmd = string.format(
			"pwsh -NoProfile -ExecutionPolicy Bypass -Command \"Remove-Item -Path '%s\\*' -Recurse -Force\"",
			scratch_path
		)
	else
		-- Unix/Linux/macOS
		cmd = string.format('rm -rf "%s"/*', scratch_path)
	end

	-- Execute command asynchronously
	vim.fn.jobstart(cmd, {
		on_exit = function(_, code)
			if code == 0 then
				vim.notify("Cleared scratch buffers in: " .. scratch_path, vim.log.levels.INFO)
			else
				vim.notify("Failed to clear scratch buffers", vim.log.levels.ERROR)
			end
		end,
		stdout_buffered = true,
		stderr_buffered = true,
	})
end, { noremap = true, silent = true, desc = "Delete all scratch buffers (Snacks.scratch)" })
