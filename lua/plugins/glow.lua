-- A markdown preview directly in your neovim.
-- https://github.com/ellisonleao/glow.nvim

local prefix = "<Leader>m"

---@type LazySpec
return {
  "ellisonleao/glow.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            [prefix] = {
              -- use markdown icon from nvim-tree/nvim-web-devicons
              desc = require("nvim-web-devicons").get_icon_by_filetype("markdown") .. " Markdown",
            },
            [prefix .. "g"] = { desc = "Glow" },
            [prefix  .. "gp"] = { "<cmd>Glow<cr>", desc = "Preview Markdown (using glow)" },
          },
        },
      },
    },
  },
  ft = { "markdown", "rmd" },
  -- opts = require("user.plugins.glow.config"),
  opts = {
    border = "rounded",
    style = "dark",
    width = 150,
  },
  -- config = function()
  --   require("glow").setup()
  -- end,
}
