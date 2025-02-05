return {
  'VonHeikemen/fine-cmdline.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'  -- Required dependency
  },
  config = function()
    require('fine-cmdline').setup()
    -- Map ":" to open fine-cmdline
    vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
  end
}
