-- NOTE: -- -- MAIN KEYMAPS -- -- --

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Disable default mappings
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
map({ "n", "v" }, "s", "<Nop>", { silent = true })

-- NOTE: ## FILE OPERATIONS

map("n", "<leader>f", "", { desc = "File / Find" })
map("n", "<leader>fc", function()
	vim.cmd("edit " .. vim.fn.stdpath("config") .. "/init.lua")
end, { desc = "Find config" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<C-q>", "<cmd>q<CR>", { desc = "Quit" })

-- NOTE: ## SCROLLING

-- Vertical scroll and center
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- NOTE: WINDOW MANAGEMENT

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- NOTE: ## BUFFER MANAGEMENT
map("n", "<leader>b", "", { desc = "BUFFERS" })
map("n", "<leader>bb", ":b#<CR>", { desc = "Switch to previous buffer" })
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete current buffer" })
map("n", "<leader>bl", ":buffers<CR>", { desc = "List buffers" })
map("n", "<leader>bf", ":bfirst<CR>", { desc = "First buffer" })
map("n", "<leader>bk", ":blast<CR>", { desc = "Last buffer" })
map("n", "<leader>bw", ":bufdo w<CR>", { desc = "Write all buffers" })
map("n", "<leader>ba", ":%bd|e#|bd#<CR>", { desc = "Close all except current" })
map("n", "<leader>bL", ":silent! exec '1,' . (bufnr('%') - 1) . 'bd'<CR>", { desc = "Delete buffers to the left" })
map("n", "<leader>bR", ":silent! exec (bufnr('%') + 1) . ',$bd'<CR>", { desc = "Delete buffers to the right" })
map("n", "<leader>x", ":bdelete<CR>", { desc = "Close current buffer" })

-- Telescope
map("n", "<leader>be", ":Telescope buffers<CR>", { desc = "Open Buffer Explorer" })

-- NOTE: ## TABS
map("n", "<leader><tab>", "", { desc = "TABS" })
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- NOTE: ## DIAGNOSTICS

map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- NOTE: ## MISCELLANEOUS

-- Toggle line wrapping
map("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode after shifting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Keep last yanked content when pasting
map("v", "p", '"_dP', opts)

-- Delete single character without copying to register
map("n", "x", '"_x', opts)

-- Jump to first/last line of the file
map("n", "gg", "gg0")
map("n", "G", "G$")

-- Clear highlights on search when pressing <Esc>
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Replace word under cursor across the buffer
map(
	"n",
	"<leader>ra",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace all words under cursor" }
)

-- Select all text in the file
vim.api.nvim_set_keymap("n", "<C-a>", "gg0vG$", { noremap = true, silent = true })

-- Exit insert mode without pressing Esc
map("i", "jj", "<Esc>")

-- Open HTML in Browser (cross-platform) -- -- --

map({ "n", "v" }, "<leader>fh", function()
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
map("n", "<leader>e", "<Cmd>lua MiniFiles.open()<CR>", { desc = "Explorer MiniFiles (root dir)" })
