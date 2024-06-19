-- Git source for nvim-cmp
-- https://github.com/petertriho/cmp-git
--
-- obtained from
--    https://code.mehalter.com/AstroNvim_user/~files/42dca1b/lua/plugins/cmp-git.lua
--
---@type LazySpec
return {
  "petertriho/cmp-git",
  ft = { "gitcommit", "octo" },
  dependencies = { "hrsh7th/nvim-cmp" },
  opts = function(plugin, opts)
    opts.filetypes = require("lazy.core.plugin").values(assert(require("astrocore").get_plugin(plugin.name)), "ft")
  end,
  config = function(_, opts)
    local cmp = require("cmp")
    if opts.filetypes then
      cmp.setup.filetype(opts.filetypes, {
        sources = cmp.config.sources({ { name = "git" } }, { { name = "buffer" } }),
      })
    end
    require("cmp_git").setup(opts)
  end,
}
