return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		-- Better Around/Inside textobjects
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
		require("mini.move").setup()

		require("mini.bracketed").setup()

		require("mini.files").setup({
      windows = {
        preview = true,
      },
    })

		require("mini.jump").setup()

		require("mini.surround").setup()

		require("mini.sessions").setup()

		require("mini.pairs").setup()
	end,
}
