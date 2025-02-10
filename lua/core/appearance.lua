-- Set colorscheme
vim.cmd.colorscheme("retrobox")

-- Modified colors.
vim.api.nvim_set_hl(0, "Normal", { bg = "#0d030f", fg = "#ebdbb2" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#4f125b", fg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { link = "Normal" }) -- this will set the sign column (the space before the number line) to transparent
vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1b081f", fg = "#ebdbb2" })
