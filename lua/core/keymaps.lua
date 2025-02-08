-- NOTE: -- -- MAIN KEYMAPS -- -- --

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable spacebar in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- NOTE: ## FILE OPERATIONS

-- NOTE: ## SCROLLING

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- NOTE: ## WINDOW MANAGEMENT

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Split windows
vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>h", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Resize splits equally" })
vim.keymap.set("n", "<leader>xs", ":close<CR>", { desc = "Close split" })

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- NOTE: ## BUFFER MANAGEMENT

-- Buffer navigation
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts) -- Close buffer
vim.keymap.set("n", "<leader>b", "<cmd>enew<CR>", opts) -- New buffer

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- Open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- Close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) -- Next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) -- Previous tab

-- NOTE: ## MISCELLANEOUS

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode after shifting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked content when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- NOTE: ## DIAGNOSTICS

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Clear highlights on search when pressing <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Replace word under cursor across the buffer
vim.keymap.set(
	"n",
	"<leader>ra",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace all words under cursor" }
)

-- Jump to first/last line of the file
vim.keymap.set("n", "gg", "gg0")
vim.keymap.set("n", "G", "G$")

-- Select all text in the file
vim.api.nvim_set_keymap("n", "<C-a>", "gg0vG$", { noremap = true, silent = true })

-- Exit insert mode without pressing Esc
vim.keymap.set("i", "jj", "<Esc>")

-- Open HTML in Browser (cross-platform) -- -- --

vim.keymap.set({ "n", "v" }, "<leader>oh", function()
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

-- NOTE: ## FILE OPERATIONS

-- Save file
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", opts)

-- Save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w<CR>", opts)

-- Quit file
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", opts)

-- Delete single character without copying to register
vim.keymap.set("n", "x", '"_x', opts)

_G.FileOps = {}

function FileOps.delete_current_file()
	local file = vim.fn.expand("%:p")
	if file == "" then
		print("No file to delete!")
		return
	end
	vim.fn.delete(file)
	vim.cmd("bdelete!") -- Close buffer
	print("Deleted: " .. file)
end

function FileOps.create_new_file()
	local file = vim.fn.input("New file: ", "", "file")
	if file == "" then
		return
	end
	vim.cmd("edit " .. file) -- Open new file
	print("Created: " .. file)
end

function FileOps.copy_current_file()
	local file = vim.fn.expand("%:p")
	if file == "" then
		print("No file to copy!")
		return
	end
	local new_file = vim.fn.input("Copy to: ", file, "file")
	if new_file == "" then
		return
	end

	if vim.fn.has("win32") == 1 then
		vim.fn.system('copy "' .. file .. '" "' .. new_file .. '"')
	else
		vim.fn.system({ "cp", file, new_file })
	end

	print("Copied to: " .. new_file)
end

function FileOps.rename_current_file()
	local file = vim.fn.expand("%:p")
	if file == "" then
		print("No file to rename!")
		return
	end
	local new_name = vim.fn.input("Rename to: ", file, "file")
	if new_name == "" then
		return
	end

	if vim.fn.has("win32") == 1 then
		vim.fn.system('ren "' .. file .. '" "' .. new_name .. '"')
	else
		vim.fn.system({ "mv", file, new_name })
	end

	vim.cmd("edit " .. new_name) -- Open new file
	print("Renamed to: " .. new_name)
end

function FileOps.move_current_file()
	local file = vim.fn.expand("%:p")
	if file == "" then
		print("No file to move!")
		return
	end
	local new_path = vim.fn.input("Move to: ", file, "file")
	if new_path == "" then
		return
	end

	if vim.fn.has("win32") == 1 then
		vim.fn.system('move "' .. file .. '" "' .. new_path .. '"')
	else
		vim.fn.system({ "mv", file, new_path })
	end

	vim.cmd("edit " .. new_path) -- Open new file
	print("Moved to: " .. new_path)
end

-- Keymaps for File Management
vim.api.nvim_set_keymap("n", "<leader>fd", ":lua FileOps.delete_current_file()<CR>", { noremap = true, silent = true }) -- Delete file
vim.api.nvim_set_keymap("n", "<leader>fa", ":lua FileOps.create_new_file()<CR>", { noremap = true, silent = true }) -- Add new file
vim.api.nvim_set_keymap("n", "<leader>fc", ":lua FileOps.copy_current_file()<CR>", { noremap = true, silent = true }) -- Copy file
vim.api.nvim_set_keymap("n", "<leader>fr", ":lua FileOps.rename_current_file()<CR>", { noremap = true, silent = true }) -- Rename file
vim.api.nvim_set_keymap("n", "<leader>fm", ":lua FileOps.move_current_file()<CR>", { noremap = true, silent = true }) -- Move file

-- NOTE: -- -- CUSTOM KEYMAPS FOR PLUGINS -- -- --

-- mini.nvim
vim.keymap.set("n", "<leader>e", "<Cmd>lua MiniFiles.open()<CR>", { desc = "Open MiniFiles" })

-- snacks.nvim
vim.keymap.set("n", "<leader>sp", "<Cmd>lua Snacks.picker()<CR>", { desc = "Open MiniPicker" })

-- mason.nvim
vim.keymap.set("n", "<leader>Cm", "<Cmd>checkhealth mason<CR>", { desc = "Checkhealth Mason" })
