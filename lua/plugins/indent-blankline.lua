-- indent guides in neovim
-- https://github.com/lukas-reineke/indent-blankline.nvim
--
-- obtained from
--    https://github.com/AstroNvim/astrocommunity/blob/2bf7cfa/lua/astrocommunity/pack/rainbow-delimiter-indent-blankline/init.lua
--
---@type LazySpec
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  dependencies = { "HiPhish/rainbow-delimiters.nvim" },
  opts = function(_, opts)
    if not opts.scope then opts.scope = {} end
    opts.scope.show_start = true
    opts.scope.show_end = true
    opts.scope.highlight = vim.tbl_get(vim.g, "rainbow_delimiters", "highlight")
      or {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      }
  end,

  config = function(plugin, opts)
    require(plugin.main).setup(opts)

    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
