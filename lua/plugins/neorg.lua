-- organizing your life in Neovim
-- https://github.com/nvim-neorg/neorg
--
-- obtained from
--    https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/note-taking/neorg/init.lua
--
---@type LazySpec
return {
  "nvim-neorg/neorg",
  enabled = false,
  event = "VeryLazy",
  ft = {
    "norg",
    -- "org",
  },
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.keybinds"] = {    -- Adds default keybindings
          config = {
            default_keybindings = true,
          },
        },
        ["core.journal"] = {},  -- Enables support for the journal module
        ["core.completion"] = { -- Enables support for completion plugins
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.dirman"] = {     -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/orgfiles/notes/",
              work = "~/orgfiles/work/"
            },
            default_workspace = "notes",
            index = "index.norg",
          },
        },
        ["core.export"] = {},   -- Enable support for exporting to different format
      },
    })
  end,
}

