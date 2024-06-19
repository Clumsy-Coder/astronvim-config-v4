-- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
-- https://github.com/folke/noice.nvim
--
-- obtained from
--    https://code.mehalter.com/AstroNvim_user/~files/76443b5/lua/plugins/noice.lua
--
---@type LazySpec
return {
  {
    "folke/noice.nvim",
    -- enabled = false,
    event = "VeryLazy",
    dependencies = { "rcarriga/nvim-notify", init = false, config = true },
    opts = {
      cmdline = {
        enabled = true,
        -- view = "cmdline"
      },
      messages = { view_search = false },
      lsp = {
        progress = { enabled = false },
        hover = { enabled = false },
        signature = { enabled = false },
      },
      routes = {
        { filter = { event = "msg_show", cmdline = "^:lua"            }, view = "messages"      }, -- send lua output to split
        { filter = { event = "msg_show", min_height = 20              }, view = "messages"      }, -- send long messages to split
        { filter = { event = "msg_show", find = "%d+L,%s%d+B"         }, opts = { skip = true } }, -- skip save notifications
        { filter = { event = "msg_show", find = "^%d+ more lines$"    }, opts = { skip = true } }, -- skip paste notifications
        { filter = { event = "msg_show", find = "^%d+ fewer lines$"   }, opts = { skip = true } }, -- skip delete notifications
        { filter = { event = "msg_show", find = "^%d+ lines yanked$"  }, opts = { skip = true } }, -- skip yank notifications
      },
    },
  },
  {
    "catppuccin",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { noice = true } },
  },
}
