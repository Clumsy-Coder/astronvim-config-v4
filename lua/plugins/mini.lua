-- using plugins from `mini`
-- https://github.com/echasnovski/mini.nvim
--
---@type LazySpec
return {
  -- Add, delete, replace, find, highlight surrounding (like pair of parenthesis, quotes, etc.).
  -- https://github.com/echasnovski/mini.surround
  {
    "echasnovski/mini.surround",
    config = function() require("mini.surround").setup() end,
  },
  -- Automatic highlighting of word under cursor
  -- https://github.com/echasnovski/mini.cursorword
  {
    "echasnovski/mini.cursorword",
    config = function() require("mini.cursorword").setup() end,
  },
  -- Animate common Neovim actions
  -- https://github.com/echasnovski/mini.animate
  { "echasnovski/mini.animate" ,
    config = function() require("mini.animate").setup() end,
  },
}
