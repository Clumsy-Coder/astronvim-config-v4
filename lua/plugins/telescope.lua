local prefix = "<Leader>f"

---@type LazySpec
return {
  -- Find, Filter, Preview, Pick. All lua, all the time.
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "meta/dotbot",
          ".git/",
          "!.github/",
        },
      },
      pickers = {
        find_files = {
          hidden = true, -- show hidden files
        },
      },
    },
  },
  -- File Browser extension for telescope.nvim
  -- https://github.com/nvim-telescope/telescope-file-browser.nvim
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
          mappings = {
            n = {
              [prefix] = {
                e = { "<cmd>Telescope file_browser<cr>", "File explorer" },
              },
            },
          },
        },
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.load_extension("file_browser")
    end,
  },
  -- Telescope.nvim extension that adds LuaSnip integration
  -- https://github.com/benfowler/telescope-luasnip.nvim
  {
    "benfowler/telescope-luasnip.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
          mappings = {
            n = {
              [prefix] = {
                s = { "<cmd>Telescope luasnip<cr>", "Find Snippets" },
              },
            },
          },
        },
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.load_extension("luasnip")
    end,
  },
}
