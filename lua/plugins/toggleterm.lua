return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require('toggleterm').setup({
      direction = 'float',
      close_on_exit = true,
      float_opts = {
        border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved'
        width = 120,
        height = 40,
      },
      -- Create custom terminal commands (e.g., lazygit)
      terminals = {
        lazygit = {
          cmd = "lazygit",
          direction = 'float',
          hidden = true
        }
      }
    })
    -- Example custom keybinds:
    -- Open terminal in horizontal split
    vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Open horizontal terminal' })
    -- Open terminal in vertical split
    vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', { desc = 'Open vertical terminal' })
    -- Open floating terminal
    vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Open floating terminal' })

    -- Custom terminal launcher example (lazygit)
    vim.keymap.set('n', '<leader>gg', function()
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
      lazygit:toggle()
    end, { desc = 'Open lazygit' })
  end
}
