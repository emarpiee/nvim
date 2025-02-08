return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")

		mc.setup()

    vim.keymap.set("n", "<leader>m", "", {desc = "Multicursor"})

		-- Add or skip cursor above/below the main cursor.
		vim.keymap.set({ "n", "v" }, "<up>", function()
			mc.lineAddCursor(-1)
		end)
		vim.keymap.set({ "n", "v" }, "<down>", function()
			mc.lineAddCursor(1)
		end)
		vim.keymap.set({ "n", "v" }, "<leader>m<up>", function()
			mc.lineSkipCursor(-1)
		end, { desc = "Line Skip Cursor (Up)" })
		vim.keymap.set({ "n", "v" }, "<leader>m<down>", function()
			mc.lineSkipCursor(1)
		end, { desc = "Line Skip Cursor (Down)" })

		-- Add or skip adding a new cursor by matching word/selection
		vim.keymap.set({ "n", "v" }, "<leader>mn", function()
			mc.matchAddCursor(1)
		end, { desc = "Add next matching word/selection" })
		vim.keymap.set({ "n", "v" }, "<leader>ms", function()
			mc.matchSkipCursor(1)
		end, { desc = "Skip next matching word/selection" })
		vim.keymap.set({ "n", "v" }, "<leader>mN", function()
			mc.matchAddCursor(-1)
		end, { desc = "Add prev matching word/selection" })
		vim.keymap.set({ "n", "v" }, "<leader>mS", function()
			mc.matchSkipCursor(-1)
		end, { desc = "Skip prev matching word/selection" })

		-- Add all matches in the document
		vim.keymap.set({ "n", "v" }, "<leader>mA", mc.matchAllAddCursors, { desc = "Add all matches" })

		-- You can also add cursors with any motion you prefer:
		-- vim.keymap.set("n", "<right>", function()
		--     mc.addCursor("w")
		-- end)
		-- vim.keymap.set("n", "<leader><right>", function()
		--     mc.skipCursor("w")
		-- end)

		-- Rotate the main cursor.
		vim.keymap.set({ "n", "v" }, "<left>", mc.nextCursor)
		vim.keymap.set({ "n", "v" }, "<right>", mc.prevCursor)

		-- Delete the main cursor.
		vim.keymap.set({ "n", "v" }, "mX", mc.deleteCursor, { desc = "Delete the main cursor" })

		-- Add and remove cursors with control + left click.
		vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)

		-- Easy way to add and remove cursors using the main cursor.
		vim.keymap.set({ "n", "v" }, "mA", mc.toggleCursor, { desc = "Add/Remove cursors using the main cursor" })

		-- Clone every cursor and disable the originals.
		vim.keymap.set(
			{ "n", "v" },
			"<leader><c-q>",
			mc.duplicateCursors,
			{ desc = "Duplicate every cursor and disable the originals" }
		)

		vim.keymap.set("n", "<esc>", function()
			if not mc.cursorsEnabled() then
				mc.enableCursors()
			elseif mc.hasCursors() then
				mc.clearCursors()
			elseif vim.cmd("nohlsearch") then
			else
				-- Default <esc> handler.
			end
		end)

		-- bring back cursors if you accidentally clear them
		vim.keymap.set("n", "<leader>mv", mc.restoreCursors, { desc = "Restore prev deleted cursor(s)" })

		-- Align cursor columns.
		vim.keymap.set("n", "<leader>ma", mc.alignCursors, { desc = "Alin cursor (column)" })

		-- Split visual selections by regex.
		vim.keymap.set("v", "S", mc.splitCursors)

		-- Append/insert for each line of visual selections.
		vim.keymap.set("v", "I", mc.insertVisual)
		vim.keymap.set("v", "A", mc.appendVisual)

		-- match new cursors within visual selections by regex.
		vim.keymap.set("v", "M", mc.matchCursors)

		-- Rotate visual selection contents.
		vim.keymap.set("v", "<leader>mt", function()
			mc.transposeCursors(1)
		end, { desc = "Transpose cursor (1)" })
		vim.keymap.set("v", "<leader>mT", function()
			mc.transposeCursors(-1)
		end, { desc = "Transpose cursor (-1)" })

		-- Jumplist support
		vim.keymap.set({ "v", "n" }, "<c-i>", mc.jumpForward)
		vim.keymap.set({ "v", "n" }, "<c-o>", mc.jumpBackward)

		-- Customize how cursors look.
		local hl = vim.api.nvim_set_hl
		hl(0, "MultiCursorCursor", { link = "Cursor" })
		hl(0, "MultiCursorVisual", { link = "Visual" })
		hl(0, "MultiCursorSign", { link = "SignColumn" })
		hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
		hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
		hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
	end,
}
