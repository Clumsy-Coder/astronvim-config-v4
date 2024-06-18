-- open files from terminal in current neovim instance
-- https://github.com/willothy/flatten.nvim
--
---@type LazySpec
return {
  "willothy/flatten.nvim",
  lazy = false,
  priority = 1001,
  opts = {
    window = {
      open = "vsplit",
    },
  },
}
