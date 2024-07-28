-- preview markdown in a browser
-- https://github.com/iamcco/markdown-preview.nvim

local prefix = "<Leader>m"

---@type LazySpec
return {
  "iamcco/markdown-preview.nvim",
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
            [prefix .. "r"] = { "<cmd>MarkdownPreview<cr>", desc = "Render Markdown in browser" },
            [prefix .. "s"] = { "<cmd>MarkdownPreviewStop<cr>", desc = "Stop rendering Markdown in browser" },
            [prefix .. "t"] = { "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle rendering Markdown in browser" },
          },
        },
      },
    },
  },
  ft = { "markdown", "rmd" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}


