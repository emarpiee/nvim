-- NOTE: 
-- ys = add surround
-- ds = delete surround
-- cs = change surround
--
-- Examples:
-- ys" = surround text with double quote
-- ds{ = delete surrounded brackets
-- cs({ = change parenthesis to brackets
--
--
return{
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end
}
